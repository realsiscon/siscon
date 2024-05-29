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
    public class Unidad: AccesoDatos
    {
        public int Id_Unidad { get; set; }
        public string Desc_Unidad { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }

        public string descEstado { get; set; }
        public string Motivo_Desh { get; set; }
        public DataTable dtUnidad { get; set; }
        private int Resultado { get; set; }

        public List<UnidadDto> lstUnidades;

        public Unidad() 
        {
            Id_Unidad = 0;
            Desc_Unidad = "";
            Estado = 0;
            Secuencia = 0;
            descEstado = "";
            dtUnidad = new DataTable();
        }


        public List<UnidadDto> CargarUnidad()
        {
            
            DataSet dsDatos;
            StringBuilder lStbUnidad = new StringBuilder();
            lStbUnidad.Append("select Cod_unidad, Descripcion, estado, case estado when "+ (int)Enums.EstadoActivo.Activo +" then 'Habilitado' else 'Deshabilitado'  end descEstado  from Unidad  ");
            lStbUnidad.Append("where Estado = "+ (int)Enums.EstadoActivo.Activo + " ");
            
            dsDatos = EjecutarConsulta(lStbUnidad.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtUnidad = dsDatos.Tables[0];

                lstUnidades = dtUnidad.ToList<UnidadDto>();                
            }
            else
            {
                lstUnidades = null;
                MensajeError = "Error al Cargar las unidades";
            }

            return lstUnidades;
        }

        #region Metodos

        public int ModificarRegistro()
        {
            Resultado = -10;

            try
            {
                EjecutarProceso(ModificarRegistro_);
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

            if (Id_Unidad != 0)
            {
                Secuencia = (int)EjecutarEscalar("Select max(Secuencia) from Unidad where Cod_Unidad = " + Id_Unidad + " ");
            }

            lStb.Append("update Unidad set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo +" ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where Cod_Unidad = " + Id_Unidad + " and Secuencia = " + Secuencia + " ");

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

            if (Id_Unidad == 0)
            {
                Id_Unidad = (int)EjecutarEscalar("Select isnull(max(Cod_Unidad),0) + 1 from Unidad");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar("Select max(Secuencia) from Unidad where Cod_Unidad = " + Id_Unidad + " ") + 1;
            }

            lStb.Append("insert into Unidad values(" + Id_Unidad + ",'" + Desc_Unidad + "', ");
            lStb.Append(" "+ (int)Enums.EstadoActivo.Activo + ", " + Secuencia + ", getdate(), null, null, null) ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        #endregion
    }
}
