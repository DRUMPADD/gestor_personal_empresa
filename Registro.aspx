<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="McGreen_prueba1.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrar usuario</title>
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
    <div class="container col-md-5 mt-5">
        <form id="form1" class="card card-body" runat="server">
            <div class="d-flex justify-content-around">
                <div>
                    <label>Matricula</label>
                    <asp:TextBox runat="server" ID="matricula" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <label>Nombre</label>
                    <asp:TextBox runat="server" ID="nombre_usuario" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="input-group mt-3 align-items-center">
                <label>Apellido paterno</label>
                <asp:TextBox runat="server" ID="ap_p" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="input-group mt-3 align-items-center">
                <label>Apellido materno</label>
                <asp:TextBox runat="server" ID="ap_m" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mt-3 d-flex align-items-center">
                <label>Puesto</label>
                <asp:DropDownList runat="server" CssClass="form-select" ID="ddw_puestos"></asp:DropDownList>
            </div>
            <div class="mt-3 d-flex align-items-center justify-content-around">
                <label>Email</label>
                <asp:TextBox runat="server" ID="email" CssClass="form-control" ></asp:TextBox>
                <asp:TextBox runat="server" ID="ext_email" CssClass="form-control" Text="@SIGSSMAC.COM.MX" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="mt-3 d-flex align-items-center">
                <label>Contraseña</label>
                <asp:TextBox runat="server" ID="password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="d-flex justify-content-center">
                <asp:RadioButtonList ID="privilegios" runat="server" RepeatLayout="Flow" CssClass="d-flex align-items-center justify-content-around">
                    <asp:ListItem Value="ADM-IN1">Administrador</asp:ListItem>
                    <asp:ListItem Value="JEFE">Jefe</asp:ListItem>
                    <asp:ListItem Value="EMPLEADO">Empleado</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <asp:Button runat="server" ID="btnRegistrar" CssClass="btn btn-success form-control mt-3" Text="Registrar" OnClick="btnRegistrar_Click" />
            <asp:LinkButton id="btnLogOut" runat="server" Text="Cerrar sesión" class="btn btn-primary mt-3" OnClick="btnLogOut_Click" />
        </form>
    </div>
    <footer class="text-center">
        <p> @<%= DateTime.Now.Year %> Derechos reservados <strong>Fluidos McGreen de México S.A de C.V</strong></p>
        <p>Fecha: <%= DateTime.Now.ToString("dd/MM/yyyy") %></p>
    </footer>
</body>
</html>
