using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;

namespace WebSISCON
{
    public partial class frmPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarPersonal();
                CargarArea();
                CargarCargos();
                divMotivo.Visible = false;
                hddID_Personal.Value = "0";
            }
        }

        private void CargarPersonal()
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);

            clsPersonal.ObtenerPersonal();

            dgPersonal.DataSource = clsPersonal.dtDatos;
            dgPersonal.DataBind();
        }

        private void CargarArea()
        {
            Area clsArea = new Area();

            clsArea.CargarAreas();
            cmbArea.DataSource = clsArea.dtDatos;
            cmbArea.DataTextField = "Descripcion";
            cmbArea.DataValueField = "ID_Area";
            cmbArea.DataBind();

        }

        private void CargarCargos()
        {
            Cargo clsCargo = new Cargo();

            clsCargo.ObtenerCargos();
            cmbCargo.DataSource = clsCargo.dtDatos;
            cmbCargo.DataTextField = "Descripcion";
            cmbCargo.DataValueField = "ID_Cargo";
            cmbCargo.DataBind();

        }

        protected void dgPersonal_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    pnlRegistro.Visible = true;
                    divGeneral.Visible = false;
                    btnRegistrar.Visible = false;

                    hddID_Personal.Value = dgPersonal.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtNombres.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[4].Text;
                    txtPaterno.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[5].Text;
                    txtMaterno.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[6].Text;
                    txtDireccion.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[7].Text;
                    txtFijo.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[8].Text;
                    txtMovil.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[9].Text;
                    txtMail.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[10].Text;
                    Sesion.SeleccionarCombo(ref cmbCargo, dgPersonal.Items[e.Item.ItemIndex].Cells[11].Text);
                    Sesion.SeleccionarCombo(ref cmbArea, dgPersonal.Items[e.Item.ItemIndex].Cells[12].Text);
                    txtFechaNacimiento.Text = dgPersonal.Items[e.Item.ItemIndex].Cells[13].Text;
                    Sesion.SeleccionarCombo(ref cmbEstado, dgPersonal.Items[e.Item.ItemIndex].Cells[3].Text);
                    
                    updGeneral.Update();
                    break;
                default:
                    break;
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);
            clsPersonal.Nombres = txtNombres.Text; ////////
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

            if (Convert.ToInt32(hddID_Personal.Value) > 0)
            {
                clsPersonal.ID_Personal = Convert.ToInt32(hddID_Personal.Value);

                if (clsPersonal.Estado == 0)
                    clsPersonal.Motivo_Desh = txtMotivo.Text;

                if (clsPersonal.ModificarPersonal() == 0)
                {
                    lblMensajeError.Text = "Registro Modificado exitosamente";
                    MostrarRegistro(false);
                    CargarPersonal();
                    CargarArea();
                    CargarCargos();
                    divMotivo.Visible = false;
                    hddID_Personal.Value = "0";
                }

                else
                    lblMensajeError.Text = "Error al modificar el registro";
            }
            else
            {
                clsPersonal.ID_Personal = 0;
                if (clsPersonal.Registrar() == 0)
                {
                    MostrarRegistro(false);
                    lblMensajeError.Text = "Personal registrado exitosamente";
                    CargarPersonal();
                    CargarArea();
                    CargarCargos();
                    divMotivo.Visible = false;
                    hddID_Personal.Value = "0";

                }

                else
                    lblMensajeError.Text = "Error al Registrar el Personal";
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }

       

        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            divGeneral.Visible = !Mostrar;
            btnRegistrar.Visible = !Mostrar;


        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(true);
        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "0");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }


    }
}