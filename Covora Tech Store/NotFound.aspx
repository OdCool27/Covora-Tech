<%@ Page Title="Page Not Found" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="NotFound.aspx.cs"
    Inherits="Covora_Tech_Store.NotFound" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center mt-5">
        <h1 class="display-4 text-warning">404 - Page Not Found</h1>
        <p class="lead">
            Sorry, the resource <strong><%= Context.Items["MissingUrl"] ?? "Unknown resource" %></strong> was not found.
        </p>
        <a href="<%= ResolveUrl("~/") %>" class="btn btn-primary mt-3">Back to Home</a>
        <a href="<%= ResolveUrl("~/Products") %>" class="btn btn-info mt-3">Continue Shopping</a>

    </div>
</asp:Content>
