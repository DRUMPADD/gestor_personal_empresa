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
    public partial class Movimientos_inventario : System.Web.UI.Page
    {
        private DataTable mostrar_movimientos()
        {
            string DB_MCGREEN = ConfigurationManager.ConnectionStrings["DB_MCGREEN"].ConnectionString;

            using (SqlConnection con = new SqlConnection(DB_MCGREEN))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from movimientos_almacen order by fecha_mov"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                if (!Page.IsPostBack)
                {
                    DataTable dt = this.mostrar_movimientos();
                    StringBuilder html = new StringBuilder();

                    foreach (DataRow row in dt.Rows)
                    {
                        html.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            html.Append("<td>");
                            html.Append(row[column.ColumnName]);
                            html.Append("</td>");
                        }
                        html.Append("</tr>");
                    }
                    movimientos.Controls.Add(new Literal { Text = html.ToString() });
                }
            } else
            {
                Response.Redirect("Usuarios");
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