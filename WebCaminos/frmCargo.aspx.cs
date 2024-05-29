using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using LogicaSiscon.Utilitarios;

namespace WebSISCON
{
    public partial class frmCargo : System.Web.UI.Page
    {
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
            divMotivo.Visible = false;
            hddID_Cargo.Value = "0";
            if(esInicio)
                lblMensajeError.Text = string.Empty;
        }

        private void CargarCargos()
        {
            Cargo clsCargo = new Cargo();

            clsCargo.ObtenerCargos();

            dgCargo.DataSource = clsCargo.dtDatos;
            dgCargo.DataBind();
        }

        protected void dgCargo_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    pnlRegistro.Visible = true;
                    divGeneral.Visible = false;
                    btnRegistrar.Visible = false;

                    hddID_Cargo.Value = dgCargo.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtNombre.Text = dgCargo.Items[e.Item.ItemIndex].Cells[1].Text;
                    cmbEstado.SelectedIndex = Convert.ToInt32(dgCargo.Items[e.Item.ItemIndex].Cells[3].Text);
                    updGeneral.Update();
                    break;
                default:
                    break;
            }
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

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Cargo clsCargo = new Cargo();
            clsCargo.Descripcion = txtNombre.Text;
            clsCargo.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (clsCargo.Estado == -1)
                lblMensajeError.Text = "Debe seleccionar un estado para el registro";


            if (Convert.ToInt32(hddID_Cargo.Value) > 0)
            {
                clsCargo.ID_cargo = Convert.ToInt32(hddID_Cargo.Value);

                if (clsCargo.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsCargo.Motivo_Desh = txtMotivo.Text;

                if (clsCargo.ModificarCargo() == 0)
                {
                    MostrarRegistro(false);
                    lblMensajeError.Text = "Registro Modificado exitosamente";
                    Inicializar();
                }

                else
                    lblMensajeError.Text = "Error al modificar el registro";
            }
            else
            {
                clsCargo.ID_cargo = 0;
                if (clsCargo.Registrar() == 0)
                {
                    lblMensajeError.Text = "Cargo registrado exitosamente";
                    MostrarRegistro(false);
                    Inicializar();
                }

                else
                    lblMensajeError.Text = "Error al Registrar el Cargo";
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);


        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "0");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }


    }
}