<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Covora_Tech_Store.Products" %>
<%@ Register Src="~/Controls/ProductCards.ascx" TagPrefix="store" TagName="ProductCards" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Bootstrap container centres the heading; lead styles the introductory paragraph. --%>
    <section class="page-heading" aria-labelledby="products-title">
        <div class="container">
            <p class="eyebrow">The collection</p>
            <h1 id="products-title">Find your everyday upgrade.</h1>
            <p class="lead">Useful accessories. Clear details. Prices in Jamaican dollars.</p>
        </div>
    </section>
    <section class="container section-space" aria-label="All products">
        <%-- Bootstrap flex utilities spread the labels across the row and allow wrapping; gap and margin utilities add spacing. --%>
        <div class="d-flex flex-wrap justify-content-between gap-2 mb-3">
            <p class="eyebrow mb-0">All products</p>
            <p class="text-muted small mb-0">Sample collection &middot; Unit prices in JMD</p>
        </div>
        <%-- The shared ProductCards control contains the Bootstrap responsive product grid. --%>
        <store:ProductCards runat="server" />
    </section>
</asp:Content>
