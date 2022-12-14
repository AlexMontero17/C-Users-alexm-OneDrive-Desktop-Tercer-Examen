using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TercerExamen
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            ClsUsuarios.Usuario = Tusuario.Text;
            ClsUsuarios.Clave = Tclave.Text;

            if (ClsUsuarios.ValidarLogin(ClsUsuarios.Usuario, ClsUsuarios.Clave) > 0)
            {
                    Response.Redirect("Inicio.aspx");

            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('Usuario o contraseña incorrectos');", true);
            }

        }

        protected void Tusuario_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Tclave_TextChanged(object sender, EventArgs e)
        {

        }
    }
}