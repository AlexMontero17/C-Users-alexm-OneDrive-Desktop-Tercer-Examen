using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TercerExamen
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TCodigo_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Tprecio_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClsUsuarios.Usuario = Tusuario.Text;
            ClsUsuarios.Clave = Tclave.Text.ToString();
            ClsUsuarios.Nombre = Tnombre.Text.ToString();
            ClsUsuarios.Apellido = Tapellido.Text.ToString();

            if (ClsUsuarios.Agregar(ClsUsuarios.Usuario, ClsUsuarios.Clave, ClsUsuarios.Nombre, ClsUsuarios.Apellido) > 0)
            {
                Response.Redirect("Usuarios.aspx");
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('No ingreso los datos requeridos');", true);
            }


        }

    }
}