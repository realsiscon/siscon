using LogicaSiscon;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class frmCliente : System.Web.UI.Page
    {
        private static List<ClienteDto> lstclientes;
        private static ClienteDto _cliente;
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
            MostrarRegistro(true);
        }

        private void CargarClientes()
        {
            Cliente clsCliente = new Cliente(Sesion.Login.Id_Empresa);

            clsCliente.Obtener();
            lstclientes = clsCliente.lsClientes;
            rptCliente.DataSource = clsCliente.lsClientes;
            rptCliente.DataBind();
        }
        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            RegistroDatos.Visible = !Mostrar;

            if (Mostrar)
            {
                CargarClientes();
            }

            divMotivo.Visible = (cmbEstado.SelectedValue == "0");

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Cliente clsCliente = new Cliente(Sesion.Login.Id_Empresa);

            clsCliente.Nombre_cliente = txtNombreCliente.Text;
            clsCliente.tipo_persona = Convert.ToInt16(cmbTipoPersona.SelectedValue);
            clsCliente.Nro_Doc = txtNroDoc.Text;
            clsCliente.direccion = txtDireccion.Text;
            clsCliente.telefono = txtTelefono.Text;
            clsCliente.mail= txtMail.Text;
            clsCliente.estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (_cliente != null && _cliente.id_cliente > 0)
            {
                clsCliente.id_cliente = _cliente.id_cliente;

                //if (clsCliente.estado == (int)Enums.EstadoActivo.Inactivo)
                //    clsCliente.Motivo_Desh = txtMotivo.Text;

                if (clsCliente.ModificarRegistro() == 0)
                {
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);
                }

                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                clsCliente.id_cliente = 0;
                if (clsCliente.Registrar() == 0)
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

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(false);

                _cliente = lstclientes.Find(x => x.id_cliente == Convert.ToInt32(e.CommandArgument));

                txtNombreCliente.Text = _cliente.Nombre_cliente;
                Sesion.SeleccionarCombo(ref cmbTipoPersona, _cliente.tipo_persona.ToString());
                txtNroDoc.Text = _cliente.Nro_Doc;
                txtDireccion.Text = _cliente.direccion;
                txtTelefono.Text = _cliente.telefono;
                txtMail.Text = _cliente.mail;
                Sesion.SeleccionarCombo(ref cmbEstado, _cliente.estado.ToString());

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

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(false);
            Utilitarios.CleanControl(this);
        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ucAlertas.Limpiar();
            divMotivo.Visible = (cmbEstado.SelectedValue == "0");
            Utilitarios.CloseLoading(this);
        }
    }
}