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
    public partial class frmProyecto_Material : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["msg"] != null)
                {
                    lblMensajeError.Text = Page.Request.QueryString["msg"].ToString();
                }

                CargarProyectos();
            }
        }

        private void CargarProyectos()
        {
            Proyecto clsProyecto = new Proyecto(Sesion.Login.Id_Empresa);
            DataTable dtProyectos = new DataTable();

            dtProyectos = clsProyecto.ObtenerProyectos();
            dgProyectos.DataSource = dtProyectos;
            dgProyectos.DataBind();

        }

        protected void dgProyectos_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    Proyecto clsProyecto = new Proyecto();
                    clsProyecto.ID_proyecto = Convert.ToInt32(dgProyectos.Items[e.Item.ItemIndex].Cells[0].Text);
                    clsProyecto.Cod_proyecto = dgProyectos.Items[e.Item.ItemIndex].Cells[1].Text;
                    clsProyecto.Nomb_Proyecto = dgProyectos.Items[e.Item.ItemIndex].Cells[2].Text;
                    Sesion.Proyectos = clsProyecto;


                    Response.Redirect("frmMaterial.aspx");

                    break;
                default:
                    break;
            }
        }

        protected void btnRegistrarNuevo_Click(object sender, EventArgs e)
        {
            Sesion.Proyectos = new Proyecto();
            Response.Redirect("frmMaterial.aspx");
        }
    }
}