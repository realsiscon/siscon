using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto;

namespace LogicaSiscon
{
    public class RegistrarAutorizacion : AccesoDatos
    {

        #region Propiedades

        public int Cod_Solicitud { get; set; }
        public int ID_Proyecto { get; set; }
        public int ID_empresa { get; set; }
        public int Cod_Persona { get; set; }
        public string Autorizo { get; set; }
        public int Estado { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime? Fecha_Autorizacion { get; set; }
        public string Observacion { get; set; }
        public DateTime? Fecha_Desh { get; set; }
        public int? usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
       
        #endregion

        #region Constructor

        

        public RegistrarAutorizacion(int IDEmpresa)
        {
            Cod_Solicitud = 0;
            ID_Proyecto = 0;
            ID_empresa = IDEmpresa;
            Cod_Persona = 0;
            Autorizo = "N";
            Estado = 0;
            Fecha_Registro = DateTime.Now;
            Fecha_Autorizacion = null;
            Observacion = "";
            Fecha_Desh = null;
            usr_desh = 0;
            Motivo_Desh = "";

        }

        #endregion

        #region Metodos

        public int RegistrarAutorizaciones()
        {
            int Resultado = 0;

            try
            {
                EjecutarProceso(RegistrarAutorizaciones_);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int RegistrarAutorizaciones_()
        {
            //StringBuilder lStb = new StringBuilder();



            //lStb.Append("insert into Solicitud_Autorizaciones values(" + Cod_Solicitud + "," + Cod_Detalle_Autorizadores + ", '" + Autorizo + "',  ");
            //lStb.Append(" getdate(), null, null, null) ");

            //int Resultado = EjecutarScript(lStb.ToString());

            return 0; // Resultado;
        }

        public int Autorizar_Solicitud()
        {
            int Resultado = 0;

            try
            {
                EjecutarProceso(Autorizar_Solicitud_);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int Autorizar_Solicitud_()
        {
            int Resultado = -1;
            StringBuilder lStb = new StringBuilder();

            try
            {
                lStb.Append("update Solicitud_Autorizaciones set Autorizo='"+ Autorizo +"', Fecha_Autorizacion=GETDATE() ");
                lStb.Append(" where  Cod_Solicitud = "+ Cod_Solicitud +" and cod_persona = "+ Cod_Persona + " and id_empresa = " + ID_empresa + "");

                Resultado = EjecutarScript(lStb.ToString());

                string estado_sol = (Autorizo == "S"? "A": "R"); // A: AUTORIZADO; R: RECHAZADO

                lStb = new StringBuilder();
                lStb.Append("update Solicitud set Estado_Solicitud='" + estado_sol + "', Fecha_Desh=GETDATE(), usr_desh = "+ Cod_Persona + " ");
                lStb.Append(" where  ID_Solicitud = " + Cod_Solicitud + " and id_empresa = " + ID_empresa + "");

                Resultado = EjecutarScript(lStb.ToString());

                // Una vez autorizado.. se envia MAIL.. para el Almacenero JEFE

                //lStb.Clear();
                //lStb.Append("select top 1 p.Mail  ");
                //lStb.Append("from Solicitud_Autorizaciones sa ");
                //lStb.Append("	inner join Detalle_Autorizadores da on da.Cod_Detalle_Autorizadores = sa.Cod_Detalle_Autorizadores");
                //lStb.Append("	inner join Personal p on p.ID_Personal = da.Cod_Persona and p.Estado=0");
                //lStb.Append("where sa.Cod_Solicitud=" + Cod_Solicitud + " and  sa.Autorizo='N' ");
                //lStb.Append("order by da.Secuencia ");

                //string mail = (string)EjecutarEscalar(lStb.ToString());

                //try
                //{
                //    EnvioMail.SendMail("Autorizacion de Solicitud", "Prueba - Autorizar la solicitud...", EnvioMail.PRIORITY.Alta, mail);

                //}
                //catch (Exception)
                //{


                //}

            }
            catch (Exception)
            {

                Resultado = -1;
            }
            
            return Resultado;
        }

        //public List<RegistrarAutorizacion> CargarSolicitudesPendientes()
        public DataTable CargarSolicitudesPendientes()
        {
            List<RegistrarAutorizacion> lstAutorizaciones = new List<RegistrarAutorizacion>();
            DataTable lDtb_Autorizaciones = new DataTable();

            DataSet dsDatos = new DataSet();
            StringBuilder lStbAutorizaciones = new StringBuilder();

            lStbAutorizaciones.Append(" select aut.Cod_Solicitud, aut.id_proyecto, p.Nomb_Proyecto,  ");
            lStbAutorizaciones.Append(" aut.Cod_Persona, (per.Nombres + ' ' + per.Ap_Materno) Autorizador,  ");
            lStbAutorizaciones.Append(" sol.id_solicitante,(soli.Nombres + ' ' + soli.Ap_Materno) Solicitante,  ");
            lStbAutorizaciones.Append(" aut.Autorizo, aut.Fecha_Registro ");
            lStbAutorizaciones.Append(" from Solicitud_Autorizaciones aut ");
            lStbAutorizaciones.Append("	inner join proyecto p on p.ID_proyecto = aut.id_proyecto and p.estado = 1 ");
            lStbAutorizaciones.Append("	inner join Personal per on per.ID_Personal = aut.Cod_Persona and per.Estado = 1 ");
            lStbAutorizaciones.Append("	inner join Solicitud sol on sol.ID_Solicitud = aut.Cod_Persona and sol.Estado = 1 and sol.Estado_Solicitud = 'S' ");
            lStbAutorizaciones.Append("	inner join Personal soli on soli.ID_Personal = sol.id_solicitante and soli.Estado = 1 ");
            lStbAutorizaciones.Append(" where aut.Estado = 1 and aut.Autorizo='N' ");
            lStbAutorizaciones.Append(" and aut.id_empresa = "+ ID_empresa +" and aut.Cod_Persona = "+ Cod_Persona +"");
            
            dsDatos = EjecutarConsulta(lStbAutorizaciones.ToString());
            
            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                lDtb_Autorizaciones = dsDatos.Tables[0];
                //lstAutorizaciones = lDtb_Autorizaciones.ToList<RegistrarAutorizacion>;
            }
            else
            {
                lDtb_Autorizaciones = null;
                MensajeError = "Error al Cargar las Autorizaciones";
            }

            return lDtb_Autorizaciones;
        }

        public List<SolicitudesPendientesDto> CargarListaSolicitudesPendientes()
        {
            List<SolicitudesPendientesDto> lstAutorizaciones = new List<SolicitudesPendientesDto>();
           
            StringBuilder lStbAutorizaciones = new StringBuilder();

            lStbAutorizaciones.Append(" select aut.Cod_Solicitud, aut.id_proyecto, p.Nomb_Proyecto,  ");
            lStbAutorizaciones.Append(" aut.Cod_Persona, (per.Nombres + ' ' + per.Ap_Materno) Autorizador,  ");
            lStbAutorizaciones.Append(" sol.id_solicitante,(soli.Nombres + ' ' + soli.Ap_Materno) Solicitante,  ");
            lStbAutorizaciones.Append(" aut.Autorizo, aut.Fecha_Registro, sol.descripcion ");
            lStbAutorizaciones.Append(" from Solicitud_Autorizaciones aut ");
            lStbAutorizaciones.Append(" inner join proyecto p on p.ID_proyecto = aut.id_proyecto and p.estado = 1 ");
            lStbAutorizaciones.Append(" inner join Personal per on per.ID_Personal = aut.Cod_Persona and per.Estado = 1 ");
            lStbAutorizaciones.Append(" inner join Solicitud sol on sol.ID_Solicitud = aut.Cod_solicitud and sol.Estado = 1 and sol.Estado_Solicitud = 'S' ");
            lStbAutorizaciones.Append(" inner join Personal soli on soli.ID_Personal = sol.id_solicitante and soli.Estado = 1 ");
            lStbAutorizaciones.Append(" where aut.Estado = 1 and aut.Autorizo='N' ");
            lStbAutorizaciones.Append(" and aut.id_empresa = " + ID_empresa + " and aut.Cod_Persona = " + Cod_Persona + "");

            DataSet dsDatos = EjecutarConsulta(lStbAutorizaciones.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                lstAutorizaciones = dsDatos.Tables[0].ToList<SolicitudesPendientesDto>();
            }
            else
            {
                MensajeError = "Error al Cargar las Autorizaciones";
            }

            return lstAutorizaciones;
        }

        #endregion
    }
}

