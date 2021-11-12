<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Otros.aspx.cs" Inherits="McGreen_prueba1.Otros_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ventas</title>
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
    <div class="container d-flex justify-content-center mt-5">
        <div class="col-lg-7">
            <form runat="server" class="product-form card card-body">
                <h1 class="card-title text-center">Añadir producto</h1>
                <div class="agrega_articulo">
                    <div class="articulos">
                        <div class="input-group d-flex justify-content-around">
                            <div class="input-group d-flex justify-content-around">
                                <div>
                                    <label>Id movimiento: </label>
                                    <asp:TextBox ID="id_mov" class="form-control" runat="server" />
                                </div>
                                <div>
                                    <label>Email: </label>
                                    <asp:TextBox ID="email" class="form-control" runat="server" ReadOnly="true" />
                                </div>
                                <div>
                                    <label>Fecha: </label>
                                    <asp:TextBox ID="fecha" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="input-group d-flex justify-content-around">
                                <div>
                                    <label>Id producto: </label>
                                    <asp:DropDownList runat="server" ID="ddw_productos" CssClass="form-select" >
                                    </asp:DropDownList>
                                </div>
                                <div>
                                    <label>Cantidad: </label>
                                    <asp:TextBox ID="cantidad" runat="server" class="form-control" />
                                </div>
                                <div>
                                    <label>Tipo de movimiento: </label>
                                    <asp:DropDownList runat="server" ID="ddw_tipo_mov" CssClass="form-select">
                                        <asp:ListItem Value="INGRESO">INGRESO</asp:ListItem>
                                        <asp:ListItem Value="SALIDA">SALIDA</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="input-group mt-3 text-center">
                                <asp:TextBox ID="motivo" class="form-control" runat="server" placeholder="Motivo"></asp:TextBox>
                            </div>
                        </div>
                        <div>
                            <label>Origen o destino: </label>
                            <asp:TextBox ID="org_des" runat="server" class="form-control" />
                        </div>
                        <hr />
                    </div>
                </div>

                                
                <br />
                <asp:Button ID="btnGuardar"  CssClass="btn btn-primary form-control" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
            <!--<button id="btnAddForm" type="button" class="btn btn-primary mt-4 bg-black">
                    <i class="bi bi-plus-circle d-flex align-items-center justify-content-center m-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                          <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                    </i>
            </button> -->
                <asp:LinkButton id="btnLogOut" runat="server" Text="Cerrar sesión" class="btn btn-primary mt-3" OnClick="btnLogOut_Click" />
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
