using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto;
using WebSISCON.AppCode;
using WebSISCON.Controles;

namespace WebSISCON
{
    public partial class frmArea : System.Web.UI.Page
    {
        private static List<AreaDto> lsAreas;
        private static AreaDto _area;
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                MostrarRegistro(true);
            }
        }

        private void CargarAreas()
        {
            Area clsArea = new Area();

            clsArea.CargarAreas();
            lsAreas = clsArea.lstAreas;

            rptAreas.DataSource = clsArea.dtDatos;
            rptAreas.DataBind();
        }


        private void MostrarRegistro(bool Mostrar)
        {
            pnlRegistro.Visible = Mostrar;
            RegistroDatos.Visible = !Mostrar;

            if (Mostrar)
            {
                CargarAreas();
            }

            divMotivo.Visible = (cmbEstado.SelectedValue == "0");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            MostrarRegistro(true);
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Area clsArea = new Area();
            clsArea.Descripcion = txtNombre.Text;
            clsArea.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

            if (_area != null && _area.ID_Area > 0)
            {
                clsArea.ID_Area = _area.ID_Area;

                if (clsArea.Estado == (int)Enums.EstadoActivo.Inactivo)
                    clsArea.Motivo_Desh = txtMotivo.Text;

                if (clsArea.ModificarArea() == 0)
                {
                    ucAlertas.CargarMensaje("Registro Modificado exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);                    
                }
                    
                else
                    ucAlertas.CargarMensaje("Error al modificar el registro", MensajeAlertas.Tipo.Error);
            }
            else
            {
                clsArea.ID_Area = 0;
                if (clsArea.Registrar() == 0)
                {
                    ucAlertas.CargarMensaje("Area registrada exitosamente", MensajeAlertas.Tipo.Exitoso);
                    MostrarRegistro(true);                    
                }
                    
                else
                    ucAlertas.CargarMensaje("Error al Registrar la Area", MensajeAlertas.Tipo.Exitoso);
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);


        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "9");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                MostrarRegistro(false);

                _area = lsAreas.Find(x => x.ID_Area == Convert.ToInt32(e.CommandArgument));

                txtNombre.Text = _area.Descripcion;
                Sesion.SeleccionarCombo(ref cmbEstado, _area.Estado.ToString());


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
    }
}