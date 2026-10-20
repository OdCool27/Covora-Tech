<%@ Page Title="Internal Error" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="InternalError.aspx.cs"
    Inherits="Covora_Tech_Store.InternalError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container text-center mt-5">
        <h1 class="display-4 text-danger">Oops! Something went wrong.</h1>
        <p class="lead">
            An unexpected error occurred:
            <strong><%= (Context.Items["ErrorException"] as Exception)?.Message %></strong>
        </p>
        <a href="<%= ResolveUrl("~/") %>" class="btn btn-primary mt-3">Back to Home</a>
        <a href="<%= ResolveUrl("~/Products") %>" class="btn btn-info mt-3">Continue Shopping</a>
        <a href="<%= ResolveUrl("~/Contact") %>" class="btn btn-secondary mt-3">Contact Us</a>

    </div>
</asp:Content>
