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
    public partial class frmObservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarObservaciones();
                divMotivo.Visible = false;
                hddID_Observacion.Value = "0";
            }
        }

        private void CargarObservaciones()
        {
            Observaciones clsObservaciones = new Observaciones();

            clsObservaciones.CargarObservaciones();

            dgObservaciones.DataSource = clsObservaciones.dtDatos;
            dgObservaciones.DataBind();
        }

        protected void dgObservaciones_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    pnlRegistro.Visible = true;
                    divGeneral.Visible = false;
                    btnRegistrar.Visible = false;

                    hddID_Observacion.Value = dgObservaciones.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtObservacion.Text = dgObservaciones.Items[e.Item.ItemIndex].Cells[1].Text;
                    cmbEstado.SelectedIndex = Convert.ToInt32(dgObservaciones.Items[e.Item.ItemIndex].Cells[3].Text);
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
            Observaciones clsObservaciones = new Observaciones();
            clsObservaciones.Descripcion = txtObservacion.Text;
            clsObservaciones.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (Convert.ToInt32(hddID_Observacion.Value) > 0)
            {
                clsObservaciones.Cod_Observaciones = Convert.ToInt32(hddID_Observacion.Value);

                if (clsObservaciones.Estado == 9)
                    clsObservaciones.Motivo_Desh = txtMotivo.Text;

                if (clsObservaciones.ModificarRegistro() == 0)
                {
                    lblMensajeError.Text = "Registro Modificado exitosamente";
                    MostrarRegistro(false);
                    CargarObservaciones();
                    divMotivo.Visible = false;
                    hddID_Observacion.Value = "0";
                }
                    
                else
                    lblMensajeError.Text = "Error al modificar el registro";
            }
            else
            {
                clsObservaciones.Cod_Observaciones = 0;
                if (clsObservaciones.Registrar() == 0)
                {
                    lblMensajeError.Text = "Observacion registrada exitosamente";
                    MostrarRegistro(false);
                    CargarObservaciones();
                    divMotivo.Visible = false;
                    hddID_Observacion.Value = "0";
                }
                    
                else
                    lblMensajeError.Text = "Error al Registrar la Observacion";
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);


        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "9");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }

       
    }
}