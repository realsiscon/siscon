using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class IngresoAlmacenDto
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

    }
}
