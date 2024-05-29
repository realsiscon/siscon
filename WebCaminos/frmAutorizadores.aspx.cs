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
    public partial class frmAutorizadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarPrioridad();
                CargarPersonal();
                divPersonal.Visible = false;
                divEstado.Visible = false;
            }
        }

        private void CargarPrioridad()
        {
            List<Prioridad> objLista = new List<Prioridad>();
            Prioridad objPrioridad = new Prioridad();

            try
            {
                objLista = objPrioridad.CargarPrioridad();// .CargarPrioridad();
                if (objLista.Count > 0)
                {
                    cmbPrioridad.DataSource = objLista;
                    cmbPrioridad.DataTextField = "Desc_Prioridad";
                    cmbPrioridad.DataValueField = "Id_Prioridad";
                    cmbPrioridad.DataBind();

                    cmbPrioridad.Items.Insert(0, "Seleccionar");
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        private void CargarPersonal()
        {
            Personal clsPersonal = new Personal();
            DataTable dtPersonal = new DataTable();

            dtPersonal = clsPersonal.ObtenerPersonal();

            
            ViewState["dtPersonal"] = dtPersonal;

            cmbPersonal.DataSource = dtPersonal;
            cmbPersonal.DataTextField = "NombreCompleto";
            cmbPersonal.DataValueField = "ID_Personal";
            cmbPersonal.DataBind();
        }

        protected void cmbPrioridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            Autorizacion clsAutorizacion = new Autorizacion();
            clsAutorizacion.Cod_Prioridad = Convert.ToInt32(cmbPrioridad.SelectedValue);
            DataTable dtDetalle = new DataTable();
            dtDetalle = clsAutorizacion.CargarDetalleAutorizacion();

            if (dtDetalle.Rows.Count > 0)
            {
                dgDetalleAutorizadores.DataSource = dtDetalle;
                dgDetalleAutorizadores.DataBind();
            }
            else
            {
                //dgDetalleAutorizadores.DataSource = null;
                //dgDetalleAutorizadores.DataBind();


                cmbPersonal.SelectedIndex = 0;
                txtSecuencia.Text = "";
                cmbEstado.SelectedIndex = 0;
                txtMotivo.Text = "";

                divPersonal.Visible = false;
                divEstado.Visible = false;
            }



            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);

        }

        protected void dgDetalleAutorizadores_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    divEstado.Visible = true;
                    divPersonal.Visible = true;

                    hddID_DetAutorizaciones.Value = dgDetalleAutorizadores.Items[e.Item.ItemIndex].Cells[0].Text;
                    Sesion.SeleccionarCombo(ref cmbPersonal, dgDetalleAutorizadores.Items[e.Item.ItemIndex].Cells[5].Text);
                    txtSecuencia.Text = dgDetalleAutorizadores.Items[e.Item.ItemIndex].Cells[2].Text;
                    Sesion.SeleccionarCombo(ref cmbEstado, dgDetalleAutorizadores.Items[e.Item.ItemIndex].Cells[4].Text);

                    updGeneral.Update();
                    break;
                default:
                    break;
            }
        }

        protected void dgDetalleAutorizadores_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                //DataTable dtPersonal = (DataTable)ViewState["dtPersonal"];

                DropDownList list = (DropDownList)e.Item.FindControl("cmbAutorizador");
                list.DataSource = (DataTable)ViewState["dtPersonal"];
                list.DataTextField = "NombreCompleto";
                list.DataValueField = "ID_Personal";
                list.DataBind();
                
            }


            


        }
    }
}