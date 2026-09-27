<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCards.ascx.cs" Inherits="Covora_Tech_Store.Controls.ProductCards" %>
<%-- Bootstrap row and g-4 provide the product grid and gutters. --%>
<div class="row g-4">
    <asp:Repeater ID="ProductRepeater" runat="server" ItemType="Covora_Tech_Store.Models.Product">
        <ItemTemplate>
            <%-- Featured cards fill the row. The catalogue uses one column on phones, two from md (768px), and three from lg (992px). --%>
            <div class='<%# FeaturedOnly ? "col-12" : "col-12 col-md-6 col-lg-4" %>'>
                <%-- Bootstrap card and h-100 keep cards in each grid row equal in height. --%>
                <article class="card product-card h-100">
                    <div class="product-media">
                        <asp:PlaceHolder runat="server" Visible="<%# !Item.HasImage %>">
                            <div class="product-placeholder" role="img" aria-label="<%#: Item.Name + ": product image coming soon" %>">
                                <span class="placeholder-mark" aria-hidden="true">CT</span>
                                <span aria-hidden="true"><%#: Item.Name %></span>
                                <small aria-hidden="true">Product image coming soon</small>
                            </div>
                        </asp:PlaceHolder>
                        <asp:Image runat="server" Visible="<%# Item.HasImage %>" ImageUrl="<%# Item.ImageUrl %>" AlternateText="<%# Item.Name %>" CssClass="product-image" />
                    </div>
                    <%-- Bootstrap card-body and flex-column arrange the content vertically; mt-auto pushes the price to the bottom.
                         visually-hidden keeps category and price labels available to screen readers. --%>
                    <div class="card-body d-flex flex-column">
                        <div class="product-meta">
                            <span class="product-category"><span class="visually-hidden">Category: </span><%#: Item.Category %></span>
                            <span class="product-id">ID: <%#: Item.Id %></span>
                        </div>
                        <h2 class="product-title"><%#: Item.Name %></h2>
                        <p class="product-description"><%#: Item.Description %></p>
                        <p class="product-price mt-auto mb-0"><span class="visually-hidden">Unit price: </span><%#: Item.DisplayPrice %></p>
                    </div>
                </article>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
