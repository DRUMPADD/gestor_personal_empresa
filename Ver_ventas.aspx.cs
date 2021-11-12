using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McGreen_prueba1
{
    public partial class Ver_ventas : System.Web.UI.Page
    {
        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movimientos_inventario.aspx");
        }
        private void mostrar_solo_ventas()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand comm = new SqlCommand();
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Connection = conn;
            comm.CommandText = "Mostrar_Fac_Ventas";

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = comm;

            DataTable dt = new DataTable();
            try
            {
                oDa.Fill(dt);
                gridVentas.DataSource = dt;
                gridVentas.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message.ToString());
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                if (!Page.IsPostBack)
                {
                    mostrar_solo_ventas();
                }
            } else
            {
                Response.Redirect("Usuarios");
            }
        }
    }
}