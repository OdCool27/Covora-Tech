from playwright.sync_api import sync_playwright
from pathlib import Path
out = Path(__file__).parent
with sync_playwright() as p:
    browser = p.chromium.launch(channel="msedge", headless=True)
    errors = []
    for width in [320, 390, 768, 1440]:
        options = dict(viewport={"width": width, "height": 900}, is_mobile=width < 768, has_touch=width < 768)
        if width < 768:
            options["user_agent"] = "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 Version/17.0 Mobile/15E148 Safari/604.1"
        context = browser.new_context(**options)
        page = context.new_page()
        page.on("pageerror", lambda e: errors.append(str(e)))
        page.on("response", lambda r: errors.append(str(r.status) + " " + r.url) if r.status >= 400 else None)
        for route, title in [("", "Home"), ("Products", "Products"), ("About", "About Us"), ("Contact", "Contact Us")]:
            assert page.goto("http://localhost:55189/" + route).status == 200
            assert page.title() == title + " | Covora Tech"
            assert page.locator("main").count() == 1
            assert page.locator("h1").count() == 1
            assert page.locator('nav [aria-current="page"]').inner_text() == title
            assert page.locator('link[href$="Content/Site.css"]').count() == 1
            assert page.locator('link[href*="bootstrap"]').count() == 1
            assert page.evaluate("getComputedStyle(document.body).backgroundColor") == "rgb(248, 249, 245)"
            assert page.evaluate("document.documentElement.scrollWidth <= innerWidth"), (width, route, "overflow")
            assert page.locator("img").evaluate_all("images => images.every(i => i.complete && i.naturalWidth > 0)")
            if route == "Products":
                assert page.locator(".product-card").count() == 3
                assert page.locator('.product-placeholder[role="img"]').count() == 3
                assert page.locator(".product-media img").count() == 0
                for text in ["CT-101", "CT-102", "CT-103", "JMD 8,900.00", "JMD 5,200.00", "JMD 6,500.00", "Audio", "Power", "Workspace"]:
                    assert text in page.locator("main").text_content()
                positions = page.locator(".product-card").evaluate_all("cards => cards.map(c => Math.round(c.getBoundingClientRect().top))")
                assert len(set(positions)) == (3 if width < 768 else 2 if width < 992 else 1), positions
            if width < 768:
                toggle = page.get_by_role("button", name="Toggle navigation")
                assert not page.locator("#storeNavigation").is_visible()
                toggle.click()
                page.wait_for_function('document.querySelector("#storeNavigation").classList.contains("show")')
                assert toggle.get_attribute("aria-expanded") == "true"
                assert page.evaluate("document.documentElement.scrollWidth <= innerWidth")
                toggle.click()
                page.wait_for_function('!document.querySelector("#storeNavigation").classList.contains("collapsing")')
                assert not page.locator("#storeNavigation").is_visible()
                assert toggle.get_attribute("aria-expanded") == "false"
            if width in [390, 1440] and route in ["", "Products"]:
                page.screenshot(path=str(out / (("home" if not route else "products") + "-" + str(width) + ".png")), full_page=True)
            print("PASS", width, route or "Home")
        for title in ["Home", "Products", "About Us", "Contact Us"]:
            if width < 768:
                page.get_by_role("button", name="Toggle navigation").click()
                page.wait_for_function('document.querySelector("#storeNavigation").classList.contains("show")')
            page.locator("nav").get_by_role("link", name=title, exact=True).click()
            page.wait_for_load_state()
            assert page.title() == title + " | Covora Tech"
        context.close()
    assert not errors, errors
    browser.close()
    print("PASS navigation, CSS, images, card columns and mobile menu; no browser errors or failed HTTP responses.")

