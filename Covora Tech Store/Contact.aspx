<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Covora_Tech_Store.Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Bootstrap container and lead provide the heading width and introductory typography. --%>
    <section class="page-heading" aria-labelledby="contact-title">
        <div class="container">
            <p class="eyebrow">Contact us</p>
            <h1 id="contact-title">Let&rsquo;s talk.</h1>
            <p class="lead">Have a product question? Our contact details will be listed here.</p>
        </div>
    </section>
    <section class="container section-space" aria-label="Contact details">
        <p class="text-muted mb-4">These are placeholder details for this sample storefront. Business contact information has not been provided yet.</p>
        <%-- Bootstrap row/g-4 adds gutters. col-12 stacks cards; col-md-4 shows three columns from 768px.
             card and h-100 give each contact panel a card layout and equal height within its row.
             h5, small, text-muted and margin utilities control text sizing, colour and spacing. --%>
        <address class="row g-4">
            <div class="col-12 col-md-4"><div class="card contact-card h-100">
                <p class="eyebrow">01 / Email</p><h2 class="h5">Send us a note</h2>
                <p class="contact-value">hello@covoratech.example</p>
                <p class="small text-muted mb-0">Placeholder only &mdash; not a working email address.</p>
            </div></div>
            <div class="col-12 col-md-4"><div class="card contact-card h-100">
                <p class="eyebrow">02 / Phone</p><h2 class="h5">Give us a call</h2>
                <p>+1 (876) XXX-XXXX</p><p class="small text-muted mb-0">Phone number to be provided.</p>
            </div></div>
            <div class="col-12 col-md-4"><div class="card contact-card h-100">
                <p class="eyebrow">03 / Location</p><h2 class="h5">Where to find us</h2>
                <p>Business address to be provided</p><p class="small text-muted mb-0">Location and opening hours to be confirmed.</p>
            </div></div>
        </address>
        <p class="contact-note mt-4 mb-0">When enquiring about a product, include its name or product ID so it is easy to identify.</p>
    </section>
</asp:Content>
