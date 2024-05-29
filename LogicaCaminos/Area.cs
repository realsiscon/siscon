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
    public class Area: AccesoDatos
    {
        #region Propiedades

        public int ID_Area { get; set; }
        public string Descripcion { get; set; }
        public int Estado { get; set;}
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public string descEstado { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }

        public List<AreaDto> lstAreas { get; set; }
        #endregion

        public Area()
        {
            ID_Area = 0;
            Descripcion = "";
            Estado = 0;
            Secuencia = 0;
            descEstado = "";
            dtDatos = new DataTable();
        }

       

        public DataTable CargarAreas()
        {
            DataSet dsDatos;

            StringBuilder lStbCargos = new System.Text.StringBuilder();
            lStbCargos.Append("select ID_Area, Descripcion, Estado, case estado when "+ (int)Enums.EstadoActivo.Activo +" then 'Habilitado' else 'Deshabilitado'  end descEstado from Area where Estado= "+ (int)Enums.EstadoActivo.Activo + " ");


            dsDatos = EjecutarConsulta(lStbCargos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                lstAreas = dtDatos.ToList<AreaDto>();
            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Cargar las Areas";
                lstAreas = null;
            }

            return dtDatos;
        }

        public int ModificarArea()
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
            DataTable dtProyecto;
            bool RegistroModificado = false;

            if (ID_Area != 0)
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Area where ID_Area = " + ID_Area + " ");
            }

            lStb.Append("update Area set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo +" ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where ID_Area = " + ID_Area + " and Secuencia = " + Secuencia + " ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                if (RegistroModificado)
                {
                    Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Area where ID_Area = " + ID_Area + " ") + 1;

                    lStb.Append("insert into Area values(" + ID_Area + ",'" + Descripcion + "', ");
                    lStb.Append(" "+ (int)Enums.EstadoActivo.Activo +", " + Secuencia + ", getdate(), null, null, null) ");

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

            if (ID_Area == 0)
            {
                ID_Area = (int)EjecutarEscalar("Select isnull(max(ID_Area),0) + 1 from Area");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Area where ID_Area = " + ID_Area + " ") + 1;
            }

            lStb.Append("insert into Area values(" + ID_Area + ",'" + Descripcion + "', ");
            lStb.Append(" " + (int)Enums.EstadoActivo.Activo + ", " + Secuencia + ", getdate(), null, null, null) ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }
    }
}
