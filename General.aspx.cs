using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McGreen_prueba1
{
    public partial class General : System.Web.UI.Page
    {
        private void limpiar_formulario()
        {
            file.Dispose();
            producto_id.Text = string.Empty;
            producto.Text = string.Empty;
            descripcion.Text = string.Empty;
            ddw_medidas.ClearSelection();
            ddw_departamentos.ClearSelection();
        }

        #region
        private void mostrar_productos()
        {
            SqlConnection oConn = new SqlConnection();
            oConn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = oConn;
            command.CommandText = "MOSTRAR_PRODUCTOS_ACTIVOS";
            
            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = command;

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

        private void crear_producto(string id_producto, string nombre, string descripcion, string medida, string id_departamento, double precio)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = conn;
            command.CommandText = "Agrega_INV";


            command.Parameters.Add("ID_PRODUCTO", SqlDbType.VarChar, 20);
            command.Parameters["ID_PRODUCTO"].Value = id_producto;
            command.Parameters.Add("NOMBRE_PRODUCTO", SqlDbType.VarChar, 50);
            command.Parameters["NOMBRE_PRODUCTO"].Value = nombre;
            command.Parameters.Add("DESCRIPCION", SqlDbType.VarChar, 100);
            command.Parameters["DESCRIPCION"].Value = descripcion;
            command.Parameters.Add("MEDIDA", SqlDbType.VarChar, 15);
            command.Parameters["MEDIDA"].Value = medida;
            command.Parameters.Add("NOMBRE_DEP", SqlDbType.VarChar, 100);
            command.Parameters["NOMBRE_DEP"].Value = id_departamento;
            command.Parameters.Add("PRECIO_UNIT", SqlDbType.Money);
            command.Parameters["PRECIO_UNIT"].Value = precio;

            DataTable dt = new DataTable();

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = command;

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
                command.Dispose();
            }
        }

        private void mostrar_producto_nombre(string nombre_producto)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = conn;
            command.CommandText = "MOSTRAR_PRODUCTO_NOMBRE";

            command.Parameters.Add("nombre", SqlDbType.VarChar, 100);
            command.Parameters["nombre"].Value = nombre_producto;

            DataTable dt = new DataTable();

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = command;

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
                command.Dispose();
            }
        }
        
        private void actualizar_producto(string id_prod, string nombre_p, string descripcion, string id_dep)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3; Integrated Security=True";
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = conn;
            command.CommandText = "MODIFICA_INV";

            command.Parameters.Add("ID_PRODUCTO", SqlDbType.VarChar, 20);
            command.Parameters["ID_PRODUCTO"].Value = id_prod;
            command.Parameters.Add("NOMBRE_PRODUCTO", SqlDbType.VarChar, 50);
            command.Parameters["NOMBRE_PRODUCTO"].Value = nombre_p;
            command.Parameters.Add("DESCRIPCION", SqlDbType.VarChar, 100);
            command.Parameters["DESCRIPCION"].Value = descripcion;
            command.Parameters.Add("ID_DEP", SqlDbType.VarChar, 100);
            command.Parameters["ID_DEP"].Value = id_dep;

            DataTable dt = new DataTable();

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = command;

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
                command.Dispose();
            }
        }

        private void descontinuar_producto(string id_producto)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            SqlCommand command = new SqlCommand();
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Connection = conn;
            command.CommandText = "DESCONTINUAR_PRODUCTO";

            command.Parameters.Add("ID_PRODUCTO", SqlDbType.VarChar, 20);
            command.Parameters["ID_PRODUCTO"].Value = id_producto;

            DataTable dt = new DataTable();

            SqlDataAdapter oDa = new SqlDataAdapter();
            oDa.SelectCommand = command;

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
                command.Dispose();
            }
        }

        private void departamentos()
        {
            SqlConnection oConn = new SqlConnection();
            oConn.ConnectionString = "Data Source=LAPTOP-8DFTSIRJ\\SQLEXPRESSERICK;Initial Catalog=McGreen_3;Integrated Security=True";
            string query = "select * from departamento";
            SqlDataAdapter oDa = new SqlDataAdapter(query, oConn);
            DataTable dt = new DataTable();

            try
            {
                oDa.Fill(dt);

                ddw_departamentos.DataSource = dt;
                ddw_departamentos.DataTextField = "nombre_dep";
                ddw_departamentos.DataValueField = "nombre_dep";
                ddw_departamentos.DataBind();

                ddw_departamentos.Items.Insert(0, "--Seleccionar--");
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
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["email"] != null)
            {
                if (!Page.IsPostBack)
                {
                    mostrar_productos();
                    departamentos();
                }
            } else
            {
                Response.Redirect("Usuarios");
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if( BtnGuardar.Text == "Guardar")
            {
                crear_producto(producto_id.Text, producto.Text, descripcion.Text, 
                    ddw_medidas.SelectedItem.Value.ToString(), ddw_departamentos.SelectedItem.Value.ToString(), Double.Parse(precio.Text));
                mostrar_productos();
            } else if(BtnGuardar.Text == "Actualizar")
            {
                BtnGuardar.Text = "Guardar";
                actualizar_producto(producto_id.Text, producto.Text, descripcion.Text, ddw_departamentos.SelectedItem.Value.ToString());
            }
            Response.Redirect("General.aspx");
        }

        protected void gvDatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            producto_id.Text = gvDatos.Rows[gvDatos.SelectedIndex].Cells[0].Text;
            producto.Text = gvDatos.Rows[gvDatos.SelectedIndex].Cells[1].Text;
            descripcion.Text = gvDatos.Rows[gvDatos.SelectedIndex].Cells[2].Text;
            ddw_medidas.Text = gvDatos.Rows[gvDatos.SelectedIndex].Cells[4].Text;
            ddw_departamentos.Text = gvDatos.Rows[gvDatos.SelectedIndex].Cells[5].Text;
            BtnGuardar.Text = "Actualizar";   
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Descontinuar")
                    {
                        descontinuar_producto(item);
                    }
                }
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