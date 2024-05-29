using LogicaSiscon;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebSISCON
{
    public partial class frmModulo : System.Web.UI.Page
    {
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
            divMotivo.Visible = false;
            hddID_Area.Value = "0";
        }

        private void CargarDatos()
        {
            Modulo objCarga = new Modulo(Sesion.Login.Id_Empresa);

            objCarga.Obtener();

            dgGrupo.DataSource = objCarga.DtbFases;
            dgGrupo.DataBind();
        }

        private void CargarProyectos()
        {

            DataTable objLista = new DataTable();
            Proyecto Proyecto = new Proyecto(Sesion.Login.Id_Empresa);


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

                    cmbProyecto.Items.Insert(0, new ListItem("Seleccionar", "0"));
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
        }
        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            divGeneral.Visible = !Mostrar;
            btnRegistrar.Visible = !Mostrar;

            if (Mostrar)
            {
                CargarProyectos();
            }
        }

        protected void cmbProyecto_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Modulo oGrupo = new Modulo(Sesion.Login.Id_Empresa);
            oGrupo.NombreModulo = txtNombre.Text.Trim();
            oGrupo.id_proyecto = Convert.ToInt32(cmbProyecto.SelectedValue);


            if (Convert.ToInt32(hddID_Area.Value) > 0)
            {
                oGrupo.id_modulo = Convert.ToInt32(hddID_Area.Value);

                //if (oGrupo.Estado == 9)
                //    oGrupo.Motivo_Desh = txtMotivo.Text;

                if (oGrupo.Modificar() == 0)
                {
                    lblMensajeError.Text = "Registro Modificado exitosamente";
                    MostrarRegistro(false);
                    Inicializar();
                }

                else
                    lblMensajeError.Text = "Error al modificar el registro";
            }
            else
            {
                oGrupo.id_modulo = 0;
                if (oGrupo.Registrar() == 0)
                {
                    lblMensajeError.Text = "Datos registrados exitosamente";
                    MostrarRegistro(false);
                    Inicializar();
                }

                else
                    lblMensajeError.Text = "Error al Registrar el dato";
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(true);

        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "9");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }

        protected void dgGrupo_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    MostrarRegistro(true);

                    hddID_Area.Value = dgGrupo.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtNombre.Text = dgGrupo.Items[e.Item.ItemIndex].Cells[1].Text;

                    cmbProyecto.SelectedIndex = Convert.ToInt32(dgGrupo.Items[e.Item.ItemIndex].Cells[3].Text);
                    updGeneral.Update();
                    break;
                default:
                    break;
            }
        }
    }
}