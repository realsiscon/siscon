using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;

namespace WebSISCON
{
    public partial class frmOpcion : System.Web.UI.Page
    {
        #region Pagina
        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                Inicializar();
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
        }

        private void Inicializar()
        {
            pnlMenu.Visible = false;
            pnlSubMenu.Visible = false;
        }

        protected void btnVistaMenu_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Visible = false;
            pnlMenu.Visible = true;
            CargarMenu(true);
        }

        protected void btnVistaSubMenu_Click(object sender, EventArgs e)
        {
            pnlPrincipal.Visible = false;
            pnlSubMenu.Visible = true;
            CargarMenu(false);
        }

        #endregion

        #region Para el registro de Menu

        private void CargarMenu(bool MostrarTodo)
        {
            Opcion objMenu = new Opcion();
            List<Opcion> lstMenu = new List<Opcion>();
            DataTable dtMenu = new DataTable();

            lstMenu = objMenu.ObtenerMenu(MostrarTodo);

            if (MostrarTodo)
            {
                dgMenu.DataSource = lstMenu;
                dgMenu.DataBind();
            }
            else
            {
                dgSubMenu.DataSource = lstMenu;
                dgSubMenu.DataBind();

                //Para el combo de Opciones de Padre
                
                cmbPadre.DataSource = objMenu.ObtenerMenu(!MostrarTodo);
                cmbPadre.DataTextField = "textoOpcion";
                cmbPadre.DataValueField = "idOpcion";
                cmbPadre.DataBind();
            }

        }

        protected void dgMenu_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    pnlRegistroMenu.Visible = true;
                    divGeneral.Visible = false;
                    btnRegistrarNuevoMenu.Visible = false;

                    hddID_Menu.Value = dgMenu.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtMenu.Text = dgMenu.Items[e.Item.ItemIndex].Cells[1].Text;

                    Sesion.SeleccionarCombo(ref cmbValido, dgMenu.Items[e.Item.ItemIndex].Cells[3].Text);

                    updGeneral.Update();
                    break;
                default:
                    break;
            }
        }

        protected void btnRegistrarMenu_Click(object sender, EventArgs e)
        {
            Opcion clsOpcion = new Opcion()
            {
                IdOpcion = Convert.ToInt32(hddID_Menu.Value),
                textoOpcion = txtMenu.Text,
                idOpcionPadre = 0,
                pantalla = "#",
                Valido = Convert.ToInt32(cmbValido.SelectedValue)
            };

            if (Convert.ToInt32(hddID_Menu.Value) > 0)
            {
                if (clsOpcion.ModificarRegistro() == 0)
                {
                    lblMensajeError.Text = "Registro Modificado exitosamente";
                    MostrarRegistroMenu(false);
                    CargarMenu(true);
                    hddID_Menu.Value = "0";
                }
                else
                    lblMensajeError.Text = "Error al Modificar la Opcion";
            }
            else
            {
                if (clsOpcion.Registrar() == 0)
                {
                    lblMensajeError.Text = "Opcion registrada exitosamente";
                    MostrarRegistroMenu(false);
                    CargarMenu(true);
                    hddID_Menu.Value = "0";
                }
                else
                    lblMensajeError.Text = "Error al Registrar la Opcion";
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);


        }

        private void MostrarRegistroMenu(bool Mostrar)
        {
            btnRegistrarNuevoMenu.Visible = !Mostrar;
            pnlRegistroMenu.Visible = Mostrar;
            divGeneral.Visible = !Mostrar;
            hddID_Menu.Value = "0";
        }

        protected void btnRegistrarNuevoMenu_Click(object sender, EventArgs e)
        {
            MostrarRegistroMenu(true);
        }

        #endregion

        #region Para el registro de SubMenus

        protected void dgSubMenu_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                    pnlRegistroSubMenu.Visible = true;
                    divDetallePantallas.Visible = false;
                    btnRegistrarNuevoSubMenu.Visible = false;

                    hddSubMenu.Value = dgSubMenu.Items[e.Item.ItemIndex].Cells[0].Text;
                    txtSubMenu.Text = dgSubMenu.Items[e.Item.ItemIndex].Cells[1].Text;
                    Sesion.SeleccionarCombo(ref cmbPadre, dgSubMenu.Items[e.Item.ItemIndex].Cells[5].Text);
                    txtNombrePantalla.Text = dgSubMenu.Items[e.Item.ItemIndex].Cells[6].Text;
                    Sesion.SeleccionarCombo(ref cmbSubValido, dgSubMenu.Items[e.Item.ItemIndex].Cells[4].Text);

                    updGeneral.Update();
                    break;
                default:
                    break;
            }
        }

        private void MostrarRegistroSubMenu(bool Mostrar)
        {
            btnRegistrarNuevoSubMenu.Visible = !Mostrar;
            pnlRegistroSubMenu.Visible = Mostrar;
            divDetallePantallas.Visible = !Mostrar;
            hddSubMenu.Value = "0";
        }

        protected void btnRegistrarNuevoSubMenu_Click(object sender, EventArgs e)
        {
            MostrarRegistroSubMenu(true);
        }

        #endregion

        protected void cmbPadre_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
        }

        protected void btnRegistrarSubMenu_Click(object sender, EventArgs e)
        {
            Opcion clsOpcion = new Opcion()
            {
                IdOpcion = Convert.ToInt32(hddSubMenu.Value),
                textoOpcion = txtSubMenu.Text,
                idOpcionPadre = Convert.ToInt32(cmbPadre.SelectedValue),
                pantalla = txtNombrePantalla.Text,
                Valido = Convert.ToInt32(cmbSubValido.SelectedValue)
            };

            if (Convert.ToInt32(hddSubMenu.Value) > 0)
            {
                if (clsOpcion.ModificarRegistro() == 0)
                {
                    lblMensajeError.Text = "Registro Modificado exitosamente";
                    MostrarRegistroSubMenu(false);
                    CargarMenu(false);
                    hddSubMenu.Value = "0";
                }
                else
                    lblMensajeError.Text = "Error al Modificar la Opcion";
            }
            else
            {
                if (clsOpcion.Registrar() == 0)
                {
                    lblMensajeError.Text = "Opcion registrada exitosamente";
                    MostrarRegistroSubMenu(false);
                    CargarMenu(false);
                    hddID_Menu.Value = "0";
                }
                else
                    lblMensajeError.Text = "Error al Registrar la Opcion";
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);

        }
    }
}