<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="McGreen_prueba1.Compras_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Compras</title>
    <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css" />
</head>
    <% if (Session["email"] != null)
        { %>
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
                <h1 class="card-title text-center">Añadir compra</h1>
                <div class="agrega_articulo">
                    <div class="articulos">
                        <div class="input-group d-flex justify-content-around">
                            <div>
                                <label>Compra: </label>
                                <asp:TextBox ID="compra_id" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <label>Comprador: </label>
                                <asp:TextBox ID="comprador" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div>
                                <label>Fecha: </label>
                                <asp:TextBox runat="server" ID="fecha_compra" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="input-group mt-3 text-center">
                                <asp:TextBox ID="motivo"  CssClass="form-control" runat="server" placeholder="Motivo"></asp:TextBox>
                            </div>
                            <div>
                                <label>Artículo: </label>
                                <asp:TextBox ID="articulo" CssClass="form-control" runat="server" ReadOnly="true" value="1" />
                            </div>
                        </div>
                        <div class="input-group mt-3 d-flex justify-content-lg-start align-items-center">
                            Proveedor: <asp:DropDownList ID="ddw_proveedores" runat="server" CssClass="form-select">
                            </asp:DropDownList> <a class="btn btn-info m-2">
                                <i class="bi bi-question-circle">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle text-center" viewBox="0 0 16 16">
                                      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                                    </svg>
                                </i>
                            </a>
                        </div>
                        <div class="input-group mt-3 d-flex justify-content-lg-start align-items-center">
                            Producto: <asp:DropDownList ID="ddw_productos" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddw_productos_SelectedIndexChanged">
                            </asp:DropDownList> <a class="btn btn-info m-2">
                                <i class="bi bi-question-circle">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle text-center" viewBox="0 0 16 16">
                                      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                      <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                                    </svg>
                                </i>
                            </a>
                        </div>
                        <div class="input-group mt-3 d-flex justify-content-around">
                            <div>
                                <label>Cantidad:</label>
                                <asp:TextBox ID="cantidad" runat="server" class="form-control" />
                            </div>
                            <div>
                                <label>P.U:</label>
                                <asp:TextBox ID="p_u" runat="server" class="form-control" ReadOnly="true" />
                            </div>
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
    <% }
        else Response.Redirect("Usuarios"); %>
</html>
