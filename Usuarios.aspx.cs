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
    public partial class Usuarios : Page
    {
        HttpContext context = HttpContext.Current;
        private string buscar_usuario(string email, string pass)
        {
            string mensaje = "";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "VERIFICAR_USUARIO";

            command.Parameters.Add("email", SqlDbType.VarChar, 50);
            command.Parameters["email"].Value = email;
            command.Parameters.Add("pass", SqlDbType.VarChar, 50);
            command.Parameters["pass"].Value = pass;

            SqlDataAdapter oDa = new SqlDataAdapter();
            DataTable dt = new DataTable();

            oDa.SelectCommand = command;

            try
            {
                oDa.Fill(dt);
                mensaje = dt.Rows[0]["MENSAJE"].ToString();
            }
            catch(SqlException e)
            {
                Console.WriteLine("Error: " + e);
            }
            
            return mensaje;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Entrar_Click(object sender, EventArgs e)
        {

            if (email.Text.Trim() != "" && pass.Text.Trim() != "")
            {
                string respuesta = buscar_usuario(email.Text, pass.Text);
                if(respuesta == "EXISTE")
                {
                    context.Session["email"] = email.Text;
                    //Response.Write(Session["email"]);
                    Response.Redirect("General.aspx");
                    //Session.RemoveAll();
                } else
                {
                    Response.Redirect("Usuarios.aspx");
                }
            }
        }
    }
}