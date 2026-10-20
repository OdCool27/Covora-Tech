# Covora Tech Store

Covora Tech Store is an ASP.NET Web Forms shopping application targeting **.NET Framework 4.8**. It presents a responsive catalogue of everyday technology accessories and provides session-based shopping-cart functionality.

## Technology stack

- ASP.NET Web Forms on .NET Framework 4.8
- C# code-behind
- Bootstrap CSS and JavaScript
- ASP.NET Session state for the shopping cart
- In-memory sample product catalogue (no database currently used)

## Running the application

1. Open `Covora Tech Store.slnx` in Visual Studio.
2. Build the solution.
3. Run the web application with IIS Express or a configured ASP.NET development server.
4. Browse the Home, Products, About Us, Contact Us, and cart pages from the shared navigation.

Prices are displayed in Jamaican dollars (JMD), and the catalogue data is defined in `Covora Tech Store/Models/ProductCatalog.cs`.

## Project structure

```text
Covora Tech Store/
├── Default.aspx                         Home page and featured product
├── Products.aspx                        Product catalogue page
├── About.aspx                           Company information
├── Contact.aspx                         Company contact details
├── Cart.aspx                            Responsive shopping-cart view
├── Site.Master                          Shared layout, navigation and footer
├── Site.Mobile.Master                   Mobile master-page support
├── Controls/ProductCards.ascx            Reusable product-card presentation
├── Models/Product.cs                    Product model
├── Models/ProductCatalog.cs             In-memory catalogue data
├── Models/CartItem.cs                   Cart item and subtotal calculation
├── Content/bootstrap*.css               Bootstrap styles
├── Content/Site.css                     Brand and application styles
├── Scripts/bootstrap*.js                Bootstrap behavior
├── assets/                              Product, logo and cart images
├── NotFound.aspx                        Custom 404 page
├── InternalError.aspx                   Custom application-error page
└── Web.config                           .NET configuration and custom errors
```

## Requirements cross-reference

### Milestone 1 – Create a Responsive Web Application

| Requirement | Implementation and evidence | Status |
|---|---|---|
| 1. Customer can navigate the website | `Site.Master` provides shared Home, Products, About Us and Contact Us links, plus a cart link. The master page is used by the content pages. | Complete |
| 2a. Home page with featured products | `Default.aspx` displays the hero content and the reusable `ProductCards` control with `FeaturedOnly="true"`. | Complete |
| 2b. Products page with at least three products | `Products.aspx` renders `Controls/ProductCards.ascx`. `Models/ProductCatalog.cs` defines four products. Each card displays the ID, name, description, category, unit price and image. | Complete |
| 2c. About Us page | `About.aspx` contains the Covora Tech story, purpose and company information. | Complete |
| 2d. Contact Us page | `Contact.aspx` lists email, telephone, location and opening hours. | Complete |
| 3. Consistent look and feel | All main pages use `Site.Master`. The master page supplies the shared HTML5 layout, navigation, footer, Bootstrap references and `Content/Site.css`. | Complete |
| 4. Mobile responsive design | Bootstrap responsive grid and utility classes are used throughout the master page, product cards, content pages and cart. The viewport meta tag and mobile/desktop cart layouts are defined in `Site.Master` and `Cart.aspx`. | Complete |

### Milestone 2 – State Management and Error Handling

| Requirement | Implementation and evidence | Status |
|---|---|---|
| 5a. Add products and enter quantity | `ProductCards.ascx` provides a quantity dropdown for each product. `ProductCards.ascx.cs` reads the selected quantity and stores the item in `Session["Cart"]`. | Complete |
| 5b. Calculate subtotal | `Models/CartItem.cs` calculates `Subtotal` using `UnitPrice * Quantity`. | Complete |
| 6a. View cart items, quantities and subtotals | `Cart.aspx` uses a responsive mobile `Repeater` and a desktop/tablet `GridView` to display each item, quantity, unit price and subtotal. | Complete |
| 6b. Display grand total as the sum of subtotals | `Cart.aspx.cs` calculates the total from the cart items and displays it in the cart footer/mobile summary. The current implementation additionally applies 15% tax, so the displayed value is labelled as including tax rather than being only the sum of subtotals. | Partial — verify whether tax should be removed to match the stated formula exactly. |
| 7. Remove products and update total | Remove commands are implemented for both the mobile repeater and desktop grid. The session cart and cart count are updated, then the cart is rebound. | Complete |
| 8. Handle errors with custom pages | `NotFound.aspx` and `InternalError.aspx` are configured in `Web.config` for 404 and 500/application errors. | Partial — verify the IIS custom-error path in `Web.config` uses `InternalError.aspx` consistently; the current `system.webServer` 500 path is `InternalErrors.aspx` (plural). |

## Shopping-cart state

The cart is maintained per user session:

- `Session["Cart"]` stores `List<CartItem>`.
- `Session["CartCount"]` stores the current number of cart entries.
- Adding an existing product increases its quantity.
- Removing an item updates the session and refreshes the cart display.

## Known implementation notes

- Product data is sample data and is not persisted in a database.
- The checkout button is present in `Cart.aspx` but is currently hidden because no checkout page is implemented.
- The cart currently adds 15% tax to the displayed grand total. If the assessment requires `grand total = sum of subtotals` with no tax, the tax calculation and labels in `Cart.aspx.cs` should be removed or changed.
- The IIS 500 custom-error configuration should be checked because the configured path currently differs from the available `InternalError.aspx` file name.
