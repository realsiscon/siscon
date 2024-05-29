using Datos;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Almacenes.Salidas
{
    public class SalidaAlmacen: AccesoDatos
    {

        public SalidaAlmacen() { }


        public List<SolicitudSalidaMaterialesDto> ObtenerSolicitudesPendientes(int encargado_Almacen, int ID_Empresa)
        {
            List<SolicitudSalidaMaterialesDto> objLista = new List<SolicitudSalidaMaterialesDto>();

            string sSQL = "select  s.ID_Solicitud, s.ID_Proyecto, p.Cod_proyecto, p.Nomb_Proyecto, " +
                          "   s.id_solicitante, (sol.Nombres + '' + sol.Ap_Paterno) solicitante," +
                          "   p.Id_Almacen, a.Nombre_Almacen, " +
                          "   a.id_encargado, (per.Nombres + '' + per.Ap_Paterno) encargado_almacen" +
                          " from Solicitud s" +
                          "   inner join proyecto p on p.ID_proyecto = s.ID_Proyecto and p.Estado = "+ (int)Enums.EstadoActivo.Activo +" and p.id_empresa = "+ ID_Empresa + " " +
                          "   inner join Almacen a on a.id_Almacen = p.Id_Almacen and a.Estado = "+ (int)Enums.EstadoActivo.Activo + " and a.id_empresa = "+ ID_Empresa + " " +
                          "   inner join Personal per on per.ID_Personal = a.id_encargado and per.Estado = "+ (int)Enums.EstadoActivo.Activo + " and per.id_empresa = "+ ID_Empresa + " " +
                          "   inner join Personal sol on sol.ID_Personal = s.id_solicitante and sol.Estado = "+ (int)Enums.EstadoActivo.Activo + " and sol.id_empresa = "+ ID_Empresa + " " +
                          "   where s.Estado_Solicitud = 'A' and s.id_empresa = "+ ID_Empresa + "  " +
                          "     and per.ID_Personal = "+ encargado_Almacen + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                objLista = dsDatos.Tables[0].ToList<SolicitudSalidaMaterialesDto>();
            }
            else
            {
                objLista = null;
                MensajeError = "Error al Cargar los datos";
            }

            return objLista;
        }

    }
}
