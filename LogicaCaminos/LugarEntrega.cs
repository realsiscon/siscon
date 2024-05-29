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
    public class LugarEntrega : AccesoDatos
    {
        public int ID_Lugar { get; set; }
        public string Nombre_Lugar { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public string descEstado { get; set; }

        public string Motivo_Desh { get; set; }
        public DataTable dtLugaresEstrega { get; set; }

        private int Resultado { get; set; }
        public LugarEntrega()
        {
            ID_Lugar = 0;
            Nombre_Lugar = "";
            Estado = 0;
            Secuencia = 0;
            descEstado = "";
            dtLugaresEstrega = new DataTable();
        }
        public List<LugarEntrega> CargarLugaresEntrega()
        {
            List<LugarEntrega> lstLugares = new List<LugarEntrega>();
            DataSet dsDatos = new DataSet();
            dsDatos = EjecutarConsulta("select ID_Lugar, Nombre_Lugar, estado, case estado when 0 then 'Habilitado' else 'Deshabilitado'  end descEstado from Lugar_Entrega where Estado=0 ");

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtLugaresEstrega = dsDatos.Tables[0];

                foreach (DataRow item in dsDatos.Tables[0].Rows)
                {
                    LugarEntrega p = new LugarEntrega()
                    {
                        ID_Lugar = Convert.ToInt32(item["ID_Lugar"]),
                        Nombre_Lugar = Convert.ToString(item["Nombre_Lugar"]),
                        Estado = Convert.ToInt32(item["estado"]),
                        descEstado = Convert.ToString(item["descEstado"])
                    };

                    lstLugares.Add(p);
                }
            }
            else
            {
                lstLugares = null;
                MensajeError = "Error al Cargar los Proyectos";
            }

            return lstLugares;
        }

        #region Metodos

        public int ModificarLugarEntrega()
        {
            Resultado = -10;

            try
            {
                EjecutarProceso(ModificarLugarEntrega_);
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

        private int ModificarLugarEntrega_()
        {
            StringBuilder lStb = new StringBuilder();
            DataTable dtProyecto = new DataTable();
            bool RegistroModificado = false;

            //dtProyecto = ObtenerProyectos(ID_proyecto);

            if (ID_Lugar != 0)
            {
                Secuencia = (int)EjecutarEscalar("Select Secuencia from Lugar_Entrega where ID_Lugar = " + ID_Lugar + " ");
            }

            lStb.Append("update Lugar_Entrega set ");
            lStb.Append(" fecha_desh=getdate() ,estado = 9 ");
            if (Estado == 9)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where ID_Lugar = " + ID_Lugar + " and Secuencia = " + Secuencia + " ");

            Resultado = EjecutarScript(lStb.ToString());

            if (Resultado > 0)
            {
                if (RegistroModificado)
                {
                    Resultado = RegistrarLugar(); // Registro();

                    if (Resultado > 0)
                        Resultado = 0;
                }
            }

            return Resultado;
        }

        public int RegistrarLugar()
        {
            Resultado = -10;

            try
            {
                EjecutarProceso(RegistrarLugar_);
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


        private int RegistrarLugar_()
        {
            StringBuilder lStb = new StringBuilder();

            if (ID_Lugar == 0)
            {
                ID_Lugar = (int)EjecutarEscalar("Select isnull(max(ID_Lugar),0) + 1 from Lugar_Entrega");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar("Select max(Secuencia) from Lugar_Entrega where ID_Lugar = " + ID_Lugar + " ") + 1;
            }

            lStb.Append("insert into Lugar_Entrega values(" + ID_Lugar + ",'" + Nombre_Lugar + "', ");
            lStb.Append(" 0, " + Secuencia + ", getdate(), null, null, null) ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        #endregion
    }
}
