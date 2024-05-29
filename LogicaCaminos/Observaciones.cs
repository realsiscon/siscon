using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;

namespace LogicaSiscon
{
    [Serializable]
    public class Observaciones : AccesoDatos
    {
        #region Propiedades
        public int Cod_Observaciones { get; set; }
        public string Descripcion { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public string descEstado { get; set; }
        public string Motivo_Desh { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }
        #endregion

        #region Constructor

        public Observaciones()
        {
            Cod_Observaciones = 0;
            Descripcion = "";
            Estado = 0;
            Secuencia = 0;
            descEstado = "";
            dtDatos = new DataTable();
        }

        #endregion

        #region Metodos
        public List<Observaciones> CargarObservaciones()
        {
            List<Observaciones> lstObservaciones = new List<Observaciones>();
            DataSet dsDatos = new DataSet();
            dsDatos = EjecutarConsulta("select Cod_Observaciones, Descripcion , Estado, case estado when 0 then 'Habilitado' else 'Deshabilitado'  end descEstado from observaciones where Estado=0 ");

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                foreach (DataRow item in dsDatos.Tables[0].Rows)
                {
                    Observaciones p = new Observaciones()
                    {
                        Cod_Observaciones = Convert.ToInt32(item["Cod_Observaciones"]),
                        Descripcion = Convert.ToString(item["Descripcion"]),
                        Estado = Convert.ToInt16(item["estado"]),
                        descEstado = Convert.ToString(item["descEstado"])
                    };

                    lstObservaciones.Add(p);
                }
            }
            else
            {
                lstObservaciones = null;
                MensajeError = "Error al Cargar las Observaciones";
            }

            return lstObservaciones;
        }


        public int ModificarRegistro()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(ModificarRegistro_);
                //EjecutarProceso(ModificarRegistro_);
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
            bool RegistroModificado = false;

            //dtProyecto = ObtenerProyectos(ID_proyecto);

            if (Cod_Observaciones != 0)
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select Secuencia from Observaciones where Cod_Observaciones = " + Cod_Observaciones + " ");
            }

            lStb.Append("update Observaciones set ");
            lStb.Append(" fecha_desh=getdate() ,estado = 9 ");
            if (Estado == 9)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where Cod_Observaciones = " + Cod_Observaciones + " and Secuencia = " + Secuencia + " ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                if (RegistroModificado)
                {
                    //Resultado = Registrar(); // Registro();

                    Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Observaciones where Cod_Observaciones = " + Cod_Observaciones + " ") + 1;


                    lStb.Append("insert into Observaciones values(" + Cod_Observaciones + ",'" + Descripcion + "', ");
                    lStb.Append(" 0, " + Secuencia + ", getdate(), null, null, null) ");

                    Resultado = EjecutarScript_Txn(lStb.ToString());


                    if (Resultado > 0)
                        Resultado = 0;
                }
            }

            return Resultado;
        }

        public int Registrar()
        {
            Resultado = -10;

            try
            {
                EjecutarProceso(Registrar_);
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

            if (Cod_Observaciones == 0)
            {
                Cod_Observaciones = (int)EjecutarEscalar("Select isnull(max(Cod_Observaciones),0) + 1 from Observaciones");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Material where Cod_Observaciones = " + Cod_Observaciones + " ") + 1;
            }

            lStb.Append("insert into Observaciones values(" + Cod_Observaciones + ",'" + Descripcion + "', ");
            lStb.Append(" 0, " + Secuencia + ", getdate(), null, null, null) ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }
        #endregion
    }
}
