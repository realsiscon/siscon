using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class frmUnidad : System.Web.UI.Page
    {
        private static List<UnidadDto> _unidades;
        private static UnidadDto _unidad = new UnidadDto();

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                MostrarRegistro(true);                
            }
        }

        private void CargarUnidades()
        {
            Unidad clsUnidad = new Unidad();

            _unidades = clsUnidad.CargarUnidad();

            rptUnidades.DataSource = _unidades;
            rptUnidades.DataBind();
        }

        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            RegistroDatos.Visible = !Mostrar;

            if (Mostrar)
            {
                CargarUnidades();
            }
            
            divMotivo.Visible = (cmbEstado.SelectedValue == "0");

        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(false);
            Utilitarios.CleanControl(this);
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Unidad clsUnidad = new Unidad();
            clsUnidad.Desc_Unidad = txtUnidad.Text;
            clsUnidad.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (_unidad != null && _unidad.Cod_unidad > 0)
            {
                clsUnidad.Id_Unidad = _unidad.Cod_unidad;

                if (clsUnidad.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsUnidad.Motivo_Desh = txtMotivo.Text;

                if (clsUnidad.ModificarRegistro() == 0)
                {
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);                   
                }

                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                clsUnidad.Id_Unidad = 0;
                if (clsUnidad.Registrar() == 0)
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

                _unidad = _unidades.Find(x => x.Cod_unidad == Convert.ToInt32(e.CommandArgument));

                txtUnidad.Text = _unidad.Descripcion;                
                Sesion.SeleccionarCombo(ref cmbEstado, _unidad.estado.ToString());
                

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