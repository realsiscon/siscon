using Datos;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon
{
    public class Almacen : AccesoDatos
    {
        #region Propiedades

        public int id_Almacen { get; set; }
        public string Nombre_Almacen { get; set; }
        public int id_encargado { get; set; }
        public string direccion { get; set; }
        public int es_principal { get; set; }
        public string telefono_1 { get; set; }
        public string telefono_2 { get; set; }
        public int id_empresa { get; set; }
        public int sec { get; set; }
        public int estado { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }


        public DataTable DtbDatos { get; set; }

        public int Resultado { get; set; }

        public List<AlmacenDto> lstAlmacen { get; set; }
        #endregion

        #region Constructor
        public Almacen(int IDEmpresa = 1)
        {

            id_Almacen = 0;
            Nombre_Almacen = "";
            id_encargado = 0;
            direccion = "";
            telefono_1 = "";
            telefono_2 = "";
            id_empresa = IDEmpresa;
            sec = 0;
            estado = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;

        }
        #endregion


        #region Metodos

        public int Modificar()
        {
            Resultado = 0;

            try
            {
                EjecutarProceso(Modificar_);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int Modificar_()
        {
            StringBuilder lStb = new StringBuilder();
            DataTable dtProyecto = new DataTable();

            if (id_Almacen != 0)
            {
                sec = (int)EjecutarEscalar("Select sec from Almacen where id_Almacen = " + id_Almacen + " and id_empresa = " + id_empresa + "");
            }

            lStb.Append("update Almacen set ");
            lStb.Append(" estado = " + (int)Enums.EstadoActivo.Inactivo + " ");
            lStb.Append(" where id_Almacen = " + id_Almacen + " and sec = " + sec + " and id_empresa  = " + id_empresa + "");

            Resultado = EjecutarScript(lStb.ToString());

            if (Resultado > 0 && estado == (int)Enums.EstadoActivo.Activo)
            {
                Resultado = Registrar();
                if (Resultado > 0)
                    Resultado = 0;

            }

            return Resultado;
        }

        public int Registrar()
        {
            Resultado = 0;

            try
            {
                EjecutarProceso(Registro);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }


        private int Registro()
        {
            StringBuilder lStb = new StringBuilder();

            if (id_Almacen == 0)
            {
                id_Almacen = (int)EjecutarEscalar("Select isnull(max(id_Almacen),0) + 1 from Almacen");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from Almacen where id_Almacen = " + id_Almacen + " and id_empresa = " + id_empresa + " ") + 1;
            }

            lStb.Append(" INSERT INTO Almacen (id_Almacen, Nombre_Almacen,ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) ");
            lStb.Append(" VALUES (" + id_Almacen + ", '" + Nombre_Almacen + "','" + direccion + "', " + es_principal + " , " + id_encargado + ", '" + direccion + "', '" + telefono_1 + "', '" + telefono_2 + "', " + id_empresa + ", " + sec + ", " + (int)Enums.EstadoActivo.Activo + ", getdate(), " + usr_alta + ") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }


        public DataTable Obtener(int codigo = 0)
        {


            string sSQL = "SELECT a.id_Almacen, a.Nombre_Almacen, " +
                                 " a.ubicacion, a.es_principal, " +
                                 " a.id_encargado,  p.Nombres + ' ' + p.Ap_Paterno  Encargado_Almacen " +
                                 " FROM Almacen a " +
                                 "   INNER JOIN personal p ON p.ID_Personal = a.id_encargado AND p.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 " WHERE a.estado = " + (int)Enums.EstadoActivo.Activo + " AND a.id_empresa = " + id_empresa + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {

                DtbDatos = dsDatos.Tables[0];
                List<AlmacenDto> objLista = DtbDatos.ToList<AlmacenDto>();
            }
            else
            {
                DtbDatos = null;
                MensajeError = "Error al Cargar los datos";
            }

            return DtbDatos;
        }

        public List<AlmacenDto> Obtener()
        {

            List<AlmacenDto> objLista = new List<AlmacenDto>();

            string sSQL = "SELECT a.id_Almacen, a.Nombre_Almacen, " +
                                 " a.id_encargado,  " +
                                 " p.Nombres + ' ' + p.Ap_Paterno  Encargado_Almacen, " +
                                 " a.ubicacion, a.es_principal, " +
                                 " a.telefono_1, a.telefono_2, a.id_empresa, a.sec, a.estado, a.fecha_alta, a.usr_alta " +
                                 " FROM Almacen a " +
                                 "   INNER JOIN personal p ON p.ID_Personal = a.id_encargado AND p.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 " WHERE a.estado = " + (int)Enums.EstadoActivo.Activo + " AND a.id_empresa = " + id_empresa + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {

                DtbDatos = dsDatos.Tables[0];
                objLista = DtbDatos.ToList<AlmacenDto>();
            }
            else
            {
                DtbDatos = null;
                MensajeError = "Error al Cargar los datos";
            }

            return objLista;
        }

        public List<AlmacenDto> EsEncargadoAlmacen(int idPersonal, bool EncargadoPrincipal = false)
        {

            List<AlmacenDto> almacenes = new List<AlmacenDto>();

            string sSQL = "SELECT a.id_Almacen, a.Nombre_Almacen, " +
                                 " a.id_encargado,  " +
                                 " p.Nombres + ' ' + p.Ap_Paterno  Encargado_Almacen, " +
                                 " a.ubicacion, a.es_principal, " +
                                 " a.telefono_1, a.telefono_2, a.id_empresa, a.sec, a.estado, a.fecha_alta, a.usr_alta " +
                                 " FROM Almacen a " +
                                 "   INNER JOIN personal p ON p.ID_Personal = a.id_encargado AND p.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 " WHERE a.estado = " + (int)Enums.EstadoActivo.Activo + " AND a.id_empresa = " + id_empresa + " " +
                                 " and a.id_encargado = " + idPersonal + " ";

            if (EncargadoPrincipal)
                sSQL += " and a.es_principal = 1";


            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DtbDatos = dsDatos.Tables[0];
                almacenes = DtbDatos.ToList<AlmacenDto>();
            }
            else
            {
                MensajeError = "Error al Cargar los datos";
            }

            return almacenes;

        }
        #endregion
    }

}
