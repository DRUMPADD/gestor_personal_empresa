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
    public partial class Registro : System.Web.UI.Page
    {
        private void registrar_usuario(string id_emp, string nombre, string ap_paterno, string ap_materno, string puesto, string email, string pass, string privilegio)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand comm = new SqlCommand();
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.CommandText = "AGREGAR_USUARIO";
            comm.Connection = conn;

            comm.Parameters.Add("ID_EMP", SqlDbType.VarChar, 20);
            comm.Parameters["ID_EMP"].Value = id_emp;
            comm.Parameters.Add("NOMBRE", SqlDbType.VarChar, 50);
            comm.Parameters["NOMBRE"].Value = nombre;
            comm.Parameters.Add("AP_PATERNO", SqlDbType.VarChar, 30);
            comm.Parameters["AP_PATERNO"].Value = ap_paterno;
            comm.Parameters.Add("AP_MATERNO", SqlDbType.VarChar, 30);
            comm.Parameters["AP_MATERNO"].Value = ap_materno;
            comm.Parameters.Add("PUESTO", SqlDbType.VarChar, 20);
            comm.Parameters["PUESTO"].Value = puesto;
            comm.Parameters.Add("EMAIL", SqlDbType.VarChar, 50);
            comm.Parameters["EMAIL"].Value = email;
            comm.Parameters.Add("PASSWORD", SqlDbType.VarChar, 50);
            comm.Parameters["PASSWORD"].Value = pass;
            comm.Parameters.Add("PRIVILEGIO", SqlDbType.VarChar, 20);
            comm.Parameters["PRIVILEGIO"].Value = privilegio;

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
        }

        private void mostrar_puestos()
        {
            SqlConnection oConn = new SqlConnection();
            oConn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            string query = "select * from puestos";
            SqlDataAdapter oDa = new SqlDataAdapter(query, oConn);
            DataTable dt = new DataTable();
            try
            {
                oDa.Fill(dt);
                ddw_puestos.DataSource = dt;
                ddw_puestos.DataTextField = "nombre_puesto";
                ddw_puestos.DataValueField = "id_puesto";
                ddw_puestos.DataBind();
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
                if(!Page.IsPostBack)
                {
                    mostrar_puestos();
                }
            } else
            {
                Response.Redirect("Usuarios");
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (matricula.Text.Trim() != null && nombre_usuario.Text.Trim() != null && ap_p.Text.Trim() != null && ap_m.Text.Trim() != null &&
                ddw_puestos.SelectedItem.Value != null && email.Text.Trim() != null && password.Text.Trim() != null && privilegios.SelectedItem.Value != null)
            {
                registrar_usuario(matricula.Text, nombre_usuario.Text, ap_p.Text,
                ap_m.Text, ddw_puestos.SelectedItem.Value.ToString(), email.Text + ext_email.Text, password.Text, privilegios.SelectedItem.Value);
                Response.Redirect(Request.Url.ToString());
            }
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