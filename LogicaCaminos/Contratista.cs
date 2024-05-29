using Datos;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon
{
    public class Contratista : AccesoDatos
    {
        #region Propiedades


        public int id_contratista { get; set; }
        public string Nombre_contratista { get; set; }
        public string Nro_Doc { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string especialidad { get; set; }
        public string Codigo_banco { get; set; }
        public string nro_cuenta { get; set; }
        public int tipo_seguro { get; set; }
        public string nro_seguro { get; set; }
        public int emite_factura { get; set; }
        public string mail { get; set; }
        public int estado { get; set; }
        public int sec { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }
        public int id_empresa { get; set; }

        public string descEstado { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }



        #endregion

        #region Constructor

        public Contratista(int ID_empresa = 1)
        {
            id_contratista = 0;
            Nombre_contratista = "";
            Nro_Doc = "";
            direccion = "";
            telefono = "";
            especialidad = "";
            Codigo_banco = "";
            nro_cuenta = "";
            tipo_seguro = 0;
            nro_seguro = "";
            emite_factura = 0;
            mail = "";
            estado = 1;
            sec = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;
            id_empresa = ID_empresa;
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
            DataTable dtDatos = new DataTable();
            bool RegistroModificado = false;

            dtDatos = Obtener(id_contratista);

            if (id_contratista != 0)
            {
                sec = (int)EjecutarEscalar("Select sec from contratista where id_contratista = " + id_contratista + " ");
            }

            lStb.Append("update contratista set ");
            lStb.Append(" estado = " + (int)Enums.EstadoActivo.Inactivo + " ");
            


            lStb.Append(" where id_contratista = " + id_contratista + " and sec = " + sec + " ");

            Resultado = EjecutarScript(lStb.ToString());
            RegistroModificado = true;


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

            if (id_contratista == 0)
            {
                id_contratista = (int)EjecutarEscalar("Select isnull(max(id_contratista),0) + 1 from Contratista ");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from Conratista where id_contratista = " + id_contratista + " ") + 1;
            }

            lStb.Append(" INSERT INTO contratista (id_contratista, Nombre_contratista, Nro_Doc, direccion, telefono, especialidad, Codigo_banco, nro_cuenta, tipo_seguro, nro_seguro, emite_factura, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES ");
            lStb.Append(" VALUES ("+ id_contratista +", '"+ Nombre_contratista +"', '"+ Nro_Doc +"', '"+ direccion +"', '"+ telefono +"', '"+especialidad+"', '"+ Codigo_banco +"', "+ nro_cuenta + ", "+tipo_seguro+", '"+ nro_seguro +"', "+emite_factura+", '"+mail+"', "+estado+", "+sec+", getdate(), "+usr_alta+", "+id_empresa+") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        public DataTable Obtener(int id_grupo = 0)
        {
            //List<Proyecto> lstProyectos = new List<Proyecto>();
            DataSet dsDatos = new DataSet();

            StringBuilder sSql = new System.Text.StringBuilder();
            sSql.Append("select id_contratista, Nombre_contratista");
            sSql.Append("  from contratista c");
            sSql.Append("    where c.estado =  " + (int)Enums.EstadoActivo.Activo + " and c.id_empresa = 1");
            

            dsDatos = EjecutarConsulta(sSql.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];

            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Cargar los datos";
            }

            return dtDatos;
        }


        #endregion

    }
}
