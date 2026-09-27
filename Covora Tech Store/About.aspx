<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Covora_Tech_Store.About" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Bootstrap container centres the heading and lead styles its introduction. --%>
    <section class="page-heading" aria-labelledby="about-title">
        <div class="container">
            <p class="eyebrow">Our story</p>
            <h1 id="about-title">Good things for everyday moments.</h1>
            <p class="lead">A small technology accessory store built around practical products and clear browsing.</p>
        </div>
    </section>
    <section class="container section-space" aria-labelledby="purpose-title">
        <%-- Bootstrap grid: stack on phones, then show two equal columns from md (768px); g-5 adds gutters. --%>
        <div class="row g-5 align-items-center">
            <div class="col-12 col-md-6">
                <div class="story-panel">
                    <p class="eyebrow">The Covora Tech approach</p>
                    <h2>Small details.<br />Everyday possibilities.</h2>
                    <p class="mt-3 text-muted">From listening on the move to lighting your desk, we focus on accessories that have a useful place in your day.</p>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <p class="eyebrow">Why we exist</p>
                <h2 id="purpose-title">Useful first. Always.</h2>
                <p class="lead">Covora Tech makes everyday technology easy to explore. Our collection brings together audio, power and workspace accessories for studying, working and staying connected.</p>
                <p class="text-muted">We present product descriptions, categories and prices in JMD so you can compare the essentials at a glance.</p>
                <%-- Bootstrap btn and btn-primary style the collection link; Site.css supplies the brand colours. --%>
                <a runat="server" href="~/Products" class="btn btn-primary">Explore the collection <span aria-hidden="true">&rarr;</span></a>
            </div>
        </div>
    </section>
</asp:Content>
