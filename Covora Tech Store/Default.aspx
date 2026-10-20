<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Covora_Tech_Store._Default" %>
<%@ Register Src="~/Controls/ProductCards.ascx" TagPrefix="store" TagName="ProductCards" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="hero" aria-labelledby="home-title">
        <%-- Bootstrap container centres the content, row and g-5 create a grid with gutters. --%>
        <div class="container">
            <div class="row g-5 align-items-center">
                <%-- Full-width columns stack below lg (992px), the introduction uses half the row on larger screens. --%>
                <div class="col-12 col-lg-6">
                    <p class="eyebrow">Everyday essentials</p>
                    <h1 id="home-title">Little upgrades.<br />Better everydays.</h1>
                    <p class="lead my-4">Welcome to Covora Tech. Discover useful technology and desk accessories for your routine, from your daily commute to your workspace.</p>

                    <%-- Bootstrap flex utilities wrap the action links; btn classes provide primary and outlined button styles. --%>
                    <div class="d-flex flex-wrap gap-2">
                        <a runat="server" href="~/Products" class="btn btn-primary">Browse products <span aria-hidden="true">&rarr;</span></a>
                        <a runat="server" href="~/About" class="btn btn-outline-secondary">Our story</a>
                    </div>
                </div>
                <%-- At lg, the featured card spans five columns with a one-column offset. --%>
                <div class="col-12 col-lg-5 offset-lg-1">
                    <p class="eyebrow">Featured favourite</p>
                    <store:ProductCards runat="server" FeaturedOnly="true" />
                </div>
            </div>
        </div>
    </section>

    <%-- Bootstrap pb-5 adds bottom padding; text-muted and fw-semibold style the supporting text and link. --%>
    <section class="container pb-5" aria-labelledby="collection-title">
        <p class="eyebrow">Selected for your daily routine</p>
        <h2 id="collection-title">Stay connected. Power up. Settle in.</h2>
        <p class="text-muted">Explore wireless earbuds, a portable power bank and a desk lamp, with clear details and prices in Jamaican dollars.</p>
        <a runat="server" href="~/Products" class="fw-semibold">Explore the full collection <span aria-hidden="true">&rarr;</span></a>
    </section>
</asp:Content>
