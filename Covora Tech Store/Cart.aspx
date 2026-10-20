<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Covora_Tech_Store.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

    <div class="container">
            <h2 class="m-4">My Shopping Cart</h2>

            <%--  Mobile View Repeater--%>
            <div class="d-md-none">
        

                <asp:Repeater ID="CartRepeater" runat="server" OnItemCommand="CartRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("ProductName") %></h5>
                                <p class="card-text">
                                    Quantity: <%# Eval("Quantity") %><br />
                                    Unit Price: <%# Eval("UnitPrice", "{0:C}") %><br />
                                    Subtotal: <%# Eval("Subtotal", "{0:C}") %>
                                </p>
                                <asp:Button runat="server" Text="Remove" CssClass="btn btn-danger btn-sm"
                                            CommandName="RemoveItem" CommandArgument='<%# Eval("ProductId") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <%-- Grand Total Display --%>
                <asp:Label ID="MobileGrandTotal" runat="server" CssClass="fw-bold d-block mb-3"></asp:Label>
            </div>

            <%--  Desktop/Tablet View Table--%>
            <div class="d-none d-md-block">
                <asp:GridView ID="CartGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                              OnRowCommand="CartGrid_RowCommand" ShowHeader="True" EmptyDataText="There are no items currently in your cart."
                              ShowFooter="True" OnRowDataBound="CartGrid_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ProductId" HeaderText="Product ID" ReadOnly="True" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                        <%--Remove Btn --%>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="RemoveBtn" runat="server" Text="Remove"
                                            CssClass="btn btn-danger btn-sm"
                                            CommandName="RemoveItem"
                                            CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>



            <div class="mt-3 d-flex justify-content-evenly">
                <asp:Button ID="ContinueShoppingBtn" runat="server" Text="Continue Shopping" CssClass="btn btn-primary" PostBackUrl="~/Products" />
                <asp:Button ID="CheckoutBtn" runat="server" Text="Check Out" CssClass="btn btn-success" Visible="false" PostBackUrl="~/Checkout" />
            </div>

    </div>


</asp:Content>
