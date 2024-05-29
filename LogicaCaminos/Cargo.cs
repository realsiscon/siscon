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
    [Serializable]
    public class Cargo : AccesoDatos
    {
        #region Propiedades
        public int ID_cargo { get; set; }
        public string Descripcion { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public string descEstado { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }


        public List<CargoDto> CargoList { get; set; }

        #endregion

        #region Constructor
        public Cargo()
        {
            ID_cargo = 0;
            Descripcion = "";
            Estado = 0;
            Secuencia = 0;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = DateTime.Now;
            usr_desh = 0;
            Motivo_Desh = "";
        }
        #endregion

        #region Metodos

        public DataTable ObtenerCargos()
        {
            DataSet dsDatos = new DataSet();
            //DataTable dtbArea = new DataTable();

            StringBuilder lStbCargos = new System.Text.StringBuilder();
            lStbCargos.Append("select ID_cargo, Descripcion, Estado, case estado when 1 then 'Habilitado' else 'Deshabilitado'  end descEstado from Cargo where Estado=1");


            dsDatos = EjecutarConsulta(lStbCargos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                CargoList = dtDatos.ToList<CargoDto>();
            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Obtener los Cargos";
            }

            return dtDatos;
        }

       


        public int ModificarCargo()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(ModificarRegistro_);                
                if (Resultado == 0)
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

            bool RegistroModificado = false;


            if (ID_cargo != 0)
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Cargo where ID_cargo = " + ID_cargo + " ");
            }

            lStb.Append("update Cargo set ");
            lStb.Append(" fecha_desh=getdate(), usr_desh  = "+ usr_desh +" ,estado = " + (int)Enums.EstadoActivo.Inactivo + " ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
            {
                lStb.Append(" ,motivo_desh='"+ Motivo_Desh +"'");
                RegistroModificado = false;
            }
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO' ");
                RegistroModificado = true;
            }


            lStb.Append(" where ID_cargo = " + ID_cargo + " and Secuencia = " + Secuencia + " ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                if (RegistroModificado)
                {
                    Secuencia = Secuencia + 1;


                    lStb.Append("insert into Cargo values(" + ID_cargo + ",'" + Descripcion + "', ");
                    lStb.Append(" " + (int)Enums.EstadoActivo.Activo + ", " + Secuencia + ", getdate(), null, null, null) ");

                    Resultado = EjecutarScript_Txn(lStb.ToString());
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
                if (Resultado >= 0)
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

            if (ID_cargo == 0)
            {
                ID_cargo = (int)EjecutarEscalar("Select isnull(max(ID_cargo),0) + 1 from Cargo");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Cargo where ID_cargo = " + ID_cargo + " ") + 1;
            }

            lStb.Append("insert into Cargo values(" + ID_cargo + ",'" + Descripcion + "', ");
            lStb.Append(" " + (int)Enums.EstadoActivo.Activo + " , " + Secuencia + ", getdate(), null, null, null) ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }
        #endregion
    }
}
