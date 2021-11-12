<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="McGreen_prueba1.Ventas" %>

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
                <h1 class="card-title text-center">Añadir venta</h1>
                <div class="agrega_articulo">
                    <div class="articulos">
                        <div class="input-group d-flex justify-content-around">
                            <div>
                                <label>Venta: </label>
                                <asp:TextBox ID="venta_id" CssClass="form-control" runat="server" />
                            </div>
                            <div>
                                <label>Vendedor: </label>
                                <asp:TextBox ID="vendedor" CssClass="form-control" runat="server" ReadOnly="true" />
                            </div>
                            <div>
                                <label>Fecha: </label>
                                <asp:TextBox ID="fecha" runat="server" class="form-control" />
                            </div>
                            <div class="input-group mt-3 text-center">
                                <asp:TextBox ID="motivo" CssClass="form-control" runat="server" placeholder="Motivo"></asp:TextBox>
                            </div>
                            <div>
                                <label>Artículo: </label>
                                <asp:TextBox ID="articulo" CssClass="form-control" runat="server" ReadOnly="true" value="1" />
                            </div>
                        </div>
                        <div class="input-group mt-3 d-flex justify-content-lg-start align-items-center">
                            Cliente: <asp:DropDownList ID="ddw_clientes" runat="server" class="form-select">
                                <asp:ListItem value="1">Opcion 1</asp:ListItem>
                                <asp:ListItem value="2">Opcion 2</asp:ListItem>
                                <asp:ListItem value="3">Opcion 3</asp:ListItem>
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
            <!-- <button id="btnAddForm" type="button" class="btn btn-primary mt-4 bg-black">
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
    <!--<script>
    const btnAddForm = document.getElementById("btnAddForm");
    const form = document.querySelector(".agrega_articulo");
    const articulos = document.querySelectorAll(".articulos");

    articulos.length;
    let num = 1;

    btnAddForm.addEventListener('click', () => {
        num += 1;
        const formulario = `
                    <div class="input-group d-flex justify-content-around">
                        <div>
                            <label>Artículo: </label>
                            <input type="text" name="comprador" class="form-control" runat="server" readonly="on" value="${num}" />
                        </div>
                    </div>
                    <div class="input-group mt-3 d-flex justify-content-lg-start align-items-center">
                        Proveedor: <select name="ddw_departamentos" runat="server" class="form-select">
                            <option value="1">Opcion 1</option>
                            <option value="2">Opcion 2</option>
                            <option value="3">Opcion 3</option>
                        </select> <a class="btn btn-info m-2">
                            <i class="bi bi-question-circle">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle text-center" viewBox="0 0 16 16">
                                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                  <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                                </svg>
                            </i>
                        </a>
                    </div>
                    <div class="input-group mt-3 d-flex justify-content-lg-start align-items-center">
                        Producto: <select name="ddw_productos" runat="server" class="form-select">
                            <option value="1">Opcion 1</option>
                            <option value="2">Opcion 2</option>
                            <option value="3">Opcion 3</option>
                        </select> <a class="btn btn-info m-2">
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
                            <input type="number" name="descripcion" runat="server" class="form-control" />
                        </div>
                        <div>
                            <label>P.U:</label>
                            <input type="number" name="descripcion" runat="server" class="form-control" />
                        </div>
                    </div>
            <hr />
    `;

        console.log(num);
        const new_article = document.createElement("div");
        new_article.className = "articulos";
        new_article.innerHTML += formulario;
        form.append(new_article);
    });

</script> -->
</body>
</html>
