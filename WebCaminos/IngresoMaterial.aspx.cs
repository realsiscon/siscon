using LogicaSiscon;
using LogicaSiscon.Almacenes.Transacciones;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class IngresoMaterial : System.Web.UI.Page
    {
        private static Transaccion _transaccion;

        private static Enums.TipoTransaccion tipoTransaccion = Enums.TipoTransaccion.Ingresos;

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                try
                {
                    _transaccion = new Transaccion(Sesion.Login.Id_Empresa);

                    CargarUnidad();
                    CargarMaterial();
                    CargarAlmacenes();
                    validarIngreso();

                    btnRegistrar.Visible = false;
                    txtPrecio.Attributes.Add("onKeypress", "return validateFloatKeyPress(this, event, 4, 2);");
                }
                catch (Exception ex)
                {
                    ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Error);                   
                }

            }

            Utilitarios.CloseLoading(this);            
        }

        private void Limpiar()
        {            
            Sesion.SeleccionarCombo(ref cmbAlmacenOrigen, "0");
            Sesion.SeleccionarCombo(ref cmbAlmacenDestino, "0");
            Sesion.SeleccionarCombo(ref cmbMaterial, "0");
            Sesion.SeleccionarCombo(ref cmbUnidad, "0");
            txtNroPedido.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtCantidad.Text = string.Empty;
            txtPrecio.Text = string.Empty;

            _transaccion.Detalle = new List<DetalleTransaccion>();

            rptDetallePago.DataSource = null;
            rptDetallePago.DataBind();

            btnRegistrar.Visible = false;

        }

        private void HabilitarControles(bool habilitar)
        {           
            cmbAlmacenOrigen.Enabled = habilitar;
            cmbAlmacenDestino.Enabled = habilitar;
            cmbMaterial.Enabled = habilitar;
            cmbUnidad.Enabled = habilitar;

            txtNroPedido.Enabled = habilitar;
            txtDescripcion.Enabled = habilitar;
            txtCantidad.Enabled = habilitar;
            txtPrecio.Enabled = habilitar;

            btnEnviar.Enabled = habilitar;
            btnRegistrar.Enabled = habilitar;

        }

        private void CargarAlmacenes()
        {
            Almacen _almacen = new Almacen(Sesion.Login.Id_Empresa);

            var almacenes = _almacen.Obtener();

            Combos.FillCombo(ref cmbAlmacenOrigen, almacenes, "Nombre_Almacen", "id_Almacen");
            Combos.FillCombo(ref cmbAlmacenDestino, almacenes, "Nombre_Almacen", "id_Almacen");
        }

        private void validarIngreso()
        {
            Almacen _almacen = new Almacen(Sesion.Login.Id_Empresa);

            if (tipoTransaccion == Enums.TipoTransaccion.Ingresos)
            {
                var almacenes = _almacen.EsEncargadoAlmacen(Sesion.Login.ID_Personal);

                if (almacenes.Count == 0)
                {
                    HabilitarControles(false);
                    throw new ArgumentException("El usuario no es encargado de un almacen.");
                }

                cmbAlmacenOrigen.Enabled = false;
                Sesion.SeleccionarCombo(ref cmbAlmacenDestino, Convert.ToString(almacenes[0].id_Almacen));
                cmbAlmacenDestino.Enabled = false;
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
                ucAlertas.CargarMensaje("Registre una descripción de la transaccion.", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            if (cmbMaterial.SelectedIndex == 0)
            {
                ucAlertas.CargarMensaje("Seleccione un Material para el ingreso de Almacen.", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            if (cmbUnidad.SelectedIndex == 0)
            {
                ucAlertas.CargarMensaje("Seleccione una Unidad para el Material del ingreso de Almacen.", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            if (txtCantidad.Text.Length <= 0)
            {
                ucAlertas.CargarMensaje("La Cantidad no puede estar vacia.", MensajeAlertas.Tipo.Advertencia);
                return;
            }

            if (txtPrecio.Text.Length <= 0)
            {
                ucAlertas.CargarMensaje("El precio no puede estar vacio.", MensajeAlertas.Tipo.Advertencia);
                return;
            }

           
                        

            #endregion

            _transaccion.AgregarItem(Convert.ToInt32(cmbAlmacenDestino.SelectedValue), Convert.ToInt32(cmbMaterial.SelectedValue), cmbMaterial.SelectedItem.Text,
                Convert.ToInt32(cmbUnidad.SelectedValue),
                cmbUnidad.SelectedItem.Text,
                Convert.ToInt32(txtCantidad.Text), Convert.ToDecimal(txtPrecio.Text));

            try
            {
                rptDetallePago.DataSource = _transaccion.Detalle;
                rptDetallePago.DataBind();

                Label TotalCuota = (Label)rptDetallePago.Controls[rptDetallePago.Controls.Count - 1].FindControl("lblTotalCuota");

                TotalCuota.Text = Convert.ToString(_transaccion.Detalle.Sum(x=> x.costo_total));

            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje("Error al cargar el Detalle. " + ex.Message, MensajeAlertas.Tipo.Error);
            }
            finally
            {
                cmbMaterial.SelectedIndex = 0;
                cmbUnidad.SelectedIndex = 0;                
                txtCantidad.Text = "";
                txtPrecio.Text = "";                
                Utilitarios.CloseLoading(this);
                btnRegistrar.Visible = true;
            }
        }

        private bool ValidarDatos()
        {
            if (_transaccion.Detalle.Count <= 0)
            {
                ucAlertas.CargarMensaje("Debe tener al menos un Material para ingresar a Almacen.", MensajeAlertas.Tipo.Advertencia);
                return false;
            }
          
            return true;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (!ValidarDatos())
                return;

            int IntResultado = 0;
            try
            {
                _transaccion.ID_transaccion = 0;
                _transaccion.Fecha = DateTime.Now;
                _transaccion.tipo_transaccion_ID = (int)Enums.TipoTransaccion.Ingresos;
                _transaccion.Nro_Orden_Origen = (string.IsNullOrEmpty(txtNroPedido.Text) ? 0 : Convert.ToInt32(txtNroPedido.Text));
                _transaccion.Almacen_Origen = 0;
                _transaccion.Almacen_Destino = Convert.ToInt32(cmbAlmacenDestino.SelectedValue);
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
                    ucAlertas.CargarMensaje("Ingreso a Almacen Registrado exitosamente.", MensajeAlertas.Tipo.Exitoso);
                else
                    ucAlertas.CargarMensaje("Error al registrar el Ingreso.", MensajeAlertas.Tipo.Error);

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