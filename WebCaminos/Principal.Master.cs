using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml;


namespace WebSISCON
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    this.CargarFechas();
                    this.CargarMenu();                    
                    hCliente.InnerText = Sesion.Login.Nombres + " " + Sesion.Login.Ap_Paterno;
                    hRepresentante.InnerText = Sesion.Login.Mail;

                }
                catch (Exception ex)
                {

                }
            }
        }
        private void CargarMenu()
        {           
            this.CrearMenu();
        }
        private void CargarPizarra()
        {
            //DataTable dtPizarra = Sesion.Servicio.NET_RetornarPizarra();
            //if (dtPizarra.Rows.Count != 0)
            //{
            //    lblTCD.Text = dtPizarra.Rows[0]["valor"].ToString();
            //    lblTVD.Text = dtPizarra.Rows[1]["valor"].ToString();
            //    lblUFV.Text = dtPizarra.Rows[2]["valor"].ToString();

            //    lblTCDSmart.Text = dtPizarra.Rows[0]["valor"].ToString();
            //    lblTVDSmart.Text = dtPizarra.Rows[1]["valor"].ToString();
            //    lblUFVSmart.Text = dtPizarra.Rows[2]["valor"].ToString();
            //}
        }
        private void CrearMenu()
        {
            //string pagename = System.IO.Path.GetFileName(Request.ServerVariables["SCRIPT_NAME"]);
            if (Sesion.Login.dsMenu != null)
            {
                DataSet dsMenu = Sesion.Login.dsMenu;
                int i = 0; string menu = "";
                foreach (DataRow dbRow in dsMenu.Tables[0].Rows)
                {
                    if (Convert.ToString(dbRow["idOpcionPadre"]) == "0")
                    {
                        i++;
                        string id_principal = Convert.ToString(dbRow["idOpcion"]);
                        string item_principal = Page.Server.HtmlDecode(Convert.ToString(dbRow["textoOpcion"]));
                        string pantalla = Convert.ToString(dbRow["pantallaNueva"]);
                        string padre = Convert.ToString(dbRow["idOpcionPadre"]);
                        menu = menu + BuscarSubitems(dsMenu, id_principal, item_principal, i, pantalla);
                    }
                }

                nav.InnerHtml = menu;
            }

            
        }

        private string BuscarSubitems(DataSet dsMenu, string id, string item_principal, int i, string pant)
        {

            string cadena = "";
            string pagename = System.IO.Path.GetFileName(Request.ServerVariables["SCRIPT_NAME"]);
            //------------------------
            string li = "li" + i;

            //MENU DESPLEGAR
            string idDesplegar = "";
            foreach (DataRow dbRow in dsMenu.Tables[0].Rows)
            {
                if (Convert.ToString(dbRow["pantallaNueva"]) == pagename)
                {
                    idDesplegar = Convert.ToString(dbRow["idOpcionPadre"]);
                }
            }

            if (idDesplegar == id)
            {
                cadena = "<li id=\"" + li + "\" class=\"pri\"><a onclick=\"BlockMaster(this)\" class=\"active\" href=\"#\">" + item_principal + "</a><ul>";
            }
            else
            {
                cadena = "<li id=\"" + li + "\" class=\"pri\"><a onclick=\"BlockMaster(this)\" href=\"#\">" + item_principal + "</a><ul>";
            }

            //--------------------------
            bool sw = false;
            int j = 1;
            foreach (DataRow dbRow in dsMenu.Tables[0].Rows)
            {
                if (Convert.ToString(dbRow["idOpcionPadre"]) == id)
                {
                    sw = true;
                    string subitem = Convert.ToString(dbRow["textoOpcion"]);
                    string pantalla = Convert.ToString(dbRow["pantallaNueva"]);
                    string subid = Convert.ToString(dbRow["idOpcion"]);

                    string lid = "li" + i + "." + j;
                    if (pagename == pantalla)
                    {
                        //cadena = cadena + "<li><a onclick=\"BlockMaster(this)\" id=\"" + lid + "\" href=\"" + pantalla + "\" style=\"padding-left:20px;border-bottom: 1px solid #CFCFD1;height: 35px;font-size:15px;background: #e7dfd4;color: #36B7C1;width: 200px;\">" + subitem + "</a></li>"; 
                        //cadena = cadena + "<li><a onclick=\"BlockMaster(this)\" id=\"" + lid + "\" href=\"" + pantalla + "\" style=\"padding-left:20px;border-bottom: 1px solid #CFCFD1;height: 35px;font-size:15px;background: #e7dfd4;color: #33CA00;width: 200px;\">" + subitem + "</a></li>";
                        cadena = cadena + "<li><a onclick=\"BlockMaster(this)\" id=\"" + lid + "\" href=\"" + pantalla + "\" style=\"padding-left:20px;border-bottom: 1px solid #CFCFD1;height: 35px;font-size:15px;background: #E7E6DF;color: #ca0000;width: 200px; font-weight: bold;\">" + subitem + "</a></li>";
                    }
                    else
                    {
                        cadena = cadena + "<li><a onclick=\"BlockMaster(this)\" id=\"" + lid + "\" href=\"" + pantalla + "\">" + subitem + "</a></li>";
                    }
                    j++;
                }
            }

            if (sw == false)
            {
                string principal = "";
                if (pagename == pant)
                {
                    principal = "<li id=\"" + li + "\" class=\"pri\"><a onclick=\"BlockMaster(this)\" class=\"active\" href=\"" + pant + "\">" + item_principal + "</a></li>";
                }
                else
                {
                    principal = "<li id=\"" + li + "\" class=\"pri\"><a onclick=\"BlockMaster(this)\" href=\"" + pant + "\">" + item_principal + "</a></li>";
                }
                return principal;
            }
            else
            {
                cadena = cadena + "</ul></li>";
                return cadena;
            }
        }


        private void CargarAlertas()
        {
            //try
            //{
            //    DataTable dt = Sesion.Servicio.ObtenerAlertas();
            //    if (dt.Rows.Count != 0)
            //    {
            //        //this.BuscarAlertaPrestamos("Préstamos", dt);
            //        //this.BuscarAlertaTransferencias("Transferencias", dt);
            //        //this.BuscarAlertaTraspasos("Traspasos", dt);
            //        ////this.lblPagosInstituciones.Text = this.BuscarAlerta("Pagos Especiales", dt);
            //        ////this.lblPagoPlanillas.Text = this.BuscarAlerta("Pagos Planilla", dt);
            //        ////this.lblPagoServicios.Text = this.BuscarAlerta("Pagos de Servicios", dt);
            //        //this.BuscarAlertaSolicitudChequera("Solicitud de Chequera(s)", dt);
            //        //this.BuscarAlertaHabilitacionChequera("Habilitación de Chequera(s)", dt);
            //        ////this.lblPagoRuatVehiculo.Text = this.BuscarAlerta("Pago RUAT VEH", dt);
            //        ////this.lblPagoRuatInmueble.Text = this.BuscarAlerta("Pago RUAT INM", dt);
            //        //this.BuscarAlertaTransferenciasACH("Transferencias ACH", dt);
            //        //this.BuscarAlertaPagoServicios("Pagos de Servicios", dt);
            //        this.nro_notificaciones.InnerText = cantidadAlerta(dt);
            //        this.nro_notificaciones_tablet.InnerText = cantidadAlerta(dt);
            //        this.nro_notificaciones_smart.InnerText = cantidadAlerta(dt);

            //        notificaciones.Visible = true;
            //        icNotTablet.Visible = true;
            //        notiSmart.Visible = true;

            //    }
            //    else
            //    {
            //        //SinAlerta();
            //        notificaciones.Visible = false;
            //        icNotTablet.Visible = false;
            //        notiSmart.Visible = false;
            //    }
            //}
            //catch
            //{
            //    notificaciones.Visible = false;
            //    icNotTablet.Visible = false;
            //    notiSmart.Visible = false;
            //}
        }

        private string cantidadAlerta(DataTable dt)
        {
            int cant = 0;
            foreach (DataRow dr in dt.Rows)
            {
                cant += Convert.ToInt16(dr["cant"]);
            }
            return cant.ToString();
        }

        private void CargarFechas()
        {
            //Double tiempoSesion = Convert.ToDouble(this.ObtenerTimeOut("sessionState", "timeout", ""));
            this.lblFecha.Text = DateTime.Now.ToShortDateString() + "  ";
            this.slbFecha.Text = DateTime.Now.ToShortDateString() + "  ";
            string cadenaHora = DateTime.Now.ToLongTimeString();
            string[] arregloHora = cadenaHora.Split(new char[] { ' ' });
            this.lblHora.Text = arregloHora[0].ToString();
            this.slbHora.Text = arregloHora[0].ToString();
            //string cadenaVence = DateTime.Now.AddMinutes(tiempoSesion).ToShortTimeString();
            //string[] arregloVence = cadenaVence.Split(new char[] { ' ' });
            this.lblEmpresa.Text = Sesion.Login.nomb_empresa;
            //this.slbVence.Text = arregloVence[0].ToString();
        }
        public String ObtenerTimeOut(string nodo, string atributo, string appPath)
        {
            XmlDocument myConfig = new XmlDocument();
            myConfig.Load((string)ConfigurationManager.AppSettings["rutaWebConfig"] + "/web.config");
            XmlNode n, n2 = null;
            string valor = String.Empty;
            XmlNodeList l = myConfig.GetElementsByTagName(nodo);
            n = l.Item(0);
            n2 = n.Attributes.GetNamedItem(atributo);
            valor = n2.Value;
            return valor;
        }

        protected void salir_Click(object sender, EventArgs e)
        {
           // Sesion.Salir();
            Sesion.VaciarSesion();
            HttpContext.Current.Response.Redirect("Login.aspx");
        }

        protected void contact_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Contactenos.aspx");
        }
    }
}