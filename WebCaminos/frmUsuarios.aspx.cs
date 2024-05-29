using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class frmUsuarios : System.Web.UI.Page
    {
        private static List<UsuarioDto> lstUsuarios;
        private static UsuarioDto _usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                Inicializar();
            }
        }
        private void Inicializar()
        {            
            CargarPersonal();
            MostrarRegistro(true);
        }
        private void CargarUsuarios()
        {
            Usuarios clsUsuario = new Usuarios(Sesion.Login.Id_Empresa);

            clsUsuario.ObtenerUsuarios();            
            lstUsuarios = clsUsuario.lstUsuarios;
            rptUsuarios.DataSource = clsUsuario.lstUsuarios;
            rptUsuarios.DataBind();
        }

        private void CargarPersonal()
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);
            clsPersonal.ObtenerPersonal();

            Combos.FillCombo(ref cmbPersonal, clsPersonal.dtDatos, "NombreCompleto", "ID_Personal");

        }

       
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Usuarios clsUsuario = new Usuarios(Sesion.Login.Id_Empresa);
            
            clsUsuario.login = txtUsuario.Text; 
            clsUsuario.password = txtPassword.Text.Trim();
            //clsUsuario.password = Sesion.EncriptarPass(txtPassword.Text);
           

            clsUsuario.ID_Personal = Convert.ToInt32(cmbPersonal.SelectedValue);
            clsUsuario.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (_usuario != null && _usuario.cod_usuario > 0)
            {
                clsUsuario.cod_Usuario = _usuario.cod_usuario;

                if (clsUsuario.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsUsuario.Motivo_Desh = txtMotivo.Text;

                if (clsUsuario.ModificarRegistro() == 0)
                {
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);
                }

                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                clsUsuario.cod_Usuario = 0;
                if (clsUsuario.Registrar() == 0)
                {
                    ucAlertas.CargarMensaje("Datos registrados exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(false);
                }

                else
                    ucAlertas.CargarMensaje("Error al Registrar el dato", MensajeAlertas.Tipo.Error);
            }

            Utilitarios.CloseLoading(this);
            Utilitarios.ScrollTop(this);
        }


        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            RegistroDatos.Visible = !Mostrar;

            if (Mostrar)
            {
                CargarUsuarios();
            }

            divMotivo.Visible = (cmbEstado.SelectedValue == "0");

            Utilitarios.ScrollTop(this);
            Utilitarios.CloseLoading(this);

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(false);
            Utilitarios.CleanControl(this);
            cmbPersonal.Enabled = true;
        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ucAlertas.Limpiar();
            divMotivo.Visible = (cmbEstado.SelectedValue == "0");
            Utilitarios.CloseLoading(this);
        }

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(false);

                _usuario = lstUsuarios.Find(x => x.cod_usuario == Convert.ToInt32(e.CommandArgument));

                txtUsuario.Text = _usuario.login;
                txtPassword.Text = _usuario.password;

                Sesion.SeleccionarCombo(ref cmbPersonal, _usuario.id_personal.ToString());
                Sesion.SeleccionarCombo(ref cmbEstado, _usuario.estado.ToString());

                cmbPersonal.Enabled = false;

                divMotivo.Visible = (cmbEstado.SelectedValue == "0");
            }
            catch (Exception ex)
            {

                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Advertencia);
                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

       

       
    }
}