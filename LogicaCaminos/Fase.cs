using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using LogicaSiscon.Utilitarios;

namespace LogicaSiscon
{
    public class Fase : AccesoDatos
    {
        #region Propiedades

        public int id_fase { get; set; }
        public int id_proyecto { get; set; }
        public string nombre { get; set; }
        public int sec_proyecto { get; set; }
        public int estado { get; set; }
        public decimal duracion_total { get; set; }
        public int id_encargado { get; set; }
        public string observacion { get; set; }
	    public int sec { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }
        public int ID_Empresa { get; set; }

        public DataTable DtbFases { get; set; }

        public int Resultado { get; set; }
        #endregion

        #region Constructor

        public Fase(int id_empresa = 0)
        {
            id_fase = 0;
            id_proyecto = 0;
            nombre = "";
            sec_proyecto = 0;            
            estado = 1;
            duracion_total = 0;
            id_encargado = 0;
            observacion = "";
            sec = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;
            ID_Empresa = id_empresa;
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
            bool RegistroModificado = false;

            dtProyecto = Obtener(id_fase);

            if (id_fase != 0)
            {
                sec = (int)EjecutarEscalar("Select sec from fases where id_fase = " + id_fase + " ");
            }

            lStb.Append("update fases set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo + " ");
            if (estado == 0)
                lStb.Append(" ,observacion='" + observacion + "'");
            else
            {
                lStb.Append(" ,observacion='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where id_fase = " + id_fase + " and sec = " + sec + " ");

            Resultado = EjecutarScript(lStb.ToString());

            if (Resultado > 0)
            {
                if (RegistroModificado)
                {
                    Resultado = Registrar(); // Registro();

                    if (Resultado > 0)
                        Resultado = 0;
                }
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

            if (id_fase == 0)
            {
                id_fase = (int)EjecutarEscalar("Select isnull(max(ID_fase),0) + 1 from fases");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from fases where Id_fases = " + id_fase + " ") + 1;
            }

            lStb.Append("INSERT INTO fases (id_fase, id_proyecto, nombre, sec_proyecto, estado, duracion_total, id_encargago, observacion, sec, fecha_alta, usr_alta, id_empresa)");
            lStb.Append(" VALUES ("+id_fase+", "+id_proyecto+", '"+nombre+"', "+sec_proyecto+", "+ (int)Enums.EstadoActivo.Activo + ", "+duracion_total+", "+id_encargado+", '"+observacion+"', "+sec+", GETDATE(), '"+usr_alta+"', "+ID_Empresa+") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }


        //public List<Proyecto> ObtenerProyectos()
        public DataTable Obtener(int IdFase = 0)
        {
            //List<Proyecto> lstProyectos = new List<Proyecto>();
            DataSet dsDatos = new DataSet();

            StringBuilder lStbProyectos = new System.Text.StringBuilder();
            lStbProyectos.Append("select f.id_fase, f.id_proyecto,f.nombre,f.sec_proyecto,f.estado,f.duracion_total,f.id_encargago,f.observacion,f.sec,f.fecha_alta,");
            lStbProyectos.Append(" f.usr_alta, f.id_empresa,p.Nomb_Proyecto,e.nombre ");
            lStbProyectos.Append(" from fases f ");
            lStbProyectos.Append("   inner join proyecto p on p.ID_proyecto=f.id_proyecto and p.Estado = "+ (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append("   inner join empresa e on e.id_empresa = f.id_empresa and e.estado = "+ (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append(" where  f.id_empresa = " + ID_Empresa + "");
            lStbProyectos.Append(" and f.id_proyecto = " + id_proyecto + "");

            if (id_fase > 0)
                lStbProyectos.Append(" and f.id_fase = " + id_fase + "");

            dsDatos = EjecutarConsulta(lStbProyectos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DtbFases = dsDatos.Tables[0];
                
            }
            else
            {
                DtbFases = null;
                MensajeError = "Error al Cargar las fases";
            }

            return DtbFases;
        }


        #endregion
    }
}
