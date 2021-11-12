<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ver_ventas.aspx.cs" Inherits="McGreen_prueba1.Ver_ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ventas realizadas</title>
    <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    </nav>
    <div class="container d-flex justify-content-center">
        <form class="card card-body" runat="server">
            <asp:GridView runat="server" ID="gridVentas" CssClass="table table-dark table-bordered" HeaderStyle-CssClass="text-center"></asp:GridView>
            <asp:Button ID="btnRegresar" runat="server" Text="Regresar" CssClass="btn btn-success" OnClick="btnRegresar_Click" />
        </form>
    </div>
    <footer class="text-center">
        <p> @<%= DateTime.Now.Year %> Derechos reservados <strong>Fluidos McGreen de México S.A de C.V</strong></p>
        <p>Fecha: <%= DateTime.Now.ToString("dd/MM/yyyy") %></p>
    </footer>
</body>
</html>
