using log4net;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebSISCON
{
    public partial class Index : MasterPage
    {
        public static readonly ILog Log =
            LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    CargarFechas();
                    CargarMenu();
                    hCliente.InnerText = Sesion.Login.Nombres + " " + Sesion.Login.Ap_Paterno;
                    hRepresentante.InnerText = Sesion.Login.Mail;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex.Message, ex);
            }
        }

        private void CargarMenu()
        {
            DataSet dsMenu = Sesion.Login.dsMenu;
            List<Dictionary<string, object>> menuArray = MenuArray(dsMenu.Tables[0]);
            string menu = ArmarMenu(menuArray);
            nav.InnerHtml = $"<ul id=\"nav1\" class=\"uk-nav uk-nav-primary metismenu\">{menu}</ul>";
            nav_tablet.InnerHtml = $"<ul id=\"nav2\" class=\"uk-nav uk-nav-primary uk-dropdown-nav metismenu\">{menu}</ul>";
            nav_smart.InnerHtml = $"<ul id=\"nav3\" class=\"uk-nav uk-nav-primary uk-dropdown-nav metismenu\">{menu}</ul>";
        }

        #region menu

        private List<Dictionary<string, object>> MenuArray(DataTable dtMenu)
        {
            List<Dictionary<string, object>> menu = new List<Dictionary<string, object>>();
            string pagename = Path.GetFileName(Request.ServerVariables["SCRIPT_NAME"]);           

            string idDesplegar = "";
            foreach (DataRow dbRow in dtMenu.Rows)
            {
                if (Convert.ToString(dbRow["pantallaNueva"]) == pagename)
                {
                    idDesplegar = Convert.ToString(Convert.ToString(dbRow["idOpcionPadre"]) == "0"
                        ? dbRow["idOpcion"]
                        : dbRow["idOpcionPadre"]);
                    break;
                }
            }

            foreach (DataRow dbRow in dtMenu.Rows)
            {
                if (Convert.ToString(dbRow["idOpcionPadre"]) == "0")
                {
                    Dictionary<string, object> item = new Dictionary<string, object>();
                    item.Add("active", (idDesplegar == Convert.ToString(dbRow["idOpcion"])));
                    item.Add("url", Convert.ToString(dbRow["pantallaNueva"]));
                    item.Add("texto", Page.Server.HtmlDecode(Convert.ToString(dbRow["textoOpcion"])));
                    item.Add("id", Convert.ToString(dbRow["idOpcion"]));
                    //item.Add("items", MenuItems(dtMenu, Convert.ToString(dbRow["idOpcion"]), idFactor, pagename));
                    item.Add("items", MenuItems(dtMenu, Convert.ToString(dbRow["idOpcion"]), 0, pagename));
                    menu.Add(item);
                }
            }

            return menu;
        }

        private List<Dictionary<string, object>> MenuItems(DataTable dtMenu, string id, int idFactor, string pagename)
        {
            List<Dictionary<string, object>> submenu = new List<Dictionary<string, object>>();

            foreach (DataRow dbRow in dtMenu.Rows)
            {
                if (Convert.ToString(dbRow["idOpcionPadre"]) == id)
                {
                    Dictionary<string, object> item = new Dictionary<string, object>();
                    item.Add("active", false);
                    item.Add("url", Convert.ToString(dbRow["pantallaNueva"]));
                    item.Add("texto", Page.Server.HtmlDecode(Convert.ToString(dbRow["textoOpcion"])));
                    pagename = Page.Server.HtmlDecode(pagename);
                    item.Add("id", Convert.ToString(dbRow["idOpcion"]));
                    switch (idFactor)
                    {
                        case 1:
                            {
                                switch (item["url"])
                                {
                                    case "ActivarSoftToken.aspx":
                                    case "CambioSoftToken.aspx":
                                    case "CambioClaveTransaccional.aspx":
                                        continue;
                                    default:
                                        item["active"] = (pagename == (string)item["url"]);
                                        submenu.Add(item);
                                        break;
                                }

                                break;
                            }
                        case 2:
                            {
                                switch (item["url"])
                                {
                                    case "ActivarTokenFisico.aspx":
                                    case "CambioClaveTransaccional.aspx":
                                        continue;
                                    default:
                                        {
                                            item["active"] = (pagename == (string)item["url"]);
                                            submenu.Add(item);
                                            break;
                                        }
                                }

                                break;
                            }
                        default:
                            {
                                switch (item["url"])
                                {
                                    case "ActivarTokenFisico.aspx":
                                    case "ActivarSoftToken.aspx":
                                    case "BajaToken.aspx":
                                    case "CambioSoftToken.aspx":
                                        continue;
                                    default:
                                        {
                                            item["active"] = (pagename == (string)item["url"]);
                                            submenu.Add(item);
                                            break;
                                        }
                                }

                                break;
                            }
                    }
                }
            }

            return submenu;
        }

        private string ArmarMenu(List<Dictionary<string, object>> menu)
        {
            string menuhtml = "";
            for (int i = 0; i < menu.Count; ++i)
            {
                Dictionary<string, object> item = menu[i];
                List<Dictionary<string, object>> items = (List<Dictionary<string, object>>)item["items"];
                bool active = (bool)item["active"];

                if (items.Count > 0)
                {
                    menuhtml +=
                        $"<li id=\"li{i}\" class=\"uk-parent{((active) ? " uk-open mm-active" : "")}{((i == menu.Count - 1) ? " last" : "")}\">" +
                        $"<a {((active) ? "class=\"active\" aria-expanded=\"true\"" : "")} href=\"#\">{item["texto"]}</a>" +
                        $"<ul class=\"uk-nav-sub\">";
                    for (int j = 0; j < items.Count; ++j)
                    {
                        Dictionary<string, object> subitem = items[j];
                        menuhtml +=
                            $"<li{((bool)subitem["active"] ? $" class=\"uk-active\"" : "")}>" +
                            $"<a onclick=\"BlockMaster(this)\" id=\"li{i}.{j}\" href=\"{subitem["url"]}\" {((bool)subitem["active"] ? $" class=\"uk-active\"" : "")}>{subitem["texto"]}</a>" +
                            $"</li>";
                    }

                    menuhtml += $"</ul>";
                }
                else
                {
                    menuhtml += $"<li id=\"li{i}\" class=\"pri{((active) ? " uk-active" : "")}{((i == menu.Count - 1) ? " last" : "")}\">";
                    menuhtml +=
                        $"<a onclick=\"BlockMaster(this)\" {((active) ? "class=\"active\"" : "")} href=\"{item["url"]}\">{item["texto"]}</a>";
                }

                menuhtml += "</li>";
            }

            return menuhtml;
        }

        #endregion

        private void CargarFechas()
        {
            
            this.lblFecha.Text = DateTime.Now.ToShortDateString() + "  ";
            this.slbFecha.Text = DateTime.Now.ToShortDateString() + "  ";
            string cadenaHora = DateTime.Now.ToLongTimeString();
            string[] arregloHora = cadenaHora.Split(new char[] { ' ' });
            this.lblHora.Text = arregloHora[0].ToString();
            this.slbHora.Text = arregloHora[0].ToString();
            
            this.lblEmpresa.Text = Sesion.Login.nomb_empresa;
            
        }

        public String ObtenerTimeOut(string nodo, string atributo, string appPath)
        {
            XmlDocument myConfig = new XmlDocument();
            myConfig.Load(Path.Combine(ConfigurationManager.AppSettings["rutaWebConfig"], "web.config"));
            XmlNode n, n2 = null;
            XmlNodeList l = myConfig.GetElementsByTagName(nodo);
            n = l.Item(0);
            n2 = n.Attributes.GetNamedItem(atributo);
            return n2.Value;
        }

        protected void salir_Click(object sender, EventArgs e)
        {
            Sesion.VaciarSesion();
            HttpContext.Current.Response.Redirect("Login.aspx");
        }

        protected void contact_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Contactenos.aspx");
        }


    }

}