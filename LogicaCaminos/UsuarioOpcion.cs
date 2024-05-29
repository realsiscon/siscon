using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;

namespace LogicaSiscon
{
    public class UsuarioOpcion : AccesoDatos
    {
        #region Propiedades

        public int IdOpcion { get; set; }
        public int CodUsuario { get; set; }

        public string[] Opciones { get; set; }

        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }

        #endregion

        #region Constructor

        public UsuarioOpcion()
        {
            IdOpcion = 0;
            CodUsuario = 0;
            Opciones = new string[] { };
        }

        #endregion

        #region Metodos

        public DataTable ObtenerOpcionesUsuario()
        {
            DataSet dsDatos = new DataSet();
            //DataTable dtbArea = new DataTable();

            StringBuilder lStbMenu = new StringBuilder();
            lStbMenu.Append("select m.idOpcion, m.textoOpcion, m.idOpcionPadre, ISNULL(t.asignado,0) asignado ");
            lStbMenu.Append(" from OpcionesMenu m ");
            lStbMenu.Append("	left join (select  m.idOpcion, m.textoOpcion, m.idOpcionPadre, 1 asignado ");
            lStbMenu.Append("				from Usuario_Opcion o ");
            lStbMenu.Append("					inner join OpcionesMenu m on m.idOpcion = o.idOpcion ");
            lStbMenu.Append("						where m.valido=1 and m.idOpcion>0 ");
            lStbMenu.Append("						and o.cod_Usuario = " + CodUsuario + "");
            lStbMenu.Append("			   ) t on t.idOpcion = m.idOpcion ");
            lStbMenu.Append(" where m.valido=1 and m.idOpcion>0 ");

            dsDatos = EjecutarConsulta(lStbMenu.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Obtener las opciones asignadas al Usuario";
            }

            return dtDatos;
        }

        public int ModificarOpciones()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(ModificarRegistro_);

                if (!string.IsNullOrEmpty(MensajeError))
                    Resultado = -1;

                if (Resultado > 0)
                    Resultado = 0;

            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int ModificarRegistro_()
        {
            StringBuilder lStb = new StringBuilder();
            DataTable dtProyecto = new DataTable();


            lStb.Append("delete from Usuario_Opcion where cod_Usuario = " + CodUsuario + " ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                lStb.Clear();

                if (Opciones.Length > 0)
                {
                    foreach (string item in Opciones)
                    {
                        IdOpcion = (int)EjecutarEscalar_Txn("select idOpcion from OpcionesMenu where valido=1 and textoOpcion in ('" + item + "')");
                        lStb.Append("insert into Usuario_Opcion values(" + IdOpcion + "," + CodUsuario + ") ");
                    }

                    Resultado = EjecutarScript_Txn(lStb.ToString());
                }

                if (Resultado > 0)
                    Resultado = 0;
            }

            return Resultado;
        }


        #endregion

    }
}
