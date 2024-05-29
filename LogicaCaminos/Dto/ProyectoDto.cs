using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class ProyectoDto
    {
        public int ID_proyecto { get; set; }
        public string Cod_proyecto { get; set; }
        public string Nomb_Proyecto { get; set; }
        public string Ubicacion { get; set; }
        public int Id_cliente { get; set; }
        public string Nombre_cliente { get; set; }
        public int id_director { get; set; }
        public string Director_Obra { get; set; }
        public int id_fiscal { get; set; }
        public string Fiscal_Obra { get; set; }
        public int id_almacen { get; set; }
        public string Nombre_Almacen { get; set; }
        public int estado { get; set; }
        public string descEstado { get; set; }
        public string mail_director { get; set; }
    }
}
