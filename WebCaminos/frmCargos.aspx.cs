using LogicaSiscon;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class frmCargos : System.Web.UI.Page
    {
        private static List<CargoDto> lstCargos = new List<CargoDto>();
        private static CargoDto _cargo = new CargoDto();

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                Inicializar(true);
            }
        }

        private void Inicializar(bool esInicio = false)
        {
            CargarCargos();

            MostrarRegistro(esInicio);
        }

        private void MostrarRegistro(bool mostrar = false)
        {
            CargosEmpresa.Visible = mostrar;
            RegistroDatos.Visible = !mostrar;
        }

        private void CargarCargos()
        {
            Cargo clsCargo = new Cargo();
            clsCargo.ObtenerCargos();
            lstCargos = clsCargo.CargoList;

            rptCargos.DataSource = clsCargo.dtDatos;
            rptCargos.DataBind();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(false);
        }

        protected void rptCargos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;
        }

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(false);

                _cargo = lstCargos.Find(x => x.ID_cargo == Convert.ToInt32(e.CommandArgument));

                hddID_Cargo.Value = _cargo.ID_cargo.ToString();
                txtNombre.Text = _cargo.Descripcion;
                Sesion.SeleccionarCombo(ref cmbHabilitado, _cargo.Estado.ToString());
                txtMotivo.Text = "";

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

        protected void cmbHabilitado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ucAlertas.Limpiar();

            txtMotivo.Enabled = (cmbHabilitado.SelectedValue != "-1");
            divMotivo.Visible = (cmbHabilitado.SelectedValue == "0");

            Utilitarios.CloseLoading(this);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Cargo clsCargo = new Cargo();
            clsCargo.Descripcion = txtNombre.Text;
            clsCargo.Estado = Convert.ToInt32(cmbHabilitado.SelectedValue);
            clsCargo.usr_desh = Sesion.Login.ID_Personal;

            if (clsCargo.Estado == -1)
            {
                ucAlertas.CargarMensaje("Debe seleccionar un estado para el registro", MensajeAlertas.Tipo.Error);
                return;
            }
                
            if(_cargo != null && _cargo.ID_cargo > 0)
            {
                clsCargo.ID_cargo = _cargo.ID_cargo;
                if (clsCargo.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsCargo.Motivo_Desh = txtMotivo.Text;

                if (clsCargo.ModificarCargo() == 0)
                {                    
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    Inicializar(true);
                }

                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                clsCargo.ID_cargo = 0;
                if (clsCargo.Registrar() == 0)
                {
                    ucAlertas.CargarMensaje("Cargo registrado exitosamente", MensajeAlertas.Tipo.Exitoso); 
                    Inicializar(true);
                }

                else
                    ucAlertas.CargarMensaje("Error al Registrar el Cargo", MensajeAlertas.Tipo.Error);
            }

            Utilitarios.CloseLoading(this);
            Utilitarios.ScrollTop(this);            
        }
    }
}