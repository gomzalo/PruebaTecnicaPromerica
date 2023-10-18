<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PaginaASPX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <link rel="stylesheet" type="text/css" href="Content/PruebaPromerica/EstilosPersonalizados.css" />
    </header>
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Inicio de sesión</h1>
            <p class="lead">Ingresa tus credenciales para acceder al sistema.</p>
        </section>
        <section class="row">
            <div class="col-md-4">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label><br />
                <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" Text=""></asp:Label><br />
                <asp:TextBox ID="txtNombreUsuario" runat="server" placeholder="Nombre de usuario" CssClass="form-control"></asp:TextBox><br /><br />
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" placeholder="Contraseña" CssClass="form-control"></asp:TextBox><br /><br />
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" CssClass="btn btn-primary"/>
            </div>
        </section>
    </main>
</asp:Content>
