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

namespace WebSISCON
{
    public partial class Fases_Actividad : System.Web.UI.Page
    {
       
        Actividad objActividad;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();

            if (!Page.IsPostBack)
            {
                
                CargarPersonal();
                CargarModulos();
                CargarGrupos();
                CargarUnidad();
                CargarActividades();
                

                txtIDProyecto.Text = Sesion.Proyectos.Cod_proyecto;
                txtNombreProyecto.Text = Sesion.Proyectos.Nomb_Proyecto;
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
                lblMensajeError.Text = ex.Message;
            }
            finally
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            }
        }


        private void CargarGrupos()
        {
            Grupo oGrupo = new Grupo(Sesion.Login.Id_Empresa);
            oGrupo.id_proyecto = Sesion.Proyectos.ID_proyecto;
            DataTable dtGrupos = oGrupo.Obtener();

            cmbGrupo.DataSource = dtGrupos;
            cmbGrupo.DataTextField = "NombreGrupo";
            cmbGrupo.DataValueField = "id_grupo";
            cmbGrupo.DataBind();

            cmbGrupo.Items.Insert(0, new ListItem("Seleccionar", "0"));

        }

        private void CargarModulos()
        {
            Modulo oModulo = new Modulo(Sesion.Login.Id_Empresa);
            oModulo.id_proyecto = Sesion.Proyectos.ID_proyecto;
            DataTable dtModulos = oModulo.Obtener();

            cmbModulo.DataSource = dtModulos;
            cmbModulo.DataTextField = "nombreModulo";
            cmbModulo.DataValueField = "id_modulo";
            cmbModulo.DataBind();

            cmbModulo.Items.Insert(0, new ListItem("Seleccionar", "0"));
        }

        private void CargarPersonal()
        {
            Contratista clsPersonal = new Contratista(Sesion.Login.Id_Empresa);
            
            cmbContratista.DataSource = clsPersonal.Obtener();
            cmbContratista.DataTextField = "Nombre_contratista";
            cmbContratista.DataValueField = "id_contratista";
            cmbContratista.DataBind();

            cmbContratista.Items.Insert(0, new ListItem("Seleccionar", "0"));

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            objActividad = new Actividad(Sesion.Login.Id_Empresa);
            objActividad.id_actividad = 0;
            objActividad.id_Proyecto = Sesion.Proyectos.ID_proyecto;
            objActividad.nombre_actividad = txtNombreActividad.Text.Trim();
            objActividad.sec_actividad = Convert.ToInt32(txtSecuencia.Text.Trim());
            objActividad.estado_actividad = Convert.ToInt32(cmbEstadoActidad.SelectedValue);
            objActividad.descripcion = txtDescripcion.Text.Trim();
            objActividad.fecha_ini = Convert.ToDateTime(txtFechaIni.Value);
            objActividad.fecha_fin = Convert.ToDateTime(txtFechaFinal.Value);
            objActividad.duracion = 0;
            objActividad.id_grupo = Convert.ToInt32(cmbGrupo.SelectedValue);
            objActividad.id_modulo = Convert.ToInt32(cmbModulo.SelectedValue);
            objActividad.contratista = Convert.ToInt32(cmbContratista.SelectedValue);
            objActividad.precio_unitario = Convert.ToDecimal( txtPrecioUnitario.Text);
            objActividad.cantidad =  Convert.ToDecimal(txtCantidad.Text);
            objActividad.precio_mano_obra = Convert.ToDecimal(txtPrecioManoObra.Text); ;
            objActividad.forma_pago = Convert.ToInt32(cmbFormaPago.SelectedValue);
            objActividad.costo_mano_obra = Convert.ToDecimal(txtCostoManoObra.Text);
            objActividad.costo_material = Convert.ToDecimal(txtCostoMaterial.Text);
            objActividad.costo_maquinaria = Convert.ToDecimal(txtCostoMaquinaria.Text);
            objActividad.unidad = Convert.ToInt32(cmbUnidad.SelectedValue);

            int Resultado = objActividad.Registrar();
            if (Resultado == 0)
            {
                lblMensajeError.Text = "Actividad Registrada Exitosamente";
                CargarActividades();
                //Response.Redirect("frmBusquedaProyecto.aspx?msg=" + lblMensajeError.Text + "");
            }

            else
                lblMensajeError.Text = "Error al registrar el Proyecto";

        }

        private void CargarActividades()
        {
            objActividad = new Actividad(Sesion.Login.Id_Empresa);
            objActividad.id_Proyecto = Sesion.Proyectos.ID_proyecto;
            
            dgFases.DataSource = objActividad.Obtener(Sesion.Proyectos.ID_proyecto);
            dgFases.DataBind();
        }

        protected void dgFases_ItemCommand(object source, DataGridCommandEventArgs e)
        {

        }
    }
}