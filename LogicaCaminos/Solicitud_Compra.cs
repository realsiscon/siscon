using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using System.Threading;
using LogicaSiscon.Utilitarios;

namespace LogicaSiscon
{
    public class Solicitud_Compra : AccesoDatos
    {
        #region Propiedades
        public int ID_Solicitud { get; set; }
        public int ID_Proyecto { get; set; }
        public int usr_Solicitud { get; set; }
        public int id_solicitante { get; set; }
        public string descripcion { get; set; }
        public int id_director { get; set; }
        public int id_empresa { get; set; }
        public DateTime Fecha_Entrega { get; set; }
        public string Estado_Solicitud { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime? Fecha_Desh { get; set; }
        public int usr_desh { get; set; }

        public string mail_director { get; set; }
        public DataTable Detalle { get; set; }
        private int Resultado { get; set; }

        public Detalle_Solicitud[] Detalles { get; set; }

        #endregion

        public Solicitud_Compra(int Id_Empresa) {
            ID_Solicitud = 0;
            ID_Proyecto = 0;
            usr_Solicitud = 0;
            id_solicitante = 0;
            descripcion = "";
            id_director = 0;
            id_empresa = Id_Empresa;
            Fecha_Entrega = DateTime.Now;
            Estado_Solicitud = "S";
            Estado = 1;
            Secuencia = 0;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = DateTime.Now;
            usr_desh = 0;

        }

        #region Metodos

        public int RegistrarSolicitud()
        {

            try
            {

                //EjecutarProceso(RegistrarSolcitud_);
                EjecutarTransaccion(RegistrarSolcitud_);

                if (Resultado == 0)
                {
                    

                }
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }



        private int RegistrarSolcitud_()
        {
            StringBuilder lStb = new StringBuilder();

            try
            {
                if (ID_Solicitud == 0)
                {
                    ID_Solicitud = (int)EjecutarEscalar_Txn("Select isnull(max(ID_Solicitud),0) + 1 from Solicitud");
                    Secuencia = 1;
                }
                else
                {
                    Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Solicitud where ID_Solicitud = " + ID_Solicitud + " ") + 1;
                }

                lStb.Append(" INSERT INTO Solicitud (ID_Solicitud, ID_Proyecto, usr_Solicitud, id_solicitante, descripcion, id_director, id_empresa, Fecha_Entrega, Estado_Solicitud, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh) VALUES ");
                lStb.Append(" ("+ ID_Solicitud + ", "+ID_Proyecto + ", " + usr_Solicitud + ", " + id_solicitante + ", '" + descripcion + "', " + id_director + ", " + id_empresa + ", '" + Fecha_Entrega.ToString("yyyyMMdd") + "', '"+ Estado_Solicitud +"', " + Estado + ", " + Secuencia + ", getdate(), null, null) ");

                Resultado = EjecutarScript_Txn(lStb.ToString());

                lStb.Clear();


                if (Resultado == 0)
                {
                    if (Detalle.Rows.Count > 0)
                    {
                        foreach (DataRow fila in Detalle.Rows)
                        {
                            lStb.Append(" INSERT INTO Detalle_Solicitud (ID_Solicitud, Cod_Material, Cod_Unidad, Item, Cantidad, id_actividad, id_empresa, Estado, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh) VALUES ");
                            //lStb.Append(" ("+ ID_Solicitud + ", "+ Convert.ToInt32(fila["Cod_Material"])+", "+ Convert.ToInt32(fila["Unidad"])+", "+ Convert.ToInt32(fila["Item"])+", "+ Convert.ToDecimal(fila["Cantidad"])+", "+ Convert.ToInt32(fila["id_actividad"])+", "+ Convert.ToInt32(fila["id_empresa"])+", "+ (int)Enums.EstadoActivo.Activo +", getdate() , null , null, null) "  );
                            lStb.Append(" ("+ ID_Solicitud +", "+ Convert.ToInt32(fila["Cod_Material"]) +", "+ Convert.ToInt32(fila["Cod_Unidad"]) +", "+ Convert.ToInt32(fila["Item"]) +", "+ Convert.ToInt32(fila["Cantidad"]) +", "+ Convert.ToInt32(fila["id_actividad"]) +", "+ Convert.ToInt32(fila["id_empresa"]) +", "+ (int)Enums.EstadoActivo.Activo +", getdate(), null, null, null) ");

                            Resultado = EjecutarScript_Txn(lStb.ToString());

                            if (Resultado != 0)
                                throw new Exception("Error al Registrar el Detalle de la Solicitud");

                            lStb.Clear();
                        }

                        if (Resultado == 0)
                        {

                            lStb.Clear();
                            // Registrar el Detalle de la Solicitud
                            lStb.Append(" INSERT INTO Solicitud_Autorizaciones (Cod_Solicitud, ID_Proyecto, ID_empresa, Cod_Persona, Autorizo, Estado, Fecha_Registro, Fecha_Autorizacion, Observacion, Fecha_Desh, usr_desh, Motivo_Desh) VALUES ");
                            lStb.Append(" ("+ ID_Solicitud + ", "+ ID_Proyecto + ", "+ id_empresa + " , "+ id_director + ", 'N', "+ (int)Enums.EstadoActivo.Activo +", getdate(), null, null, null, null, null)");

                            Resultado = EjecutarScript_Txn(lStb.ToString());

                            if (Resultado != 0)
                                throw new Exception("Error al Registrar las Solicitudes de Autorizacion");

                            lStb.Clear();
                            //lStb.Append("select p.Mail  ");
                            //lStb.Append("from Solicitud_Autorizaciones sa ");
                            ////lStb.Append(" 	inner join Detalle_Autorizadores da on da.Cod_Detalle_Autorizadores= sa.Cod_Detalle_Autorizadores and da.Estado=0 ");
                            //lStb.Append("   inner join Personal p on p.ID_Personal = sa.Cod_Persona and p.Estado = "+ Enums.EstadoActivo.Activo +" ");
                            ////lStb.Append(" where da.Secuencia = 1 and da.estado = 0 and sa.Cod_Solicitud = " + ID_Solicitud + " ");
                            //lStb.Append(" where  sa.Cod_Solicitud = " + ID_Solicitud + " ");
                            //string mail = (string)EjecutarEscalar_Txn(lStb.ToString());

                            //string mail = mail_director;
                            string mail = "ferfsc@gmail.com";

                            try
                            {
                                // Envie Correo al primer autorizador

                                Thread hiloEnvioMail = new Thread(() =>
                                {
                                    EnvioMail.SendMail("Autorización de Solicitud de Materiales", "Autorizar la solicitud", EnvioMail.PRIORITY.Alta, mail);
                                });

                                hiloEnvioMail.Name = "EnvioMail";
                                hiloEnvioMail.Start();
                            }
                            catch (Exception) { }
                        }
                    }                   
                }
            }
            catch (Exception ex)
            {
                ID_Solicitud = 0;
                DeshacerTransaccion();
                Resultado = -1;

            }



            return Resultado;
        }

        private int RegistrarDetalle_()
        {
            StringBuilder lStb = new StringBuilder();

            //foreach (DataRow item in Detalle.Rows)
            //{
            //    lStb.Append("insert into Detalle_Solicitud values(" + ID_Solicitud + ", " +  + "," + usr_Solicitud + ", " + usr_gerente_area + ", ");
            //    lStb.Append(" " + ID_LugarEntrega + ", " + Importe_Total + ", 0, getdate(), null, null, null) ");
            //}



            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }
        #endregion
    }
}
