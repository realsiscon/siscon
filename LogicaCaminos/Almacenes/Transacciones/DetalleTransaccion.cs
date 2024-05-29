using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Almacenes.Transacciones
{
    public class DetalleTransaccion
    {
        public int ID_Detalle { get; private set; }
        public int Transaccion_ID { get; set; }
        public int Producto_ID { get; set; }
        public string Producto_Nombre { get; set; }
        public int Unidad_ID { get; set; }
        public string Unidad_Nombre { get; set; }
        public decimal cantidad { get; set; }
        public decimal precio_unitario { get; set; }
        public decimal costo_total { get; set; }
        public int ID_Empresa { get; set; }

        public DetalleTransaccion()
        {
            ID_Detalle = 0;
            Transaccion_ID = 0;
            Producto_ID = 0;
            Unidad_ID = 0;
            cantidad = 0;
            precio_unitario = 0;
            costo_total = 0;
            ID_Empresa = 0;
        }

        public DetalleTransaccion(int producto_ID, int unidad_ID, decimal cantidad, decimal precio_unitario)
        {            
            Producto_ID = producto_ID;
            Unidad_ID = unidad_ID;
            this.cantidad = cantidad;
            this.precio_unitario = precio_unitario;
            this.costo_total = this.cantidad * this.precio_unitario;
        }

        public DetalleTransaccion(int producto_ID, string producto_Nombre, int unidad_ID, string unidad_nombre, decimal cantidad, decimal precio_unitario, int id_empresa)
        {            
            Producto_ID = producto_ID;
            Producto_Nombre = producto_Nombre;
            Unidad_ID = unidad_ID;
            Unidad_Nombre = unidad_nombre;
            this.cantidad = cantidad;
            this.precio_unitario = precio_unitario;
            this.costo_total = this.cantidad * this.precio_unitario;
            ID_Empresa = id_empresa;
        }


    }
}
