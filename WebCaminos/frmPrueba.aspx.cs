using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class frmPrueba : Page
    {

        public string MensageAlternativo { get; set; }
        private RepeaterItem _repeaterItemCP;
        private RepeaterItem _repeaterItemCE;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Parametros.enLinea())
                {
                    //verificacion de session
                    if (Context.Request.UrlReferrer == null &&
                        Context.Request.CurrentExecutionFilePath != FormsAuthentication.LoginUrl)
                    {
                        FormsAuthentication.RedirectToLoginPage();
                    }

                    CargarOtp();

                    if (!Page.IsPostBack)
                    {
                        if (Sesion.Servicio.validarPantalla("TransferenciaACH.aspx"))
                        {
                            Sesion.Servicio.ObtenerCuentasExternasTRACH();
                            CargarGrillas();
                            CargarComboMonedas();
                            txtMonto.Attributes.Add("onKeyPress", "return numerosYpunto(this, event)");
                            if (Sesion.NroCuenta != 0)
                            {
                                Seleccionarcuenta();
                            }
                            Sesion.Servicio.codigoTrnMenu = Sesion.ObtenerCodigoTrnMenu(Context.Request.CurrentExecutionFilePath);
                        }
                        else
                        {
                            Sesion.Salir();
                        }
                    }
                }
                else
                {
                    Sesion.Salir();
                }
            }
            catch (ArgumentException ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Error);
                Utilitarios.ScrollTop(this);
            }
            catch (Exception ex)
            {
                Index.Log.Error(ex.Message, ex);
                ucAlertas.ErrorGenerico();
                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

        private void Seleccionarcuenta()
        {
            foreach (RepeaterItem item in rptCuentasPropias.Items)
            {
                Label lbl = (Label)item.FindControl("lblCuenta");
                decimal cta = Convert.ToDecimal(lbl.Text);
                if (cta == Sesion.NroCuenta)
                {
                    RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionar");
                    rb.Checked = true;
                    Sesion.VaciarSesionCuenta();
                }
            }
        }

        private Dictionary<string, Object> ObtenerFilaCuentaACHSeleccionada()
        {
            Dictionary<string, Object> obj = new Dictionary<string, object>();
            foreach (RepeaterItem item in rptCuentasExternas.Items)
            {
                RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionarDestino");
                if (rb.Checked)
                {
                    obj.Add("cuenta", ((Label)item.FindControl("lblcuenta")).Text);
                    obj.Add("nombre", ((Label)item.FindControl("lblNombre")).Text);
                    obj.Add("producto", ((Label)item.FindControl("lblTipoCuentaDesc")).Text);
                    obj.Add("tipocuenta", ((Label)item.FindControl("lblTipoCuentaCod")).Text);
                    obj.Add("entidad", ((Label)item.FindControl("lblentidad")).Text);
                }
            }

            return obj;
        }

        protected void SelecionCuenta(object sender, EventArgs e)
        {
            try
            {
                ucAlertas.Limpiar();
                Dictionary<string, Object> obj = ObtenerFilaCuentaACHSeleccionada();

                hfMensaje.Value =
                    $"{Convert.ToString(obj["cuenta"])} a nombre de {Convert.ToString(obj["nombre"])} del {Convert.ToString(obj["entidad"])}";
                cdHidden.Value = Convert.ToString(obj["cuenta"]);
            }
            catch (ArgumentException ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Advertencia);
                Utilitarios.ScrollTop(this);
            }
            catch (Exception ex)
            {
                Index.Log.Error(ex.Message, ex);
                ucAlertas.ErrorGenerico();
                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

        protected void lnkEliminar_Command(Object sender, CommandEventArgs e)
        {
            try
            {
                string detalle = string.Empty;
                foreach (RepeaterItem item in rptCuentasExternas.Items)
                {
                    Label rb = (Label)item.FindControl("lblcuenta");
                    if (rb.Text == e.CommandArgument.ToString())
                    {
                        string cuenta = ((Label)item.FindControl("lblcuenta")).Text;
                        string desc = ((Label)item.FindControl("lblentidad")).Text;
                        detalle = $" Nro.{cuenta} - {desc}";
                    }
                }

                Sesion.Servicio.eliminarCtaExterna(e.CommandArgument.ToString(), detalle);
                Response.Redirect("TransferenciaACH.aspx");
            }
            catch (ArgumentException ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Advertencia);
                Utilitarios.ScrollTop(this);
            }
            catch (Exception ex)
            {
                Index.Log.Error(ex.Message, ex);
                ucAlertas.ErrorGenerico();
                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

        private void CargarComboMonedas()
        {
            cbmMoneda.DataSource = Funciones.obtenerMonedas(true);
            cbmMoneda.DataTextField = "descripcionMoneda";
            cbmMoneda.DataValueField = "idMoneda";
            cbmMoneda.DataBind();
        }

        private void CargarGrillas()
        {
            //Creo un nuevo servicio
            Servicio objServicio = Sesion.Servicio;
            //Cargo la posicion consolidad de Cuentas de Ahorro
            DataSet dsCuentas = objServicio.PoscionConsolidadaCtas(true);
            if (dsCuentas.Tables["dtCuentas"].Rows.Count > 0)
            {
                rptCuentasPropias.DataSource = dsCuentas.Tables["dtCuentas"];
                rptCuentasPropias.DataMember = "dtCuentas";
                rptCuentasPropias.DataBind();

                if ((dsCuentas.Tables["dtCuentas"].Rows.Count == 1) && (Sesion.NroCuenta == 0))
                {
                    foreach (RepeaterItem item in rptCuentasPropias.Items)
                    {
                        RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionar");
                        rb.Checked = true;
                    }
                }

                //Armando fichas
                Session["dtCuenta"] = dsCuentas.Tables["dtCuentas"];
                TransferenciasACH.Visible = true;
            }
            else
            {
                TransferenciasACH.Visible = false;
                throw new ArgumentException("Ud. no tiene cuentas disponibles.");
            }
            //Cargo la posicion consolidada de Cuentas de externas
            DataTable dtExternas = objServicio.PoscionConsolidadaCtasExternas();
            Session["dtExternas"] = dtExternas;
            if (dtExternas.Rows.Count > 0)
            {
                rptCuentasExternas.DataSource = dtExternas;
                rptCuentasExternas.DataBind();

                if (dtExternas.Rows.Count == 1)
                {
                    foreach (RepeaterItem item in rptCuentasExternas.Items)
                    {
                        RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionarDestino");
                        rb.Checked = true;
                    }
                }
            }
        }

        protected void rptCuentasPropias_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            RadioButton rdo = (RadioButton)e.Item.FindControl("rdbSeleccionar");
            string script = "UnicoRadioButton('rptCuentasPropias.*rbGrupo',this)";
            rdo.Attributes.Add("onclick", script);
        }

        protected void rptCuentasExternas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            RadioButton rdo = (RadioButton)e.Item.FindControl("rdbSeleccionarDestino");
            string script = "UnicoRadioButton('rptCuentasExternas.*rbGrupoTerceros',this);";
            rdo.Attributes.Add("onclick", script);
        }

        private int ObtenerMonedaSeleccionada()
        {
            int moneda;
            int.TryParse(cbmMoneda.SelectedValue, out moneda);

            return moneda;
        }

        private void SelecionarFilaCuentasDestino()
        {
            foreach (RepeaterItem item in rptCuentasExternas.Items)
            {
                Label cuenta = (Label)item.FindControl("lblcuenta");
                if (cuenta.Text.Equals(Convert.ToString(cdHidden.Value)))
                {
                    RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionarDestino");
                    rb.Checked = true;
                    break;
                }
            }
        }

        private void Transferir()
        {
            int codigo_camara = -1;
            int proxima_camara = -1;
            string glosa;
            // Obtengo los datos de la camara en curso
            object origenItem = ObtenerFilaCuentasPropias();
            if (origenItem == null)
            {
                throw new ArgumentException("Debe seleccionar una cuenta de origen");
            }
            object destinoItem = ObtenerFilaCuentasExternas();
            if (destinoItem == null)
            {
                throw new ArgumentException("Debe seleccionar una cuenta de destino");
            }
            if (txtMonto.Text == string.Empty || txtMonto.Text == ".")
            {
                throw new ArgumentException("Debe ingresar un monto");
            }

            string cuentaOrigen = ObtenerCuentaOrigenSeleccionada();
            string cuentaDestino = ObtenerCuentaDestinoSeleccionada();
            int productoOrigen = ObtenerProductoOrigenSeleccionada();
            string productoDestino = ObtenerProductoDestinoSeleccionada();
            int moneda = ObtenerMonedaSeleccionada();
            if (moneda == 0)
            {
                throw new ArgumentException("Debe seleccionar una moneda para la operación");
            }
            int monedaOrigen = ObtenerMonedaOrigenSeleccionada();
            decimal importe = Funciones.formatearComas(txtMonto.Text);

            if (importe <= 0)
            {
                throw new ArgumentException("Debe ingresar un monto mayor a 0");
            }

            decimal importeDolares = Sesion.Servicio.PasarMontoADolares(importe, moneda);
            decimal saldoOrigen = ObtenerSaldoCuentaOrigenSeleccionada();
            decimal saldoOrigenDolares = Sesion.Servicio.PasarMontoADolares(saldoOrigen, monedaOrigen);



            string descriproductoorigen = ObtenerDescripProductoOrigenSeleccionada();
            string descriproductodestino = ObtenerDescripProductoDestinoSeleccionada();
            string descripCuentaOrigen = ObtenerCuentaOrigenSeleccionada();
            string descripCuentaDestino = ObtenerCuentaDestinoSeleccionada();
            string nombrecliente = ObtenerNombreClienteDestinoSeleccionada();
            string entidadDestino = ObtenerEntidadDestinoSeleccionada();
            int codEntidadDestino = ObtenerCodigoEntidadDestinoSeleccionada();
            string descripMonedaOrigen = ObtenerDescripMonedaOrigenSeleccionada();

            string ci_nit_destinatario = ObtenerCI_NIT();
            if (string.IsNullOrEmpty(ci_nit_destinatario))
            {
                throw new ArgumentException("Debe ingresar un CI/NIT para el destinatario");
            }

            if (string.IsNullOrEmpty(txtDesc.Text.Trim()))
            {
                throw new ArgumentException("Debe ingresar una descripción válida.No se permite una descripción con caracteres especiales o vacía.");
            }
            if (txtDesc.Text.Trim().Length < 4)
            {
                throw new ArgumentException("Debe ingresar una descripción que contenga por lo menos 4 caracteres");
            }

            String pattern = "^[A-Z a-z 0-9 ,./]+$";
            string sinespacio = this.txtDesc.Text.Trim();
            if (sinespacio.Length == 0)
            {
                throw new Exception("Debe ingresar una descripción válida. No se permite una descripción con caracteres especiales o vacía.");
            }
            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(pattern);

            //  Y después hacer la comprobación en la función del botón:
            if (!(regex.IsMatch(this.txtDesc.Text)))
            {
                throw new ArgumentException("Debe ingresar una descripción válida. No se permite una descripción con caracteres especiales o vacía.");
            }



            glosa = txtDesc.Text;

            int tipoTrans = ObtenerTipoCuentaSeleccionada();

            decimal comision = 0;
            int canal = 0;
            int operador = 3;
            int cobroEspecial = 0;
            string origenFondo = TextBoxOrigenFondo.Text;
            string destinoFondo = TextBoxDestinoFondo.Text;
            string motivo = TextBoxMotivo.Text;
            string nroTran = string.Empty;
            string codOTP = (Sesion.Servicio.codOperador != 0 ? string.Empty : ucOTP.obtenerOTP());

            ValidarCamposLavado();



            ArrayList result = Sesion.Servicio.TransferirACtaExterna(tipoTrans, codEntidadDestino, productoOrigen,
                cuentaOrigen,
                cuentaDestino, moneda, productoDestino, ci_nit_destinatario, nombrecliente, importe, moneda,
                comision, canal, operador, cobroEspecial, origenFondo, destinoFondo, motivo, glosa, nroTran, codOTP);

            if (Sesion.Servicio.codOperador != 0)
            {
                if (Convert.ToInt32(result[0].ToString()) == 0)
                    Sesion.ComprobanteGen =
                        Servicio.ObtenerTablaComprobanteTRN(((DataSet)result[result.Count - 1]).Tables[0].Copy());

            }
            else
            {
                ConfirmacionACH conf = new ConfirmacionACH();

                conf.CuentaDestino = descripCuentaDestino;
                conf.CuentaOrigen = descriproductoorigen + "  " + descripCuentaOrigen;
                conf.Estado = Convert.ToInt32(result[0].ToString()) != 0
                    ? "Transferencia pendiente de autorización"
                    : "Transferencia completada";
                conf.Fecha = DateTime.Now.ToShortDateString();
                conf.Hora = DateTime.Now.ToShortTimeString();
                conf.Moneda = cbmMoneda.SelectedItem.Text;
                conf.Monto = Funciones.FormatearMonto(Funciones.formatearComas(txtMonto.Text));
                conf.Operacion = "Transferencia a cuentas de otros Bancos";
                conf.Nombrecliente = nombrecliente;
                conf.Descripcion = result[3].ToString();
                conf.EntidadDestino = entidadDestino;
                conf.TipoCuenta = descriproductodestino;
                conf.NroConfirmacion = nroTran;

                conf.VentaME = result[1].ToString();
                conf.DocIdBeneficiario = result[2].ToString();
                conf.DocBeneficiarioOrigen1 = Sesion.Servicio.beneficiario.documentoBeneficiario;
                if (Convert.ToInt32(result[0].ToString()) == 0)
                {
                    conf.NumeroComprobante = result[4].ToString();
                }

                Sesion.ConfirmacionTranACH = conf;
            }
            Response.Redirect("ComprobanteTransferencia.aspx");
        }

        /**
         * Transferencia a cuentas de ACH
         */
        private bool isValidCodeComprobante(string codeComprobante)
        {
            if (!string.IsNullOrEmpty(codeComprobante))
            {
                return true;
            }
            return false;
        }

        protected void btnTransferir_Click(object sender, EventArgs e)
        {
            try
            {
                Transferir();
            }
            catch (ArgumentException ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Advertencia);
                Utilitarios.ScrollTop(this);
            }
            catch (Exception ex)
            {
                Index.Log.Error(ex.Message, ex);

                if (ex.Data.Contains("mensajeExtracto"))
                    ucAlertas.ErrorGenerico(true);
                else if (ex.Data.Contains("irConsolidado"))
                {
                    Response.Redirect("PosicionConsolidada.aspx?irPosicion=1", true);
                }
                else
                    ucAlertas.ErrorGenerico();

                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

        private void ValidarCamposLavado()
        {
            int codMoneda;
            bool esMenorMonto = false;
            string origen;
            string destino;
            string motivo;
            bool result = int.TryParse(cbmMoneda.SelectedValue, out codMoneda);
            if (result)
            {
                esMenorMonto = Sesion.Servicio.validarLimiteACH(codMoneda, Funciones.formatearComas(txtMonto.Text));

                if (!esMenorMonto)
                {
                    origen = TextBoxOrigenFondo.Text;
                    destino = TextBoxDestinoFondo.Text;
                    motivo = TextBoxMotivo.Text;

                    if ((origen == string.Empty) || (destino == string.Empty) || (motivo == string.Empty))
                    {
                        mostrar1.Visible = true;
                        mostrar2.Visible = true;
                        mostrar3.Visible = true;

                        throw new ArgumentException(
                            "Los datos de Origen, Destino y Motivo de la transacción son obligatorios");
                    }
                }
            }
        }

        private string ObtenerCuentaOrigenSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasPropias();
            Label lbl = (Label)item.FindControl("lblCuenta");
            return lbl.Text;
        }

        private int ObtenerProductoOrigenSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasPropias();
            Label lbl = (Label)item.FindControl("lblproducto");
            return Convert.ToInt32(lbl.Text);
        }

        private int ObtenerMonedaOrigenSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasPropias();
            Label lbl = (Label)item.FindControl("lblCodMoneda");
            return int.Parse(lbl.Text);
        }

        private decimal ObtenerSaldoCuentaOrigenSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasPropias();
            Label lbl = (Label)item.FindControl("lblsaldo");
            return Funciones.formatearComas(lbl.Text);
        }

        private string ObtenerDescripMonedaOrigenSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasPropias();
            Label lbl = (Label)item.FindControl("lblMoneda");
            return lbl.Text;
        }

        private int ObtenerTipoCuentaSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblTipoCuentaId");
            return int.Parse(lbl.Text);
        }

        private string ObtenerCI_NIT()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblcinit");
            return lbl.Text;
        }

        private string ObtenerCuentaDestinoSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblcuenta");
            return lbl.Text;
        }

        private int ObtenerCodigoEntidadDestinoSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblcodentidad");
            return Convert.ToInt32(lbl.Text);
        }

        private string ObtenerEntidadDestinoSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblEntidad");
            return Convert.ToString(lbl.Text);
        }

        private string ObtenerNombreClienteDestinoSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblNombre");
            return lbl.Text.ToUpper();
        }

        private string ObtenerDescripProductoDestinoSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblTipoCuentaDesc");
            return lbl.Text;
        }

        private string ObtenerDescripProductoOrigenSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasPropias();
            Label lbl = (Label)item.FindControl("lblconcepto");
            return Convert.ToString(lbl.Text);
        }

        private string ObtenerProductoDestinoSeleccionada()
        {
            RepeaterItem item = ObtenerFilaCuentasExternas();
            Label lbl = (Label)item.FindControl("lblTipoCuentaCod");
            return lbl.Text;
        }

        private RepeaterItem ObtenerFilaCuentasPropias()
        {
            if (_repeaterItemCP == null)
            {
                foreach (RepeaterItem item in rptCuentasPropias.Items)
                {
                    RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionar");
                    if (rb.Checked)
                    {
                        _repeaterItemCP = item;
                    }
                }
            }

            return _repeaterItemCP;
        }

        private RepeaterItem ObtenerFilaCuentasExternas()
        {
            if (_repeaterItemCE == null)
            {
                foreach (RepeaterItem item in rptCuentasExternas.Items)
                {
                    RadioButton rb = (RadioButton)item.FindControl("rdbSeleccionarDestino");
                    if (rb.Checked)
                    {
                        _repeaterItemCE = item;
                    }
                }
            }

            return _repeaterItemCE;
        }
        private void CargarOtp()
        {
            // Para crear el evento de Validacion de OTP en los Servicios de Detect ID
            if (Sesion.Factores_Autenticacion != null && Sesion.Factores_Autenticacion.Count > 0)
            {
                foreach (FactorAutenticacion item in Sesion.Factores_Autenticacion)
                {
                    ucOTP.IdFactor = item.ID_Factor;
                }
            }
            else
            {
                ucOTP.SesionClaveTran = Sesion.Servicio.ClaveTran;
            }
            if (Sesion.Servicio.codOperador != 0)
                ucOTP.OcultarOTPOperador();
        }


        #region "PCC01"
        protected void txtMonto_TextChanged(object sender, EventArgs e)
        {
            validateAmount();
        }

        protected void cbmMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            validateAmount();
        }

        private void validateAmount()
        {
            try
            {
                ucAlertas.Limpiar();
                SelecionarFilaCuentasDestino();
                mostrar1.Visible = false;
                mostrar2.Visible = false;
                mostrar3.Visible = false;
                if (cbmMoneda.SelectedValue != "0")
                {
                    if (txtMonto.Text != string.Empty && txtMonto.Text != ".")
                    {
                        int codMoneda;
                        bool esMenorMonto;

                        bool result = int.TryParse(cbmMoneda.SelectedValue, out codMoneda);

                        if (result)
                        {
                            esMenorMonto =
                                Sesion.Servicio.validarLimiteACH(codMoneda, Funciones.formatearComas(txtMonto.Text));

                            if (!esMenorMonto)
                            {
                                mostrar1.Visible = true;
                                mostrar2.Visible = true;
                                mostrar3.Visible = true;
                            }
                            else
                            {
                                TextBoxOrigenFondo.Text = null;
                                TextBoxDestinoFondo.Text = null;
                                TextBoxMotivo.Text = null;
                            }
                        }
                    }
                    else
                    {
                        throw new ArgumentException("Debe ingresar un monto");
                    }
                }
                else
                {
                    mostrar1.Visible = false;
                    mostrar2.Visible = false;
                    mostrar3.Visible = false;
                }
            }
            catch (ArgumentException ex)
            {
                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Advertencia);
                Utilitarios.ScrollTop(this);
            }
            catch (Exception ex)
            {
                Index.Log.Error(ex.Message, ex);
                ucAlertas.ErrorGenerico();
                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
            #endregion
        }
    }
}