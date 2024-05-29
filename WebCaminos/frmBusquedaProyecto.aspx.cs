using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using WebSISCON.Controles;
using WebSISCON.AppCode;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto;
using System.Collections.Generic;

namespace WebSISCON
{
    public partial class frmBusquedaProyecto : System.Web.UI.Page
    {
        private static List<ProyectoDto> _proyectos;
        private static ProyectoDto _proyecto = new ProyectoDto();

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["msg"] != null)
                {
                    ucAlertas.CargarMensaje(Page.Request.QueryString["msg"].ToString(), MensajeAlertas.Tipo.Info);
                }

                CargarProyectos();
            }
        }

        private void CargarProyectos()
        {
            Proyecto clsProyecto = new Proyecto(Sesion.Login.Id_Empresa);

            DataTable dtProyectos = clsProyecto.ObtenerProyectos();
            _proyectos = clsProyecto.lstProyecto;

            rptProyectos.DataSource = dtProyectos;
            rptProyectos.DataBind();

        }

        protected void btnRegistrarNuevo_Click(object sender, EventArgs e)
        {
            //Sesion.Proyectos = new Proyecto();
            //Response.Redirect("frmProyectos.aspx");

            MostrarRegistro(false);
            
            

        }

        private void CargarPersonal()
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);
            DataTable dtPersonal = clsPersonal.ObtenerPersonal();

            //Director de Obra
            Combos.FillCombo(ref cmbDirectorObra, dtPersonal, "NombreCompleto", "ID_Personal");

            //Fiscal de Obra
            Combos.FillCombo(ref cmbFiscalObra, dtPersonal, "NombreCompleto", "ID_Personal");
        }

        private void CargarCliente()
        {
            // Cargar nuevos datos de los clientes
            Cliente oCliente = new Cliente(Sesion.Login.Id_Empresa);

            Combos.FillCombo(ref cmbCliente, oCliente.Obtener(), "Nombre_cliente", "id_cliente");

        }

        private void CargarAlmacen()
        {
            Almacen oAlmacen = new Almacen(Sesion.Login.Id_Empresa);

            Combos.FillCombo(ref cmbAlmacen, oAlmacen.Obtener(), "Nombre_Almacen", "id_Almacen");
        }

        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            RegistroDatos.Visible = !Mostrar;

            if (!Mostrar)
            {
                CargarPersonal();
                CargarCliente();
                CargarAlmacen();             
            }
            else
                CargarProyectos();

        }

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(false);

                _proyecto = _proyectos.Find(x => x.ID_proyecto == Convert.ToInt32(e.CommandArgument));

                txtCodProyecto.Text = _proyecto.Cod_proyecto;
                txtNombreProyecto.Text = _proyecto.Nomb_Proyecto;
                txtUbicacion.Text = _proyecto.Ubicacion;
                Sesion.SeleccionarCombo(ref cmbCliente, _proyecto.Id_cliente.ToString());
                Sesion.SeleccionarCombo(ref cmbDirectorObra, _proyecto.id_director.ToString());
                Sesion.SeleccionarCombo(ref cmbEstado, _proyecto.estado.ToString());
                Sesion.SeleccionarCombo(ref cmbFiscalObra, _proyecto.id_fiscal.ToString());
                Sesion.SeleccionarCombo(ref cmbAlmacen, _proyecto.id_almacen.ToString());

                divMotivo.Visible = (cmbEstado.SelectedValue == "0");

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

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ucAlertas.Limpiar();

            divMotivo.Visible = (cmbEstado.SelectedValue == "0");

            Utilitarios.CloseLoading(this);
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Proyecto clsProyecto = new Proyecto(Sesion.Login.Id_Empresa);

            clsProyecto.Cod_proyecto = txtCodProyecto.Text.Trim();
            clsProyecto.Nomb_Proyecto = txtNombreProyecto.Text.Trim();
            clsProyecto.Ubicacion = txtUbicacion.Text.Trim();
            clsProyecto.Estado = Convert.ToInt32(cmbEstado.SelectedValue);
            clsProyecto.Cliente = Convert.ToInt32(cmbCliente.SelectedValue);
            clsProyecto.Director_Obra = Convert.ToInt32(cmbDirectorObra.SelectedValue);
            clsProyecto.Fiscal = Convert.ToInt32(cmbFiscalObra.SelectedValue);
            clsProyecto.ID_Almacen = Convert.ToInt32(cmbAlmacen.SelectedValue);

            if (_proyecto != null && _proyecto.ID_proyecto > 0)
            {
                // Editar un Proyecto
                clsProyecto.ID_proyecto = _proyecto.ID_proyecto;

                if (clsProyecto.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsProyecto.Motivo_Desh = txtMotivo.Text.Trim();

                if (clsProyecto.ModificarProyecto() == 0)
                {                    
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);                    
                }
                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                // Registrar Nuevo Proyecto
                clsProyecto.ID_proyecto = 0;

                int Resultado = clsProyecto.RegistrarProyecto();
                if (Resultado == 0)
                {
                    ucAlertas.CargarMensaje("Datos registrados exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);                    
                }
                else
                    ucAlertas.CargarMensaje("Error al Registrar el dato", MensajeAlertas.Tipo.Error);


            }
            Utilitarios.CloseLoading(this);
            Utilitarios.ScrollTop(this);
        }
    }
}