using Datos;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Runtime.InteropServices.WindowsRuntime;
using LogicaSiscon.Almacenes.Salidas;

namespace LogicaSiscon.Almacenes.Transacciones
{
    public class Transaccion : AccesoDatos
    {
        
        public int ID_transaccion { get; set; }
        public DateTime Fecha { get; set; }
        public int tipo_transaccion_ID { get; set; } // -- 1: Ingreso, 2: Salida, 3: Traspaso
        public int Nro_Orden_Origen { get; set; }// --de la compra realizada si es origen, si es egreso la solicitud de material
        public int Almacen_Origen { get; set; } // -- 0.. si es ingreso al principal
        public int Almacen_Destino { get; set; }
        public int Recibe_Material { get; set; } // -- ID del contratista que recibe si es una salida
        public string Descripcion { get; set; }
        public decimal Importe_Total { get; set; }
        public int estado { get; set; }
        public int sec { get; set; }
        public DateTime fecha_creacion { get; set; }
        public int usr_alta { get; set; }
        public DateTime? fecha_desh { get; set; }
        public int id_empresa { get; set; }

        public List<DetalleTransaccion> Detalle { get; set; }

        public int Resultado { get; set; }

        public Transaccion(int ID_Empresa = 1)
        {
            ID_transaccion = 0;
            Fecha = DateTime.Now;
            tipo_transaccion_ID = 0;
            Nro_Orden_Origen = 0;
            Almacen_Origen = 0;
            Almacen_Destino = 0;
            Recibe_Material = 0;
            Importe_Total = 0;
            Descripcion = "";
            estado = 0;
            sec = 0;
            fecha_creacion = DateTime.Now;
            usr_alta = 0;
            fecha_desh = null;
            id_empresa = ID_Empresa;

            Detalle = new List<DetalleTransaccion>();
        }

        #region Metodos

        public void AgregarItem(int almacen_ID, int producto_ID, int unidad_ID, decimal cantidad, decimal precio_unitario)
        {
            if (Detalle.Exists(det => det.Producto_ID == producto_ID))
            {
                throw new ArgumentException("El item ya existe en la transaccion");
            }
            
            DetalleTransaccion item = new DetalleTransaccion(producto_ID,unidad_ID, cantidad, precio_unitario);
            Detalle.Add(item);
        }

        public void AgregarItem(int almacen_ID, int producto_ID,string producto_Nombre, int unidad_ID, string unidad_nombre, decimal cantidad, decimal precio_unitario)
        {
            
            if (Detalle.Exists(det => det.Producto_ID == producto_ID))
            {
                throw new ArgumentException("El item ya existe en la transaccion");
            }

            DetalleTransaccion item = new DetalleTransaccion( producto_ID, producto_Nombre, unidad_ID, unidad_nombre, cantidad, precio_unitario, id_empresa);
            Detalle.Add(item);
        }

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

        //    bool RegistroModificado = false;


        //    if (ID_transaccion != 0)
        //    {
        //        sec = (int)EjecutarEscalar("Select sec from Transaccion where ID_transaccion = " + ID_transaccion + " and id_empresa = "+id_empresa+"");
        //    }

        //    lStb.Append("update Transaccion set ");
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
                Conectar();
                EjecutarProceso(Registro);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }
            finally { Cerrar();  }


            return Resultado;
        }


        private int Registro()
        {
            StringBuilder lStb = new StringBuilder();

            if (Detalle.Count <= 0)
                throw new ArgumentException("El Detalle de la transaccion no puede ir vacio.");

            if (ID_transaccion == 0)
            {
                ID_transaccion = (int)EjecutarEscalar("Select isnull(max(ID_transaccion),0) + 1 from Transaccion where id_empresa = " + id_empresa + "");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from Transaccion where ID_transaccion = " + ID_transaccion + " and id_empresa = " + id_empresa + " ") + 1;
            }

            lStb.Append(" INSERT INTO transaccion (ID_transaccion, Fecha, tipo_transaccion_ID, Nro_Orden_Origen, Almacen_Origen, Almacen_Destino, Recibe_Material, Descripcion, Importe_Total, estado, sec, fecha_creacion, usr_alta, fecha_desh, id_empresa)");
            lStb.Append(" VALUES (@id_transaccion, @fecha, @tipo_transaccion_id, @nro_orden_origen, @almacen_origen, @almacen_destino, @recibe_material, @descripcion, @importe_total, @estado, @sec, @fecha_creacion, @usr_alta, @fecha_desh, @id_empresa) ");

            parametros = new List<Item>() { };

            parametros.Add(new Item() { nombre= "@id_transaccion", tipodato= Item.TIPODATO.Int, valor = ID_transaccion });
            parametros.Add(new Item() { nombre = "@fecha", tipodato = Item.TIPODATO.DateTime, valor = DateTime.Now });
            parametros.Add(new Item() { nombre = "@tipo_transaccion_id", tipodato = Item.TIPODATO.Int, valor = tipo_transaccion_ID });
            parametros.Add(new Item() { nombre = "@nro_orden_origen", tipodato = Item.TIPODATO.Int, valor = Nro_Orden_Origen });
            parametros.Add(new Item() { nombre = "@almacen_origen", tipodato = Item.TIPODATO.Int, valor = Almacen_Origen });
            parametros.Add(new Item() { nombre = "@almacen_destino", tipodato = Item.TIPODATO.Int, valor = Almacen_Destino });
            parametros.Add(new Item() { nombre = "@recibe_material", tipodato = Item.TIPODATO.Int, valor = Recibe_Material });
            parametros.Add(new Item() { nombre = "@descripcion", tipodato = Item.TIPODATO.VarChar, valor = Descripcion, longitud=200 });
            parametros.Add(new Item() { nombre = "@importe_total", tipodato = Item.TIPODATO.Decimal, valor = Importe_Total, longitud=10, cantidad_decimal=2 });
            parametros.Add(new Item() { nombre = "@estado", tipodato = Item.TIPODATO.Int, valor = estado });
            parametros.Add(new Item() { nombre = "@sec", tipodato = Item.TIPODATO.Int, valor = sec });
            parametros.Add(new Item() { nombre = "@fecha_creacion", tipodato = Item.TIPODATO.DateTime, valor = DateTime.Now });
            parametros.Add(new Item() { nombre = "@usr_alta", tipodato = Item.TIPODATO.Int, valor = usr_alta });
            parametros.Add(new Item() { nombre = "@fecha_desh", tipodato = Item.TIPODATO.DateTime, valor = DBNull.Value });
            parametros.Add(new Item() { nombre = "@id_empresa", tipodato = Item.TIPODATO.Int, valor = id_empresa });

            Resultado = EjecutarInsert(lStb.ToString());

            if (Resultado > 0)
            {
                lStb.Clear();

                foreach (var detalle in Detalle)
                {
                    lStb.Clear();

                    lStb.Append("INSERT INTO transaccion_Detalle (Transaccion_ID, Producto_ID, Unidad_ID, cantidad, precio_unitario, costo_total, id_empresa)");
                    lStb.Append(" VALUES (@transaccion_id, @producto_id, @unidad_id, @cantidad, @precio_unitario, @costo_total, @id_empresa)");

                    parametros = new List<Item>() { };                    
                    parametros.Add(new Item() { nombre = "@transaccion_id", tipodato = Item.TIPODATO.Int, valor = ID_transaccion });                    
                    parametros.Add(new Item() { nombre = "@producto_id", tipodato = Item.TIPODATO.Int, valor = detalle.Producto_ID });
                    parametros.Add(new Item() { nombre = "@unidad_id", tipodato = Item.TIPODATO.Int, valor = detalle.Unidad_ID });
                    parametros.Add(new Item() { nombre = "@cantidad", tipodato = Item.TIPODATO.Decimal, valor = detalle.cantidad, longitud=10, cantidad_decimal=2 });
                    parametros.Add(new Item() { nombre = "@precio_unitario", tipodato = Item.TIPODATO.Decimal, valor = detalle.precio_unitario, longitud=10, cantidad_decimal= 2 });
                    parametros.Add(new Item() { nombre = "@costo_total", tipodato = Item.TIPODATO.Decimal, valor = detalle.costo_total, longitud=10, cantidad_decimal=2 });
                    parametros.Add(new Item() { nombre = "@id_empresa", tipodato = Item.TIPODATO.Int, valor = detalle.ID_Empresa });

                    Resultado = EjecutarInsert(lStb.ToString());                    
                }
            }
            else
                throw new Exception("Error al registrar la transacción. ");

            return Resultado;
        }

        public List<SolicitudSalidaMaterialesDto> ObtenerSolicitudesPendientes(int encargado)
        {
            SalidaAlmacen _salida = new SalidaAlmacen();

            return _salida.ObtenerSolicitudesPendientes(encargado, id_empresa);
        }

        #endregion
    }
}
