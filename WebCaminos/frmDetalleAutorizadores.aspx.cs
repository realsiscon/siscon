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
    public partial class frmDetalleAutorizadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarPrioridad();
                CargarPersonal();                
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
        }

        protected void cmbPrioridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            Autorizacion clsAutorizacion = new Autorizacion();
            clsAutorizacion.Cod_Prioridad = Convert.ToInt32(cmbPrioridad.SelectedValue);
            DataTable dtDetalle = new DataTable();
            dtDetalle = clsAutorizacion.CargarDetalleAutorizacion();            
            
            dgDetalleAutorizadores.DataSource = dtDetalle;
            dgDetalleAutorizadores.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);

        }

        protected void dgDetalleAutorizadores_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                //DataTable dtPersonal = (DataTable)ViewState["dtPersonal"];

                DropDownList cmbAutorizador = (DropDownList)e.Item.FindControl("cmbAutorizador");

                cmbAutorizador.DataSource = (DataTable)ViewState["dtPersonal"];
                cmbAutorizador.DataTextField = "NombreCompleto";
                cmbAutorizador.DataValueField = "ID_Personal";
                cmbAutorizador.DataBind();                

                cmbAutorizador.Items.Insert(0, new ListItem("Seleccionar","0"));

                //string sss = (e.Item.FindControl("lblAutorizador") as Label).Text;

                if (e.Item.ItemIndex == 0)
                {
                    e.Item.Enabled = false;                    
                    e.Item.BackColor = System.Drawing.Color.Gray;
                }
                    

                if (((Label)e.Item.FindControl("lblAutorizador")).Text != "0")
                {
                    Sesion.SeleccionarCombo(ref cmbAutorizador, ((Label)e.Item.FindControl("lblAutorizador")).Text);
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Autorizacion clsAutorizacion = new Autorizacion();
            clsAutorizacion.Cod_Autorizacion = Convert.ToInt32(cmbPrioridad.SelectedValue);
            clsAutorizacion.usr_desh = Sesion.Login.ID_Personal;

            foreach (DataGridItem item in dgDetalleAutorizadores.Items)
            {                
                DropDownList cmb = item.Cells[0].FindControl("cmbAutorizador") as DropDownList;

                if (Convert.ToInt32(cmb.SelectedValue) == 0 & item.ItemIndex > 0)
                    break;

                DetalleAutorizacion det = new DetalleAutorizacion();

                det.Cod_Autorizacion = clsAutorizacion.Cod_Autorizacion;
                det.Cod_Persona = Convert.ToInt32(cmb.SelectedValue);
                det.Secuencia = Convert.ToInt32(item.Cells[1].Text);
                det.Estado = 0;
                det.Fecha_Registro = DateTime.Now;

                
                clsAutorizacion.Detalle.Add(det);

            }

            if (clsAutorizacion.ModificarDetalleAutorizacion() == 0)
            {
                lblMensajeError.Text = "Registros Modificados Correctamente";
            }
            else
            {
                lblMensajeError.Text = "Error al modificar el Detalle de las Autorizaciones";
            }


        }
    }
}