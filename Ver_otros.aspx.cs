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
    public partial class Ver_otros : System.Web.UI.Page
    {
        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movimientos_inventario.aspx");
        }
        private void mostrar_otros()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DB_MCGREEN"].ToString();
            SqlCommand comm = new SqlCommand();
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Connection = conn;
            comm.CommandText = "MOSTRAR_OTROS";

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = comm;

            DataTable dt = new DataTable();
            try
            {
                oDa.Fill(dt);
                gridOtros.DataSource = dt;
                gridOtros.DataBind();
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
                    mostrar_otros();
                }
            } else
            {
                Response.Redirect("Usuarios");
            }
        }
    }
}