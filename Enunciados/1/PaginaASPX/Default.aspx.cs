using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PaginaASPX
{
    public partial class _Default : Page
    {
        const bool OCURRIO_ERROR = true;
        const bool NO_OCURRIO_ERROR = false;

        /// <summary>
        /// Inicio de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que se ejecuta al hacer click en el botón de login.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtNombreUsuario.Text;
            string contrasena = txtContrasena.Text;

            if (string.IsNullOrWhiteSpace(nombreUsuario) || string.IsNullOrWhiteSpace(contrasena))
            {
                this.mostrarMensaje("Por favor, completa todos los campos.", OCURRIO_ERROR);
            }
            else
            {
                if (CredencialesValidas(nombreUsuario, contrasena))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Credenciales correctas. ¡Bienvenido de nuevo!');", true);
                    this.mostrarMensaje("Credenciales correctas. ¡Bienvenido de nuevo!", NO_OCURRIO_ERROR);
                    Response.Redirect("Contact.aspx");
                }
                else
                {
                    this.mostrarMensaje("Credenciales incorrectas. Por favor, intenta de nuevo.", OCURRIO_ERROR);
                }
            }
        }

        /// <summary>
        /// Valida las credenciales ingresadas por el usuario.
        /// </summary>
        /// <param name="nombreUsuario">Nombre de usuario.</param>
        /// <param name="contrasena">Contraseña del usuario.</param>
        /// <returns><see cref="bool"/> que indica si las credencialees son validas.</returns>
        private bool CredencialesValidas(string nombreUsuario, string contrasena)
        {
            return nombreUsuario == "gomzalo" && contrasena == "Promerica2023.";
        }

        /// <summary>
        /// Muestra un mensaje en la pantalla.
        /// </summary>
        /// <param name="mensaje">Mensaje a mostrar.</param>
        /// <param name="error">Indica si es un mensaje de error o un mensaje satisfactorio.</param>
        private void mostrarMensaje(string mensaje, bool error)
        {
            if (error)
            {
                lblMessage.Text = mensaje;
                lblMessage.Visible = true;
                lblSuccess.Visible = false;
            } else
            {
                lblSuccess.Text = mensaje;
                lblSuccess.Visible = true;
                lblMessage.Visible = false;
            }            
        }
    }
}