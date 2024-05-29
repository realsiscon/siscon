using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using WebSISCON.AppCode;
using WebSISCON.Controles;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;

namespace WebSISCON
{
    public partial class frmSolicitudCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarProyectos();
                CargarUnidad();
                CargarMaterial();

                ViewState["ImporteTotal"] = 0;

                txtFechaPedido.Text = DateTime.Now.ToString("dd/MM/yyyy");

                btnRegistrar.Visible = false;
            }
        }

        private void Limpiar()
        {
            hddID_Solicitud.Value = "0";
            Sesion.SeleccionarCombo(ref cmbProyecto, "0");
            txtDirectorObra.Text = string.Empty;
            txtFiscalObra.Text = string.Empty;
            txtFechaInicio1.Value = string.Empty;
            Sesion.SeleccionarCombo(ref cmbActividad, "0");
            Sesion.SeleccionarCombo(ref cmbUnidad, "0");
            txtCantidad.Text = string.Empty;
            Sesion.SeleccionarCombo(ref cmbMaterial, "0");
            txtPrecio.Text = string.Empty;

        }

        private void CargarProyectos()
        {

            try
            {
                DataTable objLista;
                Proyecto Proyecto = new Proyecto(Sesion.Login.Id_Empresa);

                objLista = Proyecto.ObtenerProyectos();
                if (objLista.Rows.Count > 0)
                {
                    cmbProyecto.DataSource = objLista;
                    cmbProyecto.DataTextField = "Nomb_Proyecto";
                    cmbProyecto.DataValueField = "ID_proyecto";
                    cmbProyecto.DataBind();

                    ViewState["Proyectos"] = objLista;

                    cmbProyecto.Items.Insert(0, new ListItem("Seleccionar", "0"));
                }
            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.Message + " - " + ex.Source, MensajeAlertas.Tipo.Error);
            }
        }

        private void CargarUnidad()
        {
            List<UnidadDto> objLista;
            Unidad objUnidad = new Unidad();

            try
            {
                objLista = objUnidad.CargarUnidad();
                if (objLista.Count > 0)
                {
                    Combos.FillCombo(ref cmbUnidad, objLista, "Descripcion", "Cod_unidad");                    
                }
            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.Message + " - " + ex.Source, MensajeAlertas.Tipo.Error);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

        private void CargarMaterial()
        {
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

                    cmbMaterial.Items.Insert(0, new ListItem("Seleccionar", "0"));
                }
            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.Message + " - " + ex.Source, MensajeAlertas.Tipo.Error);
            }
        }

        private void CargarActividad()
        {
            Actividad oActividad = new Actividad(Sesion.Login.Id_Empresa);
            try
            {
                if (cmbProyecto.SelectedIndex == 0)
                {
                    throw new Exception("Debe seleccionar primero un proyecto.");
                }

                oActividad.id_Proyecto = Convert.ToInt32(cmbProyecto.SelectedValue);

                DataTable dtActividad = oActividad.Obtener();

                if (dtActividad != null && dtActividad.Rows.Count > 0)
                {
                    cmbActividad.DataSource = dtActividad;
                    cmbActividad.DataTextField = "nombre_actividad";
                    cmbActividad.DataValueField = "id_actividad";
                    cmbActividad.DataBind();

                    cmbActividad.Items.Insert(0, new ListItem("Seleccionar", "0"));
                }
                else
                {
                    throw new ArgumentException("El proyecto no tiene asignada ninguna actividad. Para realizar pedidos de Material primero registre actividades.");
                }
            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.Message + " - " + ex.Source, MensajeAlertas.Tipo.Error);
            }
        }

        protected void cmbProyecto_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmbProyecto.SelectedIndex != 0)
                {
                    DataTable objListaProyecto;                    

                    objListaProyecto = (DataTable)ViewState["Proyectos"];                    
                    txtCliente.Text = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + " ")[0]["Nombre_cliente"].ToString();
                    txtDirectorObra.Text = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + " ")[0]["Director_Obra"].ToString();
                    txtFiscalObra.Text = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + "")[0]["Fiscal_Obra"].ToString();
                    txtAlmacen.Text = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + "")[0]["Nombre_Almacen"].ToString();
                    hddGerenteArea.Value = objListaProyecto.Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + "")[0]["id_director"].ToString();

                    CargarActividad();
                }
            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Error);
            }
            finally
            {
                Utilitarios.ScrollTop(this);
                Utilitarios.CloseLoading(this);
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            #region Validaciones

            // Validar Unidad
            if (Convert.ToString(cmbUnidad.SelectedValue) == "0")
            {
                ucAlertas.CargarMensaje("Debe Seleccionar una Unidad", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            // Validad Cantidad
            if (txtCantidad.Text.Length <= 0)
            {
                ucAlertas.CargarMensaje("El valor de Cantidad es invalido.", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            // Validar Material
            if (Convert.ToString(cmbMaterial.SelectedValue) == "0")
            {
                ucAlertas.CargarMensaje("Debe Seleccionar un Material", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            #endregion

            // Agregar Detalle de materiales
            DataTable Detalle = new DataTable();
            decimal lDecImporteParcial = 0;

            try
            {

                Detalle.Columns.Add(new DataColumn("Item", System.Type.GetType("System.Int16")));
                Detalle.Columns.Add(new DataColumn("Cod_Unidad", System.Type.GetType("System.Int32")));
                Detalle.Columns.Add(new DataColumn("Unidad", System.Type.GetType("System.String")));
                Detalle.Columns.Add(new DataColumn("Cantidad", System.Type.GetType("System.Decimal")));
                Detalle.Columns.Add(new DataColumn("Cod_Material", System.Type.GetType("System.Int32")));
                Detalle.Columns.Add(new DataColumn("Material", System.Type.GetType("System.String")));
                Detalle.Columns.Add(new DataColumn("id_actividad", System.Type.GetType("System.Int32")));
                Detalle.Columns.Add(new DataColumn("id_empresa", System.Type.GetType("System.Int32")));
                Detalle.Columns.Add(new DataColumn("Precio_Unitario", System.Type.GetType("System.Decimal")));
                Detalle.Columns.Add(new DataColumn("Precio_Parcial", System.Type.GetType("System.Decimal")));

                DataRow Fila = Detalle.NewRow();

                Fila["Item"] = rptDetallePago.Items.Count + 1;
                Fila["Cod_Unidad"] = Convert.ToInt32(cmbUnidad.SelectedValue);
                Fila["Unidad"] = Convert.ToString(cmbUnidad.SelectedItem.Text);
                Fila["Cantidad"] = Convert.ToDecimal(txtCantidad.Text);
                Fila["Cod_Material"] = Convert.ToInt32(cmbMaterial.SelectedValue);
                Fila["Material"] = Convert.ToString(cmbMaterial.SelectedItem.Text);
                Fila["id_actividad"] = Convert.ToInt32(cmbActividad.SelectedValue);
                Fila["id_empresa"] = Convert.ToInt32(Sesion.Login.Id_Empresa);
                Fila["Precio_Unitario"] = Convert.ToDecimal(txtPrecio.Text);


                lDecImporteParcial = (Convert.ToDecimal(txtCantidad.Text) * Convert.ToDecimal(txtPrecio.Text));
                Fila["Precio_Parcial"] = Convert.ToDecimal(lDecImporteParcial);


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

                if (TotalCuota != null)
                    TotalCuota.Text = Convert.ToString(ViewState["ImporteTotal"]);

            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje("Error al cargar el Detalle. " + ex.Message, MensajeAlertas.Tipo.Error);
            }
            finally
            {
                cmbMaterial.SelectedIndex = 0;
                cmbUnidad.SelectedIndex = 0;
                cmbActividad.SelectedIndex = 0;
                txtCantidad.Text = "";
                txtPrecio.Text = "";
                Utilitarios.CloseLoading(this);                

                btnRegistrar.Visible = true;
            }
        }

        private bool ValidarDatos()
        {
            if (Convert.ToDateTime(txtFechaInicio1.Value) < DateTime.Now.Date)
            {
                ucAlertas.CargarMensaje("La Fecha de Entrega no puede ser menor a la fecha actual.", MensajeAlertas.Tipo.Advertencia);
                return false;
            }

            return true;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Solicitud_Compra objSolicitud = new Solicitud_Compra(Sesion.Login.Id_Empresa);

            if (!ValidarDatos())
                return;

            int IntResultado = 0;
            try
            {
                objSolicitud.ID_Solicitud = 0;
                objSolicitud.ID_Proyecto = Convert.ToInt32(cmbProyecto.SelectedValue);
                objSolicitud.usr_Solicitud = Sesion.Login.ID_Personal;
                objSolicitud.id_solicitante = Sesion.Login.ID_Personal;
                objSolicitud.descripcion = txtObservacion.Text.Trim();
                objSolicitud.id_director = Convert.ToInt32(hddGerenteArea.Value);
                objSolicitud.mail_director = ((DataTable)ViewState["Proyectos"]).Select("ID_proyecto = " + Convert.ToInt32(cmbProyecto.SelectedValue) + "")[0]["mail_director"].ToString(); ;
                objSolicitud.Fecha_Entrega = Convert.ToDateTime(txtFechaInicio1.Value);
                objSolicitud.Detalle = ((DataTable)ViewState["Detalle"]);
                objSolicitud.Estado_Solicitud = "S";

                IntResultado = objSolicitud.RegistrarSolicitud();
                if (IntResultado == 0)
                    ucAlertas.CargarMensaje("Solicitud Registrada exitosamente.", MensajeAlertas.Tipo.Exitoso);
                else
                    ucAlertas.CargarMensaje("Error al registrar la Solicitud.", MensajeAlertas.Tipo.Error);

                Limpiar();

            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Error);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
                Utilitarios.ScrollTop(this);
            }
        }
        
        protected void rptDetallePago_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}