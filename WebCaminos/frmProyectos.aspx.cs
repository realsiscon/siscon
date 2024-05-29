using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using LogicaSiscon.Utilitarios;

namespace WebSISCON
{
    public partial class frmProyectos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarPersonal();
                CargarCliente();
                CargarAlmacen();
                if (Sesion.Proyectos.ID_proyecto > 0)
                {
                    // Cargar datos del Proyecto
                    CargarProyecto(Sesion.Proyectos.ID_proyecto);
                }
            }

        }

        private void CargarPersonal()
        {
            Personal clsPersonal = new Personal(Sesion.Login.Id_Empresa);
            DataTable dtPersonal = clsPersonal.ObtenerPersonal();

            //Director de Obra
            cmbDirectorObra.DataSource = dtPersonal;
            cmbDirectorObra.DataTextField = "NombreCompleto";
            cmbDirectorObra.DataValueField = "ID_Personal";
            cmbDirectorObra.DataBind();
            cmbDirectorObra.Items.Insert(0, new ListItem("Seleccionar", "0"));

            //Fiscal de Obra
            cmbFiscalObra.DataSource = dtPersonal;
            cmbFiscalObra.DataTextField = "NombreCompleto";
            cmbFiscalObra.DataValueField = "ID_Personal";
            cmbFiscalObra.DataBind();
            cmbFiscalObra.Items.Insert(0, new ListItem("Seleccionar", "0"));

        }

        private void CargarCliente()
        {
            // Cargar nuevos datos de los clientes
            Cliente oCliente = new Cliente(Sesion.Login.Id_Empresa);

            cmbCliente.DataSource = oCliente.Obtener();
            cmbCliente.DataTextField = "Nombre_cliente";
            cmbCliente.DataValueField = "id_cliente";
            cmbCliente.DataBind();
            cmbCliente.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        private void CargarAlmacen()
        {
            Almacen oAlmacen = new Almacen(Sesion.Login.Id_Empresa);

            cmbAlmacen.DataSource = oAlmacen.Obtener();
            cmbAlmacen.DataTextField = "Nombre_Almacen";
            cmbAlmacen.DataValueField = "id_Almacen";
            cmbAlmacen.DataBind();

            cmbAlmacen.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }


        private void CargarProyecto(int IdProyecto)
        {
            Proyecto clsProyecto = new Proyecto(Sesion.Login.Id_Empresa);
            DataTable dtProyecto = new DataTable();

            dtProyecto = clsProyecto.ObtenerProyectos(clsProyecto.ID_proyecto = IdProyecto);
            if (dtProyecto.Rows.Count > 0)
            {
                txtCodProyecto.Text = dtProyecto.Rows[0]["Cod_proyecto"].ToString();
                txtNombreProyecto.Text = dtProyecto.Rows[0]["Nomb_Proyecto"].ToString();
                txtUbicacion.Text = dtProyecto.Rows[0]["Ubicacion"].ToString();
                Sesion.SeleccionarCombo(ref cmbCliente, dtProyecto.Rows[0]["Id_cliente"].ToString());
                Sesion.SeleccionarCombo(ref cmbDirectorObra, dtProyecto.Rows[0]["id_director"].ToString());
                Sesion.SeleccionarCombo(ref cmbEstado, dtProyecto.Rows[0]["estado"].ToString());
                Sesion.SeleccionarCombo(ref cmbFiscalObra, dtProyecto.Rows[0]["id_fiscal"].ToString());
                Sesion.SeleccionarCombo(ref cmbAlmacen, dtProyecto.Rows[0]["id_almacen"].ToString());
            }
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

            if (Sesion.Proyectos.ID_proyecto > 0)
            {
                // Editar un Proyecto
                clsProyecto.ID_proyecto = Sesion.Proyectos.ID_proyecto;
               
                if (clsProyecto.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsProyecto.Motivo_Desh = txtMotivoDesh.Text.Trim();

                if (clsProyecto.ModificarProyecto() == 0)
                {
                    lblMensajeError.Text = "Proyecto Modificado Exitosamente.";
                   
                }
                else
                    lblMensajeError.Text = "Error al Modificar el Proyecto.";
            }
            else
            {
                // Registrar Nuevo Proyecto
                clsProyecto.ID_proyecto = 0;                

                int Resultado = clsProyecto.RegistrarProyecto();
                if (Resultado == 0)
                {
                    lblMensajeError.Text = "Proyecto Registrado Exitosamente";
                    Response.Redirect("frmBusquedaProyecto.aspx?msg=" + lblMensajeError.Text + "");
                }
                    
                else
                    lblMensajeError.Text = "Error al registrar el Proyecto";
            }
            


        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbEstado.SelectedValue == Enums.EstadoActivo.Inactivo.ToString())
            {
                lblEtiquetaMotivo.Visible = true;
                txtMotivoDesh.Visible = true;
            }
        }
    }
}