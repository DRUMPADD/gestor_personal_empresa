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
    public partial class Otros_ : System.Web.UI.Page
    {
        private void limpiar_formulario()
        {
            ddw_tipo_mov.SelectedItem.Value = "";
            email.Text = "";
            id_mov.Text = "";
            cantidad.Text = "";
            org_des.Text = "";
            fecha.Text = "";
            ddw_productos.SelectedItem.Value = "";
            motivo.Text = "";
        }
        //ALTER PROCEDURE MOV_INV(@ID_PRODUCTO varchar(20), @email varchar(50), @id_mi varchar(20),
        //@cantidad FLOAT, @fecha datetime, @motivo VARCHAR(150),@tipo_mov varchar(10), @org_des varchar(50))
        private void mostrar_productos()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand comm = new SqlCommand("SELECT * FROM inventario", conn);


            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = comm;

            DataTable dt = new DataTable();
            try
            {
                oDa.Fill(dt);
                ddw_productos.DataSource = dt;
                ddw_productos.DataTextField = "nombre_producto";
                ddw_productos.DataValueField = "id_producto";
                ddw_productos.DataBind();
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


        //ALTER PROCEDURE MOV_INV(@ID_PRODUCTO varchar(20), @email varchar(50), @id_mi varchar(20),
        //@cantidad FLOAT, @fecha datetime, @motivo VARCHAR(150),@tipo_mov varchar(10), @org_des varchar(50))

        private void ingresar_movimiento(string id_prod, string email, string id_mi, float cantidad, string org_des, DateTime fecha, string tipo_mov, string motivo)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand comm = new SqlCommand();
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Connection = conn;
            comm.CommandText = "MOV_INV";

            comm.Parameters.Add("ID_PRODUCTO", SqlDbType.VarChar, 20);
            comm.Parameters["ID_PRODUCTO"].Value = id_prod;
            comm.Parameters.Add("email", SqlDbType.VarChar, 50);
            comm.Parameters["email"].Value = email;
            comm.Parameters.Add("id_mi", SqlDbType.VarChar, 20);
            comm.Parameters["id_mi"].Value = id_mi;
            comm.Parameters.Add("cantidad", SqlDbType.Float);
            comm.Parameters["cantidad"].Value = cantidad;
            comm.Parameters.Add("fecha", SqlDbType.DateTime);
            comm.Parameters["fecha"].Value = fecha;
            comm.Parameters.Add("motivo", SqlDbType.VarChar, 150);
            comm.Parameters["motivo"].Value = motivo;
            comm.Parameters.Add("tipo_mov", SqlDbType.VarChar, 10);
            comm.Parameters["tipo_mov"].Value = tipo_mov;
            comm.Parameters.Add("org_des", SqlDbType.VarChar, 20);
            comm.Parameters["org_des"].Value = org_des;

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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                if (!Page.IsPostBack)
                {
                    mostrar_productos();
                    email.Text = Session["email"].ToString();
                }
            } else
            {
                Response.Redirect("Usuarios");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DateTime fecha_ = DateTime.ParseExact(fecha.Text, "dd/mm/yyyy", null);
            ingresar_movimiento(ddw_productos.SelectedItem.Value, email.Text, id_mov.Text, float.Parse(cantidad.Text), org_des.Text, fecha_, ddw_tipo_mov.SelectedItem.Value, motivo.Text);
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
    }
}