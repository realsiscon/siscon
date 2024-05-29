using LogicaSiscon.Almacenes.Transacciones;
using LogicaSiscon.Utilitarios;
using LogicaSiscon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSISCON.AppCode;

namespace WebSISCON
{
    public partial class SalidasAlmacen : System.Web.UI.Page
    {
        private static Transaccion _transaccion;

        private static Enums.TipoTransaccion tipoTransaccion = Enums.TipoTransaccion.Salidas;

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                try
                {

                    _transaccion = new Transaccion(Sesion.Login.Id_Empresa);

                    MostrarSolicitudes(true);





                    CargarUnidad();
                    CargarMaterial();
                    CargarAlmacenes();
                    validarIngreso();                   

                    btnRegistrar.Visible = false;
                }
                catch (Exception ex)
                {
                    lblMensajeError.Text = ex.Message;
                    return;
                }

            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
        }

        private void MostrarSolicitudes(bool visible)
        {
            pnlSolicitudes.Visible = visible;
            pnlRegistro.Visible = !visible;

            if(visible)
            {
                //Cargar Solicitudes Pendientes               

                dgSolicitudesPendientes.DataSource = _transaccion.ObtenerSolicitudesPendientes(Sesion.Login.ID_Personal); ;
                dgSolicitudesPendientes.DataBind();
            }
        }

        private void Limpiar()
        {
            
            Sesion.SeleccionarCombo(ref cmbAlmacenOrigen, "0");           
            Sesion.SeleccionarCombo(ref cmbMaterial, "0");
            Sesion.SeleccionarCombo(ref cmbUnidad, "0");
            txtNroPedido.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtCantidad.Text = string.Empty;
            //txtPrecio.Text = string.Empty;

            dgMaterial.DataSource = null;
            dgMaterial.DataBind();

        }

        private void HabilitarControles(bool habilitar)
        {
            
            cmbAlmacenOrigen.Enabled = habilitar;            
            cmbMaterial.Enabled = habilitar;
            cmbUnidad.Enabled = habilitar;

            txtNroPedido.Enabled = habilitar;
            txtDescripcion.Enabled = habilitar;
            txtCantidad.Enabled = habilitar;

            btnEnviar.Enabled = habilitar;
            btnRegistrar.Enabled = habilitar;

        }

        private void CargarAlmacenes()
        {
            Almacen _almacen = new Almacen(Sesion.Login.Id_Empresa);

            var almacenes = _almacen.Obtener();

            Combos.FillCombo(ref cmbAlmacenOrigen, almacenes, "Nombre_Almacen", "id_Almacen");           
        }

        private void validarIngreso()
        {
            Almacen _almacen = new Almacen(Sesion.Login.Id_Empresa);

            if (tipoTransaccion == Enums.TipoTransaccion.Traspaso)
            {
                var almacenes = _almacen.EsEncargadoAlmacen(Sesion.Login.ID_Personal, true);

                if (almacenes.Count == 0)
                {
                    HabilitarControles(false);
                    throw new ArgumentException("El usuario no es el encargado principal de almacenes.");
                }

                //cmbAlmacenOrigen.Enabled = false;
                //Sesion.SeleccionarCombo(ref cmbAlmacenDestino, Convert.ToString(almacenes[0].id_Almacen));
                //cmbAlmacenDestino.Enabled = false;

                //txtPrecio.Text = "0";
                //txtPrecio.Enabled = false;
            }
        }

        private void CargarUnidad()
        {
            Unidad objUnidad = new Unidad();

            Combos.FillCombo(ref cmbUnidad, objUnidad.CargarUnidad(), "Descripcion", "Cod_unidad");
        }

        private void CargarMaterial()
        {
            Material objMaterial = new Material(Sesion.Login.Id_Empresa);

            Combos.FillCombo(ref cmbMaterial, objMaterial.MaterialesParaIngresos(), "Nombre_Material", "Cod_Material");
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            #region Validaciones

            if (txtDescripcion.Text.Length <= 0)
            {
                lblMensajeError.Text = "Registre una descripción de la transaccion.";
                return;
            }

            if (cmbMaterial.SelectedIndex == 0)
            {
                lblMensajeError.Text = "Seleccione un Material para el ingreso de Almacen.";
                return;
            }

            if (cmbUnidad.SelectedIndex == 0)
            {
                lblMensajeError.Text = "Seleccione una Unidad para el Material del ingreso de Almacen.";
                return;
            }

            if (txtCantidad.Text.Length <= 0)
            {
                lblMensajeError.Text = "La Cantidad no puede estar vacia.";
                return;
            }
            
            #endregion

            //verificar esta parte del almacen origen
            _transaccion.AgregarItem(Convert.ToInt32(cmbAlmacenOrigen.SelectedValue), Convert.ToInt32(cmbMaterial.SelectedValue), cmbMaterial.SelectedItem.Text,
                Convert.ToInt32(cmbUnidad.SelectedValue),
                cmbUnidad.SelectedItem.Text,
                Convert.ToInt32(txtCantidad.Text), 0);

            try
            {
                dgMaterial.DataSource = _transaccion.Detalle;
                dgMaterial.DataBind();

                //Label TotalCuota = (Label)rptDetallePago.Controls[rptDetallePago.Controls.Count - 1].FindControl("lblTotalCuota");

                //TotalCuota.Text = Convert.ToString(_transaccion.Detalle.Sum(x => x.precio_unitario));

            }
            catch (Exception ex)
            {
                lblMensajeError.Text = "Error al cargar el Detalle. " + ex.Message;
            }
            finally
            {
                cmbMaterial.SelectedIndex = 0;
                cmbUnidad.SelectedIndex = 0;
                //cmbActividad.SelectedIndex = 0;
                txtCantidad.Text = "";
                //txtPrecio.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);

                btnRegistrar.Visible = true;
            }
        }

        private bool ValidarDatos()
        {
            //if (Convert.ToDateTime(txtFechaEntrega.Value) < DateTime.Now.Date)
            //{
            //    lblMensajeError.Text = "La Fecha de Entrega no puede ser menor a la fecha actual.";
            //    return false;
            //}

            return true;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {


            if (!ValidarDatos())
                return;

            //string lStrResultado = "";
            int IntResultado = 0;
            try
            {
                _transaccion.ID_transaccion = 0;
                _transaccion.Fecha = DateTime.Now;
                _transaccion.tipo_transaccion_ID = (int)Enums.TipoTransaccion.Traspaso;
                _transaccion.Nro_Orden_Origen = (string.IsNullOrEmpty(txtNroPedido.Text) ? 0 : Convert.ToInt32(txtNroPedido.Text));
                _transaccion.Almacen_Origen = Convert.ToInt32(cmbAlmacenOrigen.SelectedValue); ;
                _transaccion.Almacen_Destino = 0; // Convert.ToInt32(cmbAlmacenDestino.SelectedValue);
                _transaccion.Recibe_Material = Convert.ToInt32(Sesion.Login.ID_Personal);
                _transaccion.Descripcion = txtDescripcion.Text.Trim();
                _transaccion.Importe_Total = _transaccion.Detalle.Sum(x => x.costo_total);
                _transaccion.estado = 1;
                _transaccion.sec = 0;
                _transaccion.fecha_creacion = DateTime.Now;
                _transaccion.usr_alta = Sesion.Login.ID_Personal;
                _transaccion.fecha_desh = null;
                _transaccion.id_empresa = Sesion.Login.Id_Empresa;

                IntResultado = _transaccion.Registrar();
                if (IntResultado == 0)
                    lblMensajeError.Text = "Ingreso a Almacen Registrado exitosamente.";
                else
                    lblMensajeError.Text = "Error al registrar el Ingreso.";

                Limpiar();

            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
            finally
            {
                Utilitarios.CloseLoading(this);
                Utilitarios.ScrollTop(this);
            }
        }

        protected void dgSolicitudesPendientes_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            
        }

        protected void dgMaterial_ItemCommand(object source, DataGridCommandEventArgs e)
        {

        }
    }
}