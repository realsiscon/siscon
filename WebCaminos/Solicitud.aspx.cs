using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using WebCaminos.svcCaminos;
using LogicaSiscon;

namespace WebSISCON
{
    public partial class Solicitud : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarProyectos();
                CargarPrioridad();
                CargarUnidad();
                CargarMaterial();
                CargarLugaresEntrega();
                CargarObservaciones();

                ViewState["ImporteTotal"] = 0;
            }


        }

        private void CargarProyectos()
        {
            
            //List<Proyecto> objLista = new List<Proyecto>();
            DataTable objLista = new DataTable();
            Proyecto Proyecto = new Proyecto();


            try
            {
                objLista = Proyecto.ObtenerProyectos();
                if (objLista.Rows.Count > 0)
                {
                    cmbProyecto.DataSource = objLista;
                    cmbProyecto.DataTextField = "Nomb_Proyecto";
                    cmbProyecto.DataValueField = "ID_proyecto";
                    cmbProyecto.DataBind();

                    ViewState["Proyectos"] = objLista;
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        private void CargarPrioridad()
        {
            //svcCaminos.CaminosClient ServCaminos = new CaminosClient();
            //svcCaminos.Prioridad[] Prioridad = new Prioridad[] { };
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
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        private void CargarUnidad()
        {
            //svcCaminos.CaminosClient ServCaminos = new CaminosClient();
            //svcCaminos.Unidad[] Unidad = new Unidad[] { };
            List<Unidad> objLista = new List<Unidad>();
            Unidad objUnidad = new Unidad();

            try
            {
                objLista = objUnidad.CargarUnidad();
                if (objLista.Count > 0)
                {
                    cmbUnidad.DataSource = objLista;
                    cmbUnidad.DataTextField = "Desc_Unidad";
                    cmbUnidad.DataValueField = "Id_Unidad";
                    cmbUnidad.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        private void CargarMaterial()
        {
            //svcCaminos.CaminosClient ServCaminos = new CaminosClient();
            //svcCaminos.Unidad[] Unidad = new Unidad[] { };
            List<Material> objLista = new List<Material>();
            Material objMaterial = new Material(Sesion.Login.Id_Empresa);

            try
            {
                objLista = objMaterial.CargarMaterial();
                if (objLista.Count > 0)
                {
                    cmbMaterial.DataSource = objLista;
                    cmbMaterial.DataTextField = "Nombre_Material";
                    cmbMaterial.DataValueField = "Cod_Material";
                    cmbMaterial.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        private void CargarLugaresEntrega()
        {
            //svcCaminos.CaminosClient ServCaminos = new CaminosClient();
            //svcCaminos.LugarEntrega[] Lugares = new LugarEntrega[] { };
            List<LugarEntrega> objLista = new List<LugarEntrega>();
            LugarEntrega objLugar = new LugarEntrega();

            try
            {
                objLista = objLugar.CargarLugaresEntrega();
                if (objLista.Count > 0)
                {
                    cmbLugarEntrega.DataSource = objLista;
                    cmbLugarEntrega.DataTextField = "Nombre_Lugar";
                    cmbLugarEntrega.DataValueField = "ID_Lugar";
                    cmbLugarEntrega.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        private void CargarObservaciones()
        {
            List<Observaciones> lstObservaciones = new List<Observaciones>();
            Observaciones clsObservaciones = new Observaciones();
            try
            {
                lstObservaciones = clsObservaciones.CargarObservaciones();
                if (lstObservaciones.Count > 0)
                {
                    cmbObservaciones.DataSource = lstObservaciones;
                    cmbObservaciones.DataTextField = "Descripcion";
                    cmbObservaciones.DataValueField = "Cod_Observaciones";
                    cmbObservaciones.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }

        protected void cmbProyecto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbProyecto.SelectedIndex != 0)
            {
                //Proyecto[] objListaProyecto = new Proyecto[] { };
                DataTable objListaProyecto = new DataTable();
                Proyecto objProy = new Proyecto();

                objListaProyecto = (DataTable)ViewState["Proyectos"];

                txtNombreProyecto.Text = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + " ")[0]["Nomb_Proyecto"].ToString(); //.FirstOrDefault(x => x.ID_proyecto == Convert.ToInt32(cmbProyecto.SelectedValue)).Nomb_Proyecto;
                txtResponsable.Text = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + " ")[0]["Nomb_Responsable"].ToString(); // objListaProyecto.FirstOrDefault(x => x.ID_proyecto == Convert.ToInt32(cmbProyecto.SelectedValue)).Nomb_Responsable;
            }
        }
        
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            #region Validaciones

            // Validar Unidad
            if (Convert.ToString(cmbUnidad.SelectedValue) == "0")
            {
                lblMensajeError.Text = "Debe Seleccionar una Unidad";
                return;
            }

            // Validad Cantidad
            if (txtCantidad.Text.Length <= 0)
            {
                lblMensajeError.Text = "El valor de Cantidad es invalido.";
                return;
            }

            // Validar Material
            if (Convert.ToString(cmbMaterial.SelectedValue) == "0")
            {
                lblMensajeError.Text = "Debe Seleccionar un Material";
                return;
            }

            // Validar Observaciones
            if (Convert.ToString(cmbObservaciones.SelectedValue) == "0")
            {
                lblMensajeError.Text = "Debe Seleccionar una observacion";
                return;
            }

            #endregion


            // Agregar Detalle de materiales
            DataTable Detalle = new DataTable();
          
            List<Detalle_Solicitud> objLista = new List<Detalle_Solicitud>();
            Detalle_Solicitud objDetalle = new Detalle_Solicitud();
            decimal lDecImporteParcial = 0;

            try
            {

                Detalle.Columns.Add(new DataColumn("Item", System.Type.GetType("System.Int16")));
                Detalle.Columns.Add(new DataColumn("Cod_Unidad", System.Type.GetType("System.Int32")));
                Detalle.Columns.Add(new DataColumn("Unidad", System.Type.GetType("System.String")));
                Detalle.Columns.Add(new DataColumn("Cantidad", System.Type.GetType("System.Decimal")));
                Detalle.Columns.Add(new DataColumn("Cod_Material", System.Type.GetType("System.Int32")));
                Detalle.Columns.Add(new DataColumn("Material", System.Type.GetType("System.String")));
                Detalle.Columns.Add(new DataColumn("Precio_Unitario", System.Type.GetType("System.Decimal")));
                Detalle.Columns.Add(new DataColumn("Precio_Parcial", System.Type.GetType("System.Decimal")));
                Detalle.Columns.Add(new DataColumn("Cod_Observaciones", System.Type.GetType("System.Int32")));

                DataRow Fila = Detalle.NewRow();

                Fila["Item"] = rptDetallePago.Items.Count + 1;
                Fila["Cod_Unidad"] = Convert.ToInt32(cmbUnidad.SelectedValue);
                Fila["Unidad"] = Convert.ToString(cmbUnidad.SelectedItem.Text);
                Fila["Cantidad"] = Convert.ToDecimal(txtCantidad.Text);
                Fila["Cod_Material"] = Convert.ToInt32(cmbMaterial.SelectedValue);
                Fila["Material"] = Convert.ToString(cmbMaterial.SelectedItem.Text);
                Fila["Precio_Unitario"] = Convert.ToDecimal(txtPrecio.Text);
                Fila["Precio_Parcial"] = Convert.ToDecimal(txtCantidad.Text) * Convert.ToDecimal(txtPrecio.Text);
                Fila["Cod_Observaciones"] = Convert.ToInt32(cmbObservaciones.SelectedValue);

                lDecImporteParcial = (Convert.ToDecimal(txtCantidad.Text) * Convert.ToDecimal(txtPrecio.Text));

                ViewState["ImporteTotal"] = Convert.ToDecimal(ViewState["ImporteTotal"]) + lDecImporteParcial;

                Detalle.Rows.Add(Fila);

                if (ViewState["Detalle"] == null)
                    ViewState["Detalle"] = Detalle;

                if (((DataTable)ViewState["Detalle"]).Rows.Count > 0)
                {
                    ((DataTable)ViewState["Detalle"]).Merge(Detalle);
                }
                else
                    ViewState["Detalle"] = Detalle;


                rptDetallePago.DataSource = (DataTable)ViewState["Detalle"];
                rptDetallePago.DataBind();

                Label TotalCuota = (Label)rptDetallePago.Controls[rptDetallePago.Controls.Count - 1].FindControl("lblTotalCuota");

                TotalCuota.Text = Convert.ToString(ViewState["ImporteTotal"]);

            }
            catch (Exception ex)
            {
                lblMensajeError.Text = "Error al cargar el Detalle. " + ex.Message;
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

            LogicaSiscon.Solicitud_Compra objSolicitud = new LogicaSiscon.Solicitud_Compra();

            //string lStrResultado = "";
            int IntResultado = 0;
            try
            {
                objSolicitud.ID_Proyecto = Convert.ToInt32(cmbProyecto.SelectedValue);
                objSolicitud.usr_Solicitud = Sesion.Login.ID_Personal;
                //objSolicitud.usr_gerente_area = 55;
                objSolicitud.ID_LugarEntrega = Convert.ToInt32(cmbLugarEntrega.SelectedValue);
                objSolicitud.Cod_Prioridad = Convert.ToInt32(cmbPrioridad.SelectedValue);
                objSolicitud.Fecha_Entrega = Convert.ToDateTime(txtFecha.Value);
                objSolicitud.Importe_Total = Convert.ToDecimal(ViewState["ImporteTotal"]);
                objSolicitud.Detalle = ((DataTable)ViewState["Detalle"]);

                IntResultado = objSolicitud.RegistrarSolicitud(); // .RegistrarSolicitud(objSolicitud);
                if (IntResultado >  0)
                    lblMensajeError.Text = "Solicitud Registrada exitosamente.";
                else
                    lblMensajeError.Text = "Error al registrar la Solicitud.";
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
            finally { 

            }
        }
    }
}