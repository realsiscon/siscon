﻿using LogicaSiscon.Utilitarios;
using LogicaSiscon;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon.Dto;

namespace WebSISCON
{
    public partial class frmMaterial : System.Web.UI.Page
    {
        public static List<Material> materials = new List<Material>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                CargarMateriales();
                divMotivo.Visible = false;
                hddID_Material.Value = "0";
                CargarUnidad();
                CargarGrupos();
            }
        }

        private void CargarMateriales()
        {
            Material clsMaterial = new Material(Sesion.Login.Id_Empresa);
            clsMaterial.ID_Proyecto = Sesion.Proyectos.ID_proyecto; 
            materials = clsMaterial.CargarMaterial();
            
            
            dgMaterial.DataSource = clsMaterial.dtDatos;
            dgMaterial.DataBind();
        }

        protected void dgMaterial_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Editar":
                   
                    var _material = materials.Find(x => x.Cod_Material == Convert.ToInt32(dgMaterial.Items[e.Item.ItemIndex].Cells[0].Text));

                    hddID_Material.Value = _material.Cod_Material.ToString();
                    txtNombre.Text = _material.Nombre_Material.Trim();

                    Sesion.SeleccionarCombo(ref cmbEstado, _material.Estado.ToString());
                    Sesion.SeleccionarCombo(ref cmbUnidad, _material.Unidad.ToString());
                    txtPrecioUnitario.Text = _material.precio_unitario.ToString();
                    Sesion.SeleccionarCombo(ref cmbGrupo, _material.id_grupo.ToString());
                    txtStockMinimo.Text = _material.stock_minimo.ToString();
                    txtCant_Presupuestada.Text = _material.Cant_presupuestada.ToString();


                    updGeneral.Update();
                    break;
                default:
                    break;
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
                    Combos.FillCombo(ref cmbUnidad, objLista, "Descripcion", "Cod_Unidad");

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
            DataTable dtGrupos = oGrupo.Obtener();

            cmbGrupo.DataSource = dtGrupos;
            cmbGrupo.DataTextField = "NombreGrupo";
            cmbGrupo.DataValueField = "id_grupo";
            cmbGrupo.DataBind();

            cmbGrupo.Items.Insert(0, new ListItem("Seleccionar", "0"));

        }

       

        private void ValidarCampos()
        {
            if (txtNombre.Text.Trim().Length <= 0)
            {
                lblMensajeError.Text = "Unidad registrada exitosamente";

            }
            if (cmbUnidad.SelectedIndex == 0)
            {
                lblMensajeError.Text = "Unidad registrada exitosamente";
            }



        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {


            Material clsMaterial = new Material(Sesion.Login.Id_Empresa);
            try
            {

                if (txtNombre.Text.Trim().Length <= 0)
                {
                    throw new Exception("Nombre del Material esta vacio");

                }
                if (cmbUnidad.SelectedIndex == 0)
                {
                    throw new Exception("Debe Seleccionar una Unidad");
                }

                if (txtPrecioUnitario.Text.Trim().Length <= 0)
                    throw new Exception("Precio no puede estar vacio");

                if (cmbGrupo.SelectedIndex == 0)
                {
                    throw new Exception("Debe Seleccionar un grupo");
                }

                if (txtStockMinimo.Text.Trim().Length <= 0)
                    throw new Exception("Stock Minimo no puede estar vacio");

                if (Convert.ToDecimal(txtStockMinimo.Text.Trim()) <= 0)
                    throw new Exception("Stock Minimo no puede ser negativo");

                if (txtCant_Presupuestada.Text.Trim().Length <= 0)
                    throw new Exception("Cantidad Presupuestada no puede estar vacio");

                if (Convert.ToDecimal(txtCant_Presupuestada.Text.Trim()) <= 0)
                    throw new Exception("Cantidad Presupuestada no puede ser negativo");

                clsMaterial.Nombre_Material = txtNombre.Text;
                clsMaterial.Unidad = Convert.ToInt32(cmbUnidad.SelectedValue);
                clsMaterial.precio_unitario = Convert.ToDecimal(txtPrecioUnitario.Text);
                clsMaterial.id_grupo = Convert.ToInt32(cmbGrupo.SelectedValue);
                clsMaterial.stock_minimo = Convert.ToDecimal(txtStockMinimo.Text);
                clsMaterial.Cant_presupuestada = Convert.ToDecimal(txtCant_Presupuestada.Text);

                clsMaterial.Estado = Convert.ToInt32(cmbEstado.SelectedValue);

                if (Convert.ToInt32(hddID_Material.Value) > 0)
                {
                    clsMaterial.Cod_Material = Convert.ToInt32(hddID_Material.Value);

                    if (clsMaterial.Estado == (int)Enums.EstadoActivo.Inactivo)
                        clsMaterial.Motivo_Desh = txtMotivo.Text;

                    if (clsMaterial.ModificarRegistro() == 0)
                    {                        
                        lblMensajeError.Text = "Registro Modificado exitosamente";
                        CargarMateriales();
                        divMotivo.Visible = false;
                        hddID_Material.Value = "0";
                    }

                    else
                        throw new Exception("Error al modificar el registro");
                }
                else
                {
                    clsMaterial.Cod_Material = 0;
                    if (clsMaterial.Registrar() == 0)
                    {                       
                        lblMensajeError.Text = "Unidad registrada exitosamente";
                        CargarMateriales();
                        divMotivo.Visible = false;
                        hddID_Material.Value = "0";
                    }

                    else
                        throw new Exception("Error al Registrar la Unidad");
                }
            }
            catch (Exception ex)
            {
                lblMensajeError.Text = ex.Message;
            }
            finally
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
            }
        }

        protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMotivo.Visible = (cmbEstado.SelectedValue == "0");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah1", "scrolltop();", true);
        }

    }
}