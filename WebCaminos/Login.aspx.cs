using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class Login_ : Page
    {
        private MensajeAlertas mensajeAlertas = new MensajeAlertas();
        private static log4net.ILog log { get; set; } = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType); // Es lo mismo q poner type(Login)

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                //if (Context.Request.UrlReferrer == null &&
                //   Context.Request.CurrentExecutionFilePath != FormsAuthentication.LoginUrl)
                //{
                //    FormsAuthentication.RedirectToLoginPage();
                //}

                if (!Page.IsPostBack)
                {
                    VaciarDatos();
                }
            }
            catch (ArgumentException ex)
            {
                lblMensajeError.Text = ex.Message;
                lblMensajeError.Focus();
            }
            catch (Exception ex)
            {
                log.Error(ex.Message, ex);
                mensajeAlertas.ErrorGenerico();
                lblMensajeError.Text = mensajeAlertas.MensajeError;
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }
        private void VaciarDatos()
        {
            txtUsuario.Text = string.Empty;
            txtUsuario.Focus();
            txtPassword.Text = string.Empty;
        }

        private void ValidarDatos()
        {
            if (string.IsNullOrEmpty(txtUsuario.Text.Trim()))
                throw new ArgumentException("Ingrese su Usuario");

            if (string.IsNullOrEmpty(txtPassword.Text.Trim()))
                throw new ArgumentException("Ingrese su Clave");

        }

        protected void btnContinuarLogin_Click(object sender, EventArgs e)
        {
            if (cmbEmpresa.SelectedIndex == 0)
            {
                cmbEmpresa.Focus();
                mensajeAlertas.ErrorGenerico();
                lblMensajeError.Text = "Seleccione una empresa para el inicio de sesion.";

                return;
            }


            try
            {

                ValidarDatos();
                LogicaSiscon.Login objLogin = new LogicaSiscon.Login();
                objLogin.UsrLogin = txtUsuario.Text;
                //objLogin.UsrPassword = Sesion.EncriptarPass(txtPassword.Text);
                objLogin.UsrPassword = txtPassword.Text.Trim();

                objLogin = objLogin.InicioLogin();

                if (objLogin.esUsuario)
                {
                    Sesion.Login = objLogin;
                    Response.Redirect("frmPrincipal.aspx", false);
                }
                else
                    lblMensajeError.Text = "Ingreso invalido.";
            }
            catch (ArgumentException ex1)
            {
                log.Error(ex1.Message, ex1);
                lblMensajeError.Text = ex1.Message;
            }
            catch (Exception ex)
            {
                log.Error(ex.Message, ex);               
                lblMensajeError.Text = ex.Message;
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            VaciarDatos();
            Response.Redirect("~/Login.aspx");
        }
    }
}