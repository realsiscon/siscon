using LogicaSiscon;
using LogicaSiscon.Dto;
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
    public partial class frmAlmacen : System.Web.UI.Page
    {
        private static List<AlmacenDto> _almacenes = new List<AlmacenDto>();
        private static AlmacenDto _almacen = new AlmacenDto();

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                Inicializar();

            }
        }

        private void Inicializar()
        {
            CargarDatos();
            MostrarRegistro(true);
        }

        private void CargarDatos()
        {
            Almacen _almacen = new Almacen(Sesion.Login.Id_Empresa);
            _almacenes = _almacen.Obtener();

            rptAlmacen.DataSource = _almacenes;
            rptAlmacen.DataBind();
        }

        private void CargarPersonal()
        {
            LogicaSiscon.Personal clsPersonal = new LogicaSiscon.Personal(Sesion.Login.Id_Empresa);
            DataTable dtPersonal = clsPersonal.ObtenerPersonal();

            Combos.FillCombo(ref cmbEncargado, dtPersonal, "NombreCompleto", "ID_Personal");
        }

        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            RegistroDatos.Visible = !Mostrar;

            if (Mostrar)
            {
                CargarPersonal();
            }
        }

       

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Almacen objAlmacen = new Almacen(Sesion.Login.Id_Empresa);
            objAlmacen.Nombre_Almacen = txtNombre.Text.Trim();
            objAlmacen.es_principal = Convert.ToInt32(cmbPrincipal.SelectedValue);
            objAlmacen.direccion = txtDireccion.Text.Trim();
            objAlmacen.telefono_1 = txtTelefono1.Text.Trim(); 
            objAlmacen.telefono_2=txtTelefono2.Text.Trim();
            objAlmacen.id_encargado = Convert.ToInt32(cmbEncargado.SelectedValue);
            objAlmacen.id_empresa = Sesion.Login.Id_Empresa;
            objAlmacen.estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (_almacen != null && _almacen.id_Almacen > 0)
            {
                objAlmacen.id_Almacen = _almacen.id_Almacen;

                if (objAlmacen.Modificar() == 0)
                {                    
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(false);
                    Inicializar();
                }

                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                objAlmacen.id_Almacen = 0;
                if (objAlmacen.Registrar() == 0)
                {
                    ucAlertas.CargarMensaje("Datos registrados exitosamente", MensajeAlertas.Tipo.Exitoso)  ;
                    MostrarRegistro(false);
                    Inicializar();
                }

                else
                    ucAlertas.CargarMensaje("Error al Registrar el dato", MensajeAlertas.Tipo.Error);
            }

            Utilitarios.CloseLoading(this);
            Utilitarios.ScrollTop(this);            
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(false);

        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ucAlertas.Limpiar();

            divMotivo.Visible = (cmbEstado.SelectedValue == "0");

            Utilitarios.CloseLoading(this);
        }
              
        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(false);

                _almacen = _almacenes.Find(x => x.id_Almacen == Convert.ToInt32(e.CommandArgument));

                txtNombre.Text = _almacen.Nombre_Almacen;
                Sesion.SeleccionarCombo(ref cmbEncargado, _almacen.id_encargado.ToString());
                txtTelefono1.Text = _almacen.telefono_1;
                txtTelefono2.Text = _almacen.telefono_2;
                txtDireccion.Text = _almacen.ubicacion;
                Sesion.SeleccionarCombo(ref cmbPrincipal, _almacen.es_principal.ToString());
                Sesion.SeleccionarCombo(ref cmbEstado, _almacen.estado.ToString());
                txtMotivo.Text = "";

                divMotivo.Visible = false;
            }
            catch (Exception ex)
            {

                ucAlertas.CargarMensaje(ex.Message, MensajeAlertas.Tipo.Advertencia);
                Utilitarios.ScrollTop(this);
            }
            finally
            {
                Utilitarios.CloseLoading(this);
            }
        }

       

        protected void cmbPrincipal_SelectedIndexChanged(object sender, EventArgs e)
        {

            Utilitarios.CloseLoading(this);

        }
    }
}