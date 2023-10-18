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
                <asp:TextBox ID="txtNombreUsuario" runat="server" placeholder="Nombre de usuario" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revNombreUsuario" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="No se permiten caracteres especiales en el nombre de usuario." ValidationExpression="^[a-zA-Z0-9]*$" ForeColor="Red"/>
                <br /><br />
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" placeholder="Contraseña" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="El campo contraseña es obligatorio." ForeColor="Red"/>
                <asp:RegularExpressionValidator ID="revContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="La contraseña debe de tener 8 caracteres como ." ValidationExpression="^.{8,}$" ForeColor="Red"/>
                <br /><br />
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" OnClick="btnLogin_Click" CssClass="btn btn-primary"/>
            </div>
        </section>
    </main>
</asp:Content>
