<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="General.aspx.cs" Inherits="McGreen_prueba1.General" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>General</title>
    <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css" />
    <!-- CSS only -->
    <style>
        th[scope="col"],
        td > input[type="button"]{
            font-size: 10px;
        }

        table {
            font-size: 12px;
        }
    </style>
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
        <div class="container d-flex align-content-center">
            <div class="row">
                <form id="form1" runat="server" class="card card-body">
                    <div class="card card-body row col-lg-8 mx-auto">
                        <!--<div>
                            <label>Imagen:</label>
                            <asp:FileUpload ID="file" CssClass="form-control" runat="server"></asp:FileUpload>
                        </div>-->
                        <div class="input-group justify-content-around">
                            <div class="">
                                <label>Id producto:</label>
                                <asp:TextBox ID="producto_id" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div>
                                <label>Nombre del producto:</label>
                                <asp:TextBox ID="producto" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div>
                                <label>Medida:</label>
                                <asp:DropDownList ID="ddw_medidas" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="CH">Talla CH</asp:ListItem>
                                    <asp:ListItem Value="M">Talla M</asp:ListItem>
                                    <asp:ListItem Value="G">Talla G</asp:ListItem>
                                    <asp:ListItem Value="mg">Miligramo</asp:ListItem>
                                    <asp:ListItem Value="Kg">Kilogramo</asp:ListItem>
                                    <asp:ListItem Value="ml">Miliitro</asp:ListItem>
                                    <asp:ListItem Value="L">Litro</asp:ListItem>
                                    <asp:ListItem Value="Unidad">Unidad</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div>
                            <label>Descripción:</label>
                            <asp:TextBox ID="descripcion" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="input-group justify-content-around">
                            <div>
                                <label>Departamento:</label>
                                <asp:dropDownList ID="ddw_departamentos" runat="server" CssClass="form-select"></asp:dropDownList>
                            </div>
                            <div>
                                <label>Precio unitario:</label> 
                                <asp:TextBox ID="precio" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <asp:Button ID="BtnGuardar"  CssClass="btn btn-primary form-control" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
                    </div>
                    <div class="mt-5">
                        <table class="col-sm-4">
                                <tr class="text-center">
                                    <td colspan="2">
                                        <asp:GridView id="gvDatos" runat="server" AllowPaging="True" CssClass="table table-bordered" 
                                            AutoGenerateColumns="False" DataKeyNames="id_producto" DataSourceID="SqlDataSource1"
                                            OnSelectedIndexChanged="gvDatos_SelectedIndexChanged">
                                            <Columns>
                                                <asp:BoundField DataField="id_producto" HeaderText="Identificador" ReadOnly="True" SortExpression="id_producto" />
                                                <asp:BoundField DataField="nombre_producto" HeaderText="Nombre" SortExpression="nombre_producto" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
                                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
                                                <asp:BoundField DataField="medida" HeaderText="Medida" SortExpression="medida" />
                                                <asp:BoundField DataField="PRECIO_UNIT_VENTA" HeaderText="Precio unitario" SortExpression="PRECIO_UNIT_VENTA" DataFormatString="{0:c}" />
                                                <asp:BoundField DataField="nombre_dep" HeaderText="Departamento" SortExpression="nombre_dep" />
                                                <asp:BoundField DataField="Val_Total_Inv_Prod" HeaderText="Valor total" SortExpression="Val_Total_Inv_Prod" DataFormatString="{0:c}" />
                                                <asp:CommandField ButtonType="Button" ShowSelectButton="True"  SelectText="Actualizar" ControlStyle-CssClass="btn btn-info" >
                                                    <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                                </asp:CommandField>
                                                <asp:CommandField ButtonType="Button"  ShowDeleteButton="True"  SelectText="Descontinuar" ControlStyle-CssClass="btn btn-danger" DeleteText="Descontinuar" >
                                                    <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                                </asp:CommandField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:McGreen_3ConnectionString %>" SelectCommand="EXEC MOSTRAR_PRODUCTOS_ACTIVOS" UpdateCommand="MOSTRAR_PRODUCTO_NOMBRE @nombre" DeleteCommand="EXEC DESCONTINUAR_PRODUCTO @ID_PRODUCTO"></asp:SqlDataSource>
                                    </td>
                                </tr>
                        </table>
                    </div>
                    <asp:LinkButton id="btnLogOut" runat="server" Text="Cerrar sesión" class="btn btn-primary" OnClick="btnLogOut_Click" />
                </form>
            </div>
        </div>

        <footer class="text-center">
            <p> @<%= DateTime.Now.Year %> Derechos reservados <strong>Fluidos McGreen de México S.A de C.V</strong></p>
            <p>Fecha: <%= DateTime.Now.ToString("dd/MM/yyyy") %></p>
        </footer>
        <script runat="server">
            protected void btnLogOut_Click(object sender, EventArgs e)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Usuarios.aspx");
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
