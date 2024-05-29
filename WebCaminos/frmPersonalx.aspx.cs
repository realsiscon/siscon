using LogicaSiscon;
using LogicaSiscon.Dto;
using LogicaSiscon.Dto.Reportes;
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
    public partial class frmPersonalx : System.Web.UI.Page
    {
        private static List<PersonalDto> lstPersonal;
        private static PersonalDto _personal;

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarPersonal();
                CargarArea();
                CargarCargos();

                MostrarRegistro(false);
            }
        }

        private void CargarPersonal()
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);

            clsPersonal.ObtenerPersonal();
            lstPersonal = clsPersonal.lstPersonal;

            rptPersonal.DataSource = lstPersonal;
            rptPersonal.DataBind();
        }

        private void CargarArea()
        {
            Area clsArea = new Area();

            clsArea.CargarAreas();

            Combos.FillCombo(ref cmbArea, clsArea.dtDatos, "Descripcion", "ID_Area");
        }

        private void CargarCargos()
        {
            Cargo clsCargo = new Cargo();

            clsCargo.ObtenerCargos();

            Combos.FillCombo(ref cmbCargo, clsCargo.dtDatos, "Descripcion", "ID_Cargo");

        }

        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = !Mostrar;            
            RegistroDatos.Visible = Mostrar;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(true);           
            Utilitarios.CleanControl(this.Page.Controls);
        }

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(true);

                _personal = lstPersonal.Find(x => x.ID_Personal == Convert.ToInt32(e.CommandArgument));

                txtNombres.Text = _personal.Nombres;
                txtPaterno.Text = _personal.Ap_Paterno;
                txtMaterno.Text = _personal.Ap_Materno;
                txtDireccion.Text = _personal.Direccion;
                txtFijo.Text = _personal.Tel_Fijo;
                txtMovil.Text = _personal.Tel_Movil;
                txtMail.Text = _personal.Mail;
                Sesion.SeleccionarCombo(ref cmbArea, _personal.ID_Area.ToString());
                Sesion.SeleccionarCombo(ref cmbCargo, _personal.ID_Cargo.ToString());
                txtFechaNacimiento.Text = Convert.ToDateTime(_personal.Fecha_Nac).ToString("dd-MM-yyyy");
                Sesion.SeleccionarCombo(ref cmbEstado, _personal.Estado.ToString());                
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


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);
            clsPersonal.Nombres = txtNombres.Text; 
            clsPersonal.Ap_Paterno = txtPaterno.Text;
            clsPersonal.Ap_Materno = txtMaterno.Text;
            clsPersonal.Direccion = txtDireccion.Text;
            clsPersonal.Tel_Fijo = txtFijo.Text;
            clsPersonal.Tel_Movil = txtMovil.Text;
            clsPersonal.Mail = txtMail.Text;
            clsPersonal.ID_Cargo = Convert.ToInt32(cmbCargo.SelectedValue);
            clsPersonal.ID_Area = Convert.ToInt32(cmbArea.SelectedValue);
            clsPersonal.Fecha_Nac = Convert.ToDateTime(txtFechaNacimiento.Text);

            clsPersonal.Estado = Convert.ToInt32(cmbEstado.SelectedValue);
            clsPersonal.usr_desh = Sesion.Login.ID_Personal;

            if (_personal != null && _personal.ID_Personal > 0)
            {
                clsPersonal.ID_Personal = _personal.ID_Personal;

                if (clsPersonal.Estado == 0)
                {
                    if (txtMotivo.Text.Length == 0)
                    {
                        ucAlertas.CargarMensaje("Debe ingresar un motivo de eliminacion", MensajeAlertas.Tipo.Advertencia);
                        return;
                    }
                    clsPersonal.Motivo_Desh = txtMotivo.Text;
                }
                    

                if (clsPersonal.ModificarPersonal() == 0)
                {
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(false);
                    CargarPersonal();                   
                    divMotivo.Visible = false;                    
                }

                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                clsPersonal.ID_Personal = 0;
                if (clsPersonal.Registrar() == 0)
                {
                    MostrarRegistro(false);
                    ucAlertas.CargarMensaje("Personal registrado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    CargarPersonal();
                    CargarArea();                    
                    divMotivo.Visible = false;
                }

                else
                    ucAlertas.CargarMensaje("Error al Registrar el Personal", MensajeAlertas.Tipo.Error);
            }

            Utilitarios.CloseLoading(this);
            Utilitarios.ScrollTop(this);
        }

        protected void rptPersonal_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;
        }
    }
}