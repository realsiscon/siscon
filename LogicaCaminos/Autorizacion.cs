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
    public class Autorizacion : AccesoDatos
    {
        #region Propiedades

        public int Cod_Autorizacion { get; set; }
        public int Cod_Prioridad { get; set; }
        public int Estado { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }

        // Detalle de Autorizaciones

        public int Cod_Detalle_Autorizadores { get; set; }
        //public int Cod_Autorizacion { get; set; }
        public int Secuencia { get; set; }
        public int Cod_Persona { get; set; }

        public string descEstado { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }

        public List<DetalleAutorizacion> Detalle { get; set; }


        #endregion

        #region Constructor
        public Autorizacion()
        {
            Cod_Autorizacion = 0;
            Cod_Prioridad = 0;
            Estado = 1;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = DateTime.Now;
            usr_desh = 0;
            Motivo_Desh = "";

            Cod_Detalle_Autorizadores = 0;
            Secuencia = 0;
            Cod_Persona = 0;

            Detalle = new List<DetalleAutorizacion>();
        }
        #endregion

        #region Metodos

        public DataTable CargarDetalleAutorizacion()
        {
            int Total = 10;

            DataSet dsDatos = new DataSet();
            DataTable dtDetalleAutorizadores = new DataTable();
            dtDetalleAutorizadores.Columns.Add(new DataColumn("Cod_Detalle_Autorizadores", System.Type.GetType("System.String")));
            dtDetalleAutorizadores.Columns.Add(new DataColumn("Cod_Autorizacion", System.Type.GetType("System.String")));
            dtDetalleAutorizadores.Columns.Add(new DataColumn("Cod_Persona", System.Type.GetType("System.String")));
            dtDetalleAutorizadores.Columns.Add(new DataColumn("NombreCompleto", System.Type.GetType("System.String")));
            dtDetalleAutorizadores.Columns.Add(new DataColumn("Secuencia", System.Type.GetType("System.String")));
            dtDetalleAutorizadores.Columns.Add(new DataColumn("estado", System.Type.GetType("System.String")));
            dtDetalleAutorizadores.Columns.Add(new DataColumn("descEstado", System.Type.GetType("System.String")));

            StringBuilder lStbAutorizaciones = new System.Text.StringBuilder();
            lStbAutorizaciones.Append("select da.Cod_Detalle_Autorizadores,  ");
            lStbAutorizaciones.Append(" da.Cod_Autorizacion,da.Cod_Persona,isnull((p.Nombres + ' ' + p.Ap_Paterno + ' ' + p.Ap_Materno),'Gerente de Area') NombreCompleto, ");
            lStbAutorizaciones.Append("	da.Secuencia,da.estado, case da.estado when "+ (int)Enums.EstadoActivo.Activo + " then 'Habilitado' else 'Deshabilitado'  end descEstado ");
            lStbAutorizaciones.Append(" from Detalle_Autorizadores da ");
            lStbAutorizaciones.Append(" 	left join Personal p on p.ID_Personal = da.Cod_Persona and p.Estado=0 ");
            lStbAutorizaciones.Append(" where da.Estado = "+ (int)Enums.EstadoActivo.Activo + " and da.Cod_Autorizacion = " + Cod_Prioridad + " ");

            dsDatos = EjecutarConsulta(lStbAutorizaciones.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                dtDetalleAutorizadores = dtDatos.Copy();

                for (int i = dtDetalleAutorizadores.Rows.Count; i < Total; i++)
                {
                    DataRow item = dtDetalleAutorizadores.NewRow();
                    item["Cod_Detalle_Autorizadores"] = "0";
                    item["Cod_Autorizacion"] = "0";
                    item["Cod_Persona"] = "0";
                    item["NombreCompleto"] = "";
                    item["Secuencia"] = Convert.ToInt16(i + 1);
                    item["estado"] = "0";
                    item["descEstado"] = "";

                    dtDetalleAutorizadores.Rows.Add(item);
                }

            }
            else
            {
                for (int i = 0; i < Total; i++)
                {
                    DataRow item = dtDetalleAutorizadores.NewRow();
                    item["Cod_Detalle_Autorizadores"] = "0";
                    item["Cod_Autorizacion"] = "0";
                    item["Cod_Persona"] = "0";
                    item["NombreCompleto"] = "";
                    item["Secuencia"] = Convert.ToInt16(i + 1);
                    item["estado"] = "0";
                    item["descEstado"] = "";

                    dtDetalleAutorizadores.Rows.Add(item);
                }

                MensajeError = "Error al Cargar las Autorizaciones";
            }

            return dtDetalleAutorizadores;
        }

        public int ModificarDetalleAutorizacion()
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


            lStb.Append("Update Detalle_Autorizadores set estado = "+ (int)Enums.EstadoActivo.Inactivo + " , ");
            lStb.Append(" Fecha_Desh = getdate(), Motivo_desh = 'Modificacion de Autorizadores', usr_desh = "+ usr_desh +" ");
            lStb.Append(" where Cod_Autorizacion = "+ Cod_Autorizacion  +" and estado= "+ (int)Enums.EstadoActivo.Activo + "");

            Resultado = EjecutarScript_Txn(lStb.ToString());
            
            if (Resultado == 0)
            {
                Cod_Detalle_Autorizadores = (int)EjecutarEscalar_Txn("select max(Cod_Detalle_Autorizadores) + 1 from Detalle_Autorizadores ");

                foreach (DetalleAutorizacion item in Detalle)
                {
                    lStb.Clear();
                    
                    lStb.Append("insert into Detalle_Autorizadores values(" + Cod_Detalle_Autorizadores + "," + Cod_Autorizacion + ", " + item.Secuencia + ", ");
                    lStb.Append(" " + item.Cod_Persona +", "+ item.Estado +", getdate(),null,null,null ) ");

                    Resultado = EjecutarScript_Txn(lStb.ToString());

                    Cod_Detalle_Autorizadores = Cod_Detalle_Autorizadores + 1;
                }
                               
                if (Resultado > 0)
                    Resultado = 0;
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
            //StringBuilder lStb = new StringBuilder();

            //if (ID_Area == 0)
            //{
            //    ID_Area = (int)EjecutarEscalar("Select isnull(max(ID_Area),0) + 1 from Area");
            //    Secuencia = 1;
            //}
            //else
            //{
            //    Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Area where ID_Area = " + ID_Area + " ") + 1;
            //}

            //lStb.Append("insert into Area values(" + ID_Area + ",'" + Descripcion + "', ");
            //lStb.Append(" 0, " + Secuencia + ", getdate(), null, null, null) ");

            //Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        #endregion

    }
}
