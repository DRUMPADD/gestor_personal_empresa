using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McGreen_prueba1
{
    public partial class Ventas : System.Web.UI.Page
    {
        private void limpiar_formulario()
        {
            ddw_productos.ClearSelection();
            vendedor.Text = string.Empty;
            venta_id.Text = string.Empty;
            cantidad.Text = string.Empty;
            p_u.Text = string.Empty;
            fecha.Text = string.Empty;
            ddw_clientes.ClearSelection();
            motivo.Text = string.Empty;
        }

        private void mostrar_productos()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = System.Data.CommandType.StoredProcedure;
            oCmd.Connection = conn;
            oCmd.CommandText = "MOSTRAR_INVENTARIO";

            DataTable dt = new DataTable();

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = oCmd;
            try
            {
                oDa.Fill(dt);
                ddw_productos.DataSource = dt;
                ddw_productos.DataTextField = "nombre_producto";
                ddw_productos.DataValueField = "id_producto";
                ddw_productos.DataBind();

                ddw_productos.Items.Insert(0, "--SELECCIONA--");
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                oDa.Dispose();
            }
        }

        private void mostrar_clientes()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand comm = new SqlCommand("SELECT * FROM clientes", conn);


            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = comm;

            DataTable dt = new DataTable();
            try
            {
                oDa.Fill(dt);
                ddw_clientes.DataSource = dt;
                ddw_clientes.DataTextField = "nombre_cliente";
                ddw_clientes.DataValueField = "id_cliente";
                ddw_clientes.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                oDa.Dispose();
            }
        }

        private void ingresar_venta(string id_prod, string email, string id_venta, float cantidad, double precio_u, DateTime fecha, string cliente, string motivo)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand comm = new SqlCommand();
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Connection = conn;
            comm.CommandText = "VENTA";

            comm.Parameters.Add("ID_PRODUCTO", SqlDbType.VarChar, 20);
            comm.Parameters["ID_PRODUCTO"].Value = id_prod;
            comm.Parameters.Add("email", SqlDbType.VarChar, 50);
            comm.Parameters["email"].Value = email;
            comm.Parameters.Add("id_venta", SqlDbType.VarChar, 20);
            comm.Parameters["id_venta"].Value = id_venta;
            comm.Parameters.Add("cantidad", SqlDbType.Float);
            comm.Parameters["cantidad"].Value = cantidad;
            comm.Parameters.Add("precio_uni", SqlDbType.Money);
            comm.Parameters["precio_uni"].Value = precio_u;
            comm.Parameters.Add("fecha", SqlDbType.DateTime);
            comm.Parameters["fecha"].Value = fecha;
            comm.Parameters.Add("cliente", SqlDbType.VarChar, 20);
            comm.Parameters["cliente"].Value = cliente;
            comm.Parameters.Add("motivo", SqlDbType.VarChar, 150);
            comm.Parameters["motivo"].Value = motivo;

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = comm;

            DataTable dt = new DataTable();
            try
            {
                oDa.Fill(dt);
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                oDa.Dispose();
            }
        }

        private string mostrar_precio(string id_producto)
        {
            string precio = "";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand oCmd = new SqlCommand();
            oCmd.CommandType = System.Data.CommandType.StoredProcedure;
            oCmd.Connection = conn;
            oCmd.CommandText = "MOSTRAR_PRECIO";

            oCmd.Parameters.Add("ID_PRODUCTO", SqlDbType.VarChar, 20);
            oCmd.Parameters["ID_PRODUCTO"].Value = id_producto;

            DataTable dt = new DataTable();

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = oCmd;
            try
            {
                oDa.Fill(dt);
                precio = dt.Rows[0]["PRECIO_UNIT_VENTA"].ToString();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
            finally
            {
                oDa.Dispose();
            }

            return precio;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                if (!Page.IsPostBack)
                {
                    mostrar_productos();
                    mostrar_clientes();
                    vendedor.Text = Session["email"].ToString();
                }
            } else
            {
                Response.Redirect("Usuarios");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DateTime fecha_ = DateTime.ParseExact(fecha.Text, "dd/mm/yyyy", null);
            ingresar_venta(ddw_productos.SelectedItem.Value, vendedor.Text, venta_id.Text, float.Parse(cantidad.Text), Double.Parse(p_u.Text), fecha_, ddw_clientes.SelectedItem.Value, motivo.Text);
            limpiar_formulario();
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["email"] = null;
            Session.Contents.RemoveAll();
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
            Session.Abandon();
            Response.Redirect("Usuarios");
        }

        protected void ddw_productos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddw_productos.SelectedIndex == 0)
            {
                p_u.Text = "";
            }
            else
            {
                Decimal p = Decimal.Parse(mostrar_precio(ddw_productos.SelectedItem.Value.ToString()));
                p_u.Text = Convert.ToString(decimal.Round(p, 2, MidpointRounding.AwayFromZero));
            }
        }
    }
}