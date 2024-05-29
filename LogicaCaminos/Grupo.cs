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
    public class Grupo : AccesoDatos
    {

        #region Propiedades
        public int id_grupo { get; set; }
        public string NombreGrupo { get; set; }
        public int id_proyecto { get; set; }
        public int ID_Empresa { get; set; }
        public int sec { get; set; }
        public int Estado { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }
        public DataTable DtbFases { get; set; }

        public int Resultado { get; set; }
        #endregion

        public Grupo(int id_empresa = 0)
        {
            id_grupo = 0;
            id_proyecto = 0;
            NombreGrupo = "";           
            ID_Empresa = id_empresa;
            Estado = 1;
            sec = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;

        }

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

            dtProyecto = Obtener(id_grupo);

            if (id_grupo != 0)
            {
                sec = (int)EjecutarEscalar("Select sec from grupo where id_grupo = " + id_grupo + " ");
            }

            lStb.Append("update grupo set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo + " ");
            //if (Estado == 0)
            //    lStb.Append(" ,observacion='" + observacion + "'");
            //else
            //{
            //    lStb.Append(" ,observacion='MODIFICACION DE DATOS POR USUARIO'");
            //    RegistroModificado = true;
            //}


            lStb.Append(" where id_grupo = " + id_grupo + " and sec = " + sec + " ");

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

            if (id_grupo == 0)
            {
                id_grupo = (int)EjecutarEscalar("Select isnull(max(id_grupo),0) + 1 from grupo ");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from grupo where id_grupo = " + id_grupo + " ") + 1;
            }

            lStb.Append("INSERT INTO grupo (id_grupo, NombreGrupo, id_proyecto, id_empresa, sec, estado, fecha_alta, usr_alta)");
            lStb.Append(" VALUES ("+id_grupo+", '"+ NombreGrupo +"', "+id_proyecto+", "+ ID_Empresa +", "+sec+", "+ (int)Enums.EstadoActivo.Activo + " , getdate(), "+ usr_alta+") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        public DataTable Obtener(int id_grupo = 0)
        {
            //List<Proyecto> lstProyectos = new List<Proyecto>();
            DataSet dsDatos = new DataSet();

            StringBuilder lStbProyectos = new System.Text.StringBuilder();
            lStbProyectos.Append("SELECT g.id_grupo, g.NombreGrupo, g.id_proyecto, g.id_empresa, p.Cod_proyecto, p.Nomb_Proyecto, e.nombre nombEmpresa ");
            lStbProyectos.Append(" FROM grupo g ");
            lStbProyectos.Append("   INNER JOIN proyecto p ON p.ID_proyecto = g.id_proyecto AND p.Estado = "+ (int)Enums.EstadoActivo.Activo + "");
            lStbProyectos.Append("   inner join empresa e on e.id_empresa = g.id_empresa and e.estado = "+ (int)Enums.EstadoActivo.Activo + "");
            lStbProyectos.Append(" where  g.id_empresa = " + ID_Empresa + "");
            lStbProyectos.Append(" and g.estado = " + (int)Enums.EstadoActivo.Activo + "");
            //lStbProyectos.Append(" and g.id_proyecto = " + id_proyecto + "");


            dsDatos = EjecutarConsulta(lStbProyectos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DtbFases = dsDatos.Tables[0];

            }
            else
            {
                DtbFases = null;
                MensajeError = "Error al Cargar los grúpos";
            }

            return DtbFases;
        }


        #endregion
    }
}
