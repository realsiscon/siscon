using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicaSiscon;
using System.Data;
using LogicaSiscon.Dto;
using WebSISCON.Controles;
using WebSISCON.AppCode;

namespace WebSISCON
{    
    public partial class AutorizarSolicitud : System.Web.UI.Page
    {
        private static List<SolicitudesPendientesDto> _SolicitudesPendientes;
        RegistrarAutorizacion clsAutorizacion;

        protected void Page_Load(object sender, EventArgs e)
        {
            Sesion.verificarEnLinea();
            if (!Page.IsPostBack)
            {
                clsAutorizacion = new RegistrarAutorizacion(Sesion.Login.Id_Empresa);
                Cargar_Solicitudes_Pendientes();
            }

        }

        private void Cargar_Solicitudes_Pendientes()
        {
            clsAutorizacion = new RegistrarAutorizacion(Sesion.Login.Id_Empresa);

            clsAutorizacion.Cod_Persona = Sesion.Login.ID_Personal;
            _SolicitudesPendientes = clsAutorizacion.CargarListaSolicitudesPendientes();


            rptAutorizacion.DataSource = _SolicitudesPendientes;
            rptAutorizacion.DataBind();
        }       

        protected void lnkAutorizar_Command(object sender, CommandEventArgs e)
        {
            clsAutorizacion = new RegistrarAutorizacion(Sesion.Login.Id_Empresa);

            var _solicitud = _SolicitudesPendientes.Find(x => x.Cod_Solicitud == Convert.ToInt32(e.CommandArgument));

            clsAutorizacion.Cod_Solicitud = _solicitud.Cod_Solicitud;
            clsAutorizacion.Cod_Persona = Sesion.Login.ID_Personal;

            clsAutorizacion.Autorizo = "S";

            if (clsAutorizacion.Autorizar_Solicitud() == 0)
                ucAlertas.CargarMensaje("Solicitud Autorizada exitosamente.", MensajeAlertas.Tipo.Exitoso);
            else
                ucAlertas.CargarMensaje("Error al autorizar la solicitud de compra.", MensajeAlertas.Tipo.Error);

            Cargar_Solicitudes_Pendientes();

            Utilitarios.CloseLoading(this);
            Utilitarios.ScrollTop(this);
        }

        protected void lnkRechazar_Command(object sender, CommandEventArgs e)
        {
            clsAutorizacion = new RegistrarAutorizacion(Sesion.Login.Id_Empresa);

            var _solicitud = _SolicitudesPendientes.Find(x => x.Cod_Solicitud == Convert.ToInt32(e.CommandArgument));

            clsAutorizacion.Cod_Solicitud = _solicitud.Cod_Solicitud;
            clsAutorizacion.Cod_Persona = Sesion.Login.ID_Personal;

            clsAutorizacion.Autorizo = "N";

            if (clsAutorizacion.Autorizar_Solicitud() == 0)
                ucAlertas.CargarMensaje("Solicitud Rechazada exitosamente.", MensajeAlertas.Tipo.Exitoso);
            else
                ucAlertas.CargarMensaje("Error al rechazar la solicitud de compra.", MensajeAlertas.Tipo.Error);

            Cargar_Solicitudes_Pendientes();
        }

        protected void lnkVerSolicitud_Command(object sender, CommandEventArgs e)
        {

        }
    }
}