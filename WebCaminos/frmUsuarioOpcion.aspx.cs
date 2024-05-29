using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using System.Text;
using WebSISCON.Controles;
using LogicaSiscon.Utilitarios;
using WebSISCON.AppCode;

namespace WebSISCON
{
    public partial class frmUsuarioOpcion : System.Web.UI.Page
    {
        private DataTable dsMenu { get; set; }
        private Dictionary<string, int> objMenu { get; set; }        

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {                
                CargarUsuarios();
            }

        }

        public void Load_tree(int IdUsuario)
        {
            UsuarioOpcion clsUsrOpcion = new UsuarioOpcion();
            clsUsrOpcion.CodUsuario = IdUsuario;

            dsMenu = new DataTable();
            
            dsMenu = clsUsrOpcion.ObtenerOpcionesUsuario(); 
            trOpciones.Nodes.Clear();
            foreach (DataRow dr in dsMenu.Rows)
            {
                if ((int)dr["idOpcionPadre"] == 0)
                {
                    TreeNode tnParent = new TreeNode();
                    tnParent.Text = dr["textoOpcion"].ToString();
                    string value = dr["idOpcion"].ToString();
                    tnParent.Expand();

                    trOpciones.Nodes.Add(tnParent);
                    FillChild(tnParent, value);
                    if (Convert.ToInt16(dr["asignado"]) == 1)
                    {
                        tnParent.Checked = true;
                        objMenu.Add(dr["textoOpcion"].ToString(), Convert.ToInt32(value));                        
                    }
                }
            }
        }

        public int FillChild(TreeNode parent, string IID)
        {

            DataRow[] drOpcion = dsMenu.Select("idOpcionPadre = " + IID + " ");

            if (drOpcion.Length > 0)
            {

                foreach (DataRow dr in drOpcion)
                {
                    TreeNode child = new TreeNode();
                    child.Text = dr["textoOpcion"].ToString().Trim();
                    
                    string temp = dr["idOpcion"].ToString();
                    child.Collapse();
                    parent.ChildNodes.Add(child);
                    FillChild(child, temp);

                    if (Convert.ToInt16(dr["asignado"]) == 1)
                    {
                        child.Checked = true;
                        objMenu.Add(child.Text, Convert.ToInt32(temp));                        
                    }
                }
                return 0;
            }
            else
            {
                return 0;
            }

        }

        private void CargarUsuarios()
        {
            Usuarios clsUsuarios = new Usuarios();

            Combos.FillCombo(ref cmbUsuario, clsUsuarios.ObtenerUsuarios(), "NombreCompleto", "cod_Usuario");            
        }

        protected void cmbUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbUsuario.SelectedIndex == 0)
            {
                trOpciones.Nodes.Clear();
            }
            else
            {
                trOpciones.Nodes.Clear();
                objMenu = new Dictionary<string, int>();
                Load_tree(Convert.ToInt32(cmbUsuario.SelectedValue));
                ViewState["Opciones"] = objMenu;
                
            }

            Utilitarios.CloseLoading(this);
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            UsuarioOpcion clsUsrOpcion = new UsuarioOpcion();
            clsUsrOpcion.CodUsuario = Convert.ToInt32(cmbUsuario.SelectedValue);

            RecorrerNodos();

            if (hddOpcionesMarcadas.Value.Length > 0)
            {
                //Registrar en BD las opciones Marcadas                
                hddOpcionesMarcadas.Value = hddOpcionesMarcadas.Value.Substring(0, hddOpcionesMarcadas.Value.Length - 1);
                string[] opciones = hddOpcionesMarcadas.Value.Split('|');

                clsUsrOpcion.Opciones = opciones;

                if (clsUsrOpcion.ModificarOpciones() == 0)
                {
                    ucAlertas.CargarMensaje("Opciones Modificadas Correctamente", MensajeAlertas.Tipo.Exitoso);
                    trOpciones.Nodes.Clear();
                }
                    
                else
                    ucAlertas.CargarMensaje("Error al Asignar Opciones al Usuario", MensajeAlertas.Tipo.Exitoso); 

            }
        }

        private void RecorrerNodos()
        {
            foreach (TreeNode t in trOpciones.Nodes)
            {
                if (t.Checked)
                {                    
                    hddOpcionesMarcadas.Value += t.Text + "|";                    
                    RecorrerNodos(t);
                }
            }
        }

        private void RecorrerNodos(TreeNode treeNode)
        {
            try
            {
                //Si el nodo que recibimos tiene hijos se recorrerá
                //para luego verificar si esta o no checado
                foreach (TreeNode tn in treeNode.ChildNodes)
                {
                    //Se Verifica si esta marcado...
                    if (tn.Checked == true)
                    {
                        //Si esta marcado mostramos el texto del nodo                        
                        hddOpcionesMarcadas.Value += tn.Text + "|";
                    }
                    //Ahora hago verificacion a los hijos del nodo actual
                    //Esta iteración no acabara hasta llegar al ultimo nodo principal
                    RecorrerNodos(tn);
                }
            }
            catch (Exception ex)
            {
                ucAlertas.CargarMensaje(ex.ToString(), MensajeAlertas.Tipo.Error);                
            }
        }
        
    }
}