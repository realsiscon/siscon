using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;

namespace LogicaSiscon
{
    public class Opcion : AccesoDatos
    {
        #region Propiedades
        public int IdOpcion { get; set; }
        public string textoOpcion { get; set; }
        public int idOpcionPadre { get; set; }
        public string OpcionPadre { get; set; }
        public string pantalla { get; set; }
        public int Valido { get; set; }
        public string descValido { get; set; }

        private int Resultado { get; set; }
        public DataTable dtDatos { get; set; }

        #endregion

        #region Constructor

        public Opcion()
        {
            IdOpcion = 0;
            textoOpcion = "";
            idOpcionPadre = 0;
            pantalla = "";
            Valido = 0;
            descValido = "";
            Resultado = -1;
            dtDatos = new DataTable();
        }

        #endregion

        #region Metodos
        public List<Opcion> ObtenerMenu(bool SoloMenu = false)
        {
            List<Opcion> lstMenu = new List<Opcion>();
            DataSet dsDatos = new DataSet();
            StringBuilder lStbSQL = new StringBuilder();

            lStbSQL.Append("select m.idOpcion, m.textoOpcion, m.valido, case m.valido when 1 then 'SI' else 'NO' end descValido, m.idOpcionPadre , s.textoOpcion OpcionPadre , m.pantallaNueva Pantalla ");
            lStbSQL.Append("from OpcionesMenu m ");
            lStbSQL.Append("	left join (select idOpcion,textoOpcion from OpcionesMenu where idOpcionPadre=0) s on s.idOpcion = m.idOpcionPadre ");
            lStbSQL.Append(" where m.idOpcion > 0");
            if (SoloMenu == true)
                lStbSQL.Append(" and m.idOpcionPadre = 0 "); // Solo muestra las opciones de Menu
            else
                lStbSQL.Append(" and m.idOpcionPadre > 0 "); // Muestra las pantallas y sus respectivos padres

            dsDatos = EjecutarConsulta(lStbSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                foreach (DataRow item in dsDatos.Tables[0].Rows)
                {
                    Opcion objMenu = new Opcion()
                    {
                        IdOpcion = Convert.ToInt32(item["idOpcion"]),
                        textoOpcion = Convert.ToString(item["textoOpcion"]),
                        Valido = Convert.ToInt16(item["valido"]),
                        descValido = Convert.ToString(item["descValido"]),
                        idOpcionPadre = Convert.ToInt32(item["idOpcionPadre"]),
                        OpcionPadre = Convert.ToString(item["OpcionPadre"]),
                        pantalla = Convert.ToString(item["Pantalla"])
                    };

                    lstMenu.Add(objMenu);
                }
            }
            else
            {
                lstMenu = null;
                MensajeError = "Error al Cargar el Menu del sistema";
            }

            return lstMenu;
        }

        public int ModificarRegistro()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(ModificarRegistro_);
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
            DataTable dtMenu = new DataTable();

            lStb.Append("update OpcionesMenu set ");
            lStb.Append(" valido = " + Valido + ", textoOpcion = '" + textoOpcion + "', pantallaNueva = '"+ pantalla + "', idOpcionPadre = "+ idOpcionPadre +" ");
            lStb.Append(" where idOpcion = " + IdOpcion + " ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            return Resultado;
        }

        public int Registrar()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(Registrar_);
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

        private int Registrar_()
        {
            StringBuilder lStb = new StringBuilder();

            if (IdOpcion == 0)
            {
                IdOpcion = (int)EjecutarEscalar_Txn("Select isnull(max(IdOpcion),0) + 1 from OpcionesMenu");
            }

            if (idOpcionPadre == 0)
                pantalla = "#";

            lStb.Append("insert into OpcionesMenu values(" + IdOpcion + ",'" + textoOpcion + "'," + idOpcionPadre + ",'" + pantalla + "','grupoOver.gif',null,null,1,0, '" + pantalla + "') ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            return Resultado;
        }
        #endregion
    }
}
