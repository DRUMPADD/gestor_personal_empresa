<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movimientos_inventario.aspx.cs" Inherits="McGreen_prueba1.Movimientos_inventario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Movimientos</title>
    <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <ul class="navbar-nav me-auto">
            <li class="nav-item"><a class="nav-link" runat="server" href="General.aspx">Inventario general</a></li>
            <li class="nav-item"><a class="nav-link" runat="server" href="Compras.aspx">Almacenar compra</a></li>
            <li class="nav-item"><a class="nav-link" runat="server" href="Ventas.aspx">Almacenar venta</a></li>
            <li class="nav-item"><a class="nav-link" runat="server" href="Otros.aspx">Otra forma</a></li>
            <li class="nav-item"><a class="nav-link" runat="server" href="Movimientos_inventario.aspx">Movimientos de inventario</a></li>
            <li class="nav-item"><a class="nav-link" runat="server" href="Registro.aspx">Registrar usuario</a></li>
        </ul>
    </nav>
    <div class="container  col-md-7">
                <div class="row">
                    <a href="Ver_compras.aspx" id="btnCompras" class="btn btn-dark col-sm m-1 d-flex align-items-center justify-content-center">Ver compras</a>
                    <a href="Ver_ventas.aspx" id="btnVentas" class="btn btn-success col-sm m-1 d-flex align-items-center justify-content-center">Ver ventas</a>
                    <a href="Ver_otros.aspx" id="btnOtro" class="btn btn-warning col-sm m-1 d-flex align-items-center justify-content-center">Ver otros movimientos</a>
                </div>
            </div>
    <div class="container d-flex justify-content-center">
        <div>
            <table class="table table-bordered mt-4">
                <thead>
                    <tr class="text-center">
                        <th>Id movimiento</th>
                        <th>Tipo movimiento</th>
                        <th>Origen o destino</th>
                        <th>Motivo</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody id="movimientos" runat="server" class="text-center">
                </tbody>
            </table>
            <form runat="server">
                <asp:LinkButton id="btnLogOut" runat="server" Text="Cerrar sesión" class="btn btn-primary form-control" OnClick="btnLogOut_Click" />
            </form>
        </div>
    </div>
    <footer class="text-center">
        <p> @<%= DateTime.Now.Year %> Derechos reservados <strong>Fluidos McGreen de México S.A de C.V</strong></p>
        <p>Fecha: <%= DateTime.Now.ToString("dd/MM/yyyy") %></p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
