using Datos;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Almacenes.Ingresos
{
    public class IngresoAlmacen : AccesoDatos
    {
        public int ID_Ingreso { get; set; }
        public string OrdenCompra { get; set; }
        public int Material_ID { get; set; }
        public int Almacen_ID { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Precio_Unitario { get; set; }
        public decimal Total { get; set; }
        public decimal Stock_Total { get; set; }
        public int id_empresa { get; set; }
        public int sec { get; set; }
        public int estado { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }

        public List<IngresoAlmacenDto> _ingresosxAlmacen { get; set; }


        public int Resultado { get; set; }


        public IngresoAlmacen(int ID_empresa = 1)
        {
            ID_Ingreso = 0;
            OrdenCompra = "";
            Material_ID = 0;
            Almacen_ID = 0;
            Cantidad = 0;
            Precio_Unitario = 0;
            Total = 0;
            Stock_Total = 0;
            id_empresa = ID_empresa;
            sec = 0;
            estado = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;

        }

        #region Metodos

        //public int Modificar()
        //{
        //    Resultado = 0;

        //    try
        //    {
        //        EjecutarProceso(Modificar_);
        //        Resultado = 0;
        //    }
        //    catch (Exception ex)
        //    {
        //        MensajeError = ex.Message;
        //        Resultado = -1;
        //    }


        //    return Resultado;
        //}

        //private int Modificar_()
        //{
        //    StringBuilder lStb = new StringBuilder();
        //    DataTable dtProyecto = new DataTable();
        //    bool RegistroModificado = false;


        //    if (id_Almacen != 0)
        //    {
        //        sec = (int)EjecutarEscalar("Select sec from Almacen where id_Almacen = " + id_Almacen + " ");
        //    }

        //    lStb.Append("update Almacen set ");
        //    lStb.Append(" estado = " + (int)Enums.EstadoActivo.Inactivo + " ");
        //    //if (estado == (int)Enums.EstadoActivo.Inactivo)
        //    //    lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
        //    //else
        //    //{
        //    //    lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
        //    //    RegistroModificado = true;
        //    //}


        //    lStb.Append(" where id_Almacen = " + id_Almacen + " and sec = " + sec + " ");

        //    Resultado = EjecutarScript(lStb.ToString());

        //    if (Resultado > 0)
        //    {
        //        //if (RegistroModificado)
        //        //{
        //        Resultado = Registrar(); // Registro();

        //        if (Resultado > 0)
        //            Resultado = 0;
        //        //}
        //    }

        //    return Resultado;
        //}

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

            if (ID_Ingreso == 0)
            {
                ID_Ingreso = (int)EjecutarEscalar("Select isnull(max(ID_Ingreso),0) + 1 from IngresoAlmacen");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from IngresoAlmacen where ID_Ingreso = " + ID_Ingreso + " ") + 1;
            }

            //lStb.Append(" INSERT INTO Almacen (id_Almacen, Nombre_Almacen,ubicacion, es_principal, id_encargado, direccion, telefono_1, telefono_2, id_empresa, sec, estado, fecha_alta, usr_alta) ");
            //lStb.Append(" VALUES (" + id_Almacen + ", '" + Nombre_Almacen + "','" + direccion + "', " + es_principal + " , " + id_encargado + ", '" + direccion + "', '" + telefono_1 + "', '" + telefono_2 + "', " + id_empresa + ", " + sec + ", " + (int)Enums.EstadoActivo.Activo + ", getdate(), " + usr_alta + ") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        public List<IngresoAlmacenDto> Obtener()
        {

            List<IngresoAlmacenDto> objLista = new List<IngresoAlmacenDto>();

            string sSQL = "SELECT a.id_Almacen, a.Nombre_Almacen, " +
                                 " a.id_encargado,  " +
                                 " p.Nombres + ' ' + p.Ap_Paterno  Encargado_Almacen, " +
                                 " a.ubicacion, a.es_principal, " +
                                 " a.telefono_1, a.telefono_2, a.id_empresa, a.sec, a.estado, a.fecha_alta, a.usr_alta " +
                                 " FROM Almacen a " +
                                 "   INNER JOIN personal p ON p.ID_Personal = a.id_encargado AND p.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 " WHERE a.estado = " + (int)Enums.EstadoActivo.Activo + " AND a.id_empresa = " + id_empresa + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                objLista = dsDatos.Tables[0].ToList<IngresoAlmacenDto>();
            }
            else
            {
                objLista = null;
                MensajeError = "Error al Cargar los datos";
            }

            return objLista;
        }


        #endregion
    }
}
