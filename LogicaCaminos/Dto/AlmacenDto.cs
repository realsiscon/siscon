using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class AlmacenDto
    {
        public int id_Almacen { get; set; }
        public string Nombre_Almacen { get; set; }
        public int id_encargado { get; set; }
        public string Encargado_Almacen { get; set; }
        public string ubicacion { get; set; }
        public int es_principal { get; set; }
        public string telefono_1 { get; set; }
        public string telefono_2 { get; set; }
        public int id_empresa { get; set; }
        public int sec { get; set; }
        public int estado { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }
    }
}
