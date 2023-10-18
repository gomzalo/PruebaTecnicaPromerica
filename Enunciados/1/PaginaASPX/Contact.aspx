<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PaginaASPX.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>Gonzalo García</h3>
        <address>
            Zona 6<br />
            Ciudad de Guatemala, Guatemala<br />
            <abbr title="Phone">Celular:</abbr>
            57-- --65
        </address>

        <address>
            <strong>Soporte:</strong>   <a href="mailto:gomzalo@outlook.com">gomzalo@outlook.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:gxmzalx@gmail.com">gxmzalx@gmail.com</a>
        </address>
    </main>
</asp:Content>
