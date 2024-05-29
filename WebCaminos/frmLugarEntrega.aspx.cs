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
    public partial class frmLugarEntrega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarLugares();
                hddID_Lugar.Value = "0";
            }
        }

        private void CargarLugares()
        {
            LugarEntrega clsLugarEntrega = new LugarEntrega();

            clsLugarEntrega.CargarLugaresEntrega();

            dgLugaresEntrega.DataSource = clsLugarEntrega.dtLugaresEstrega;
            dgLugaresEntrega.DataBind();


        }

        protected void dgLugaresEntrega_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    pnlRegistro.Visible = true;
                    divGeneral.Visible = false;
                    btnRegistrar.Visible = false;

                    hddID_Lugar.Value = dgLugaresEntrega.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtLugarEntrega.Text = dgLugaresEntrega.Items[e.Item.ItemIndex].Cells[1].Text;
                    cmbEstado.SelectedIndex = Convert.ToInt32(dgLugaresEntrega.Items[e.Item.ItemIndex].Cells[3].Text);
                    updGeneral.Update();

                    //LugarEntrega clsLugares = new LugarEntrega();
                    //clsLugares.ID_Lugar = Convert.ToInt32(dgLugaresEntrega.Items[e.Item.ItemIndex].Cells[0].Text); ;
                    //clsLugares.Nombre_Lugar = txtLugarEntrega.Text;
                    //clsLugares.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

                    //if (clsLugares.ModificarLugarEntrega() == 0)
                    //    lblMensajeError.Text = "Registro Modificado exitosamente.";
                    //else
                    //    lblMensajeError.Text = "Error al Modificar el registro";




                    break;
                default:
                    break;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            pnlRegistro.Visible = true;
            divGeneral.Visible = false;
            btnRegistrar.Visible = false;
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            LugarEntrega clsLugares = new LugarEntrega();
            clsLugares.Nombre_Lugar = txtLugarEntrega.Text;
            clsLugares.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (Convert.ToInt32(hddID_Lugar.Value) > 0)
            {
                clsLugares.ID_Lugar = Convert.ToInt32(hddID_Lugar.Value);
                if (clsLugares.ModificarLugarEntrega() == 0)
                {
                    lblMensajeError.Text = "Registro Modificado exitosamente";

                    CargarLugares();
                    hddID_Lugar.Value = "0";

                    pnlRegistro.Visible = false;
                    divGeneral.Visible = true;
                    btnRegistrar.Visible = true;
                }
                   
                else
                    lblMensajeError.Text = "Error al modificar el registro";
            }
            else
            {
                clsLugares.ID_Lugar = 0;
                if (clsLugares.RegistrarLugar() == 0)
                {
                    lblMensajeError.Text = "Lugar de Entrega registrado exitosamente";

                    CargarLugares();
                    hddID_Lugar.Value = "0";

                    pnlRegistro.Visible = false;
                    divGeneral.Visible = true;
                    btnRegistrar.Visible = true;
                }

                else
                    lblMensajeError.Text = "Error al Registrar el Lugar de Entrega";
            }
        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "9");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }
    }
}