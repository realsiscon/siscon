using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class SolicitudSalidaMaterialesDto
    {
        public int ID_Solicitud { get; set; }
        public int ID_proyecto { get; set; }
        public string Cod_proyecto { get; set; }
        public string Nomb_Proyecto { get; set; }
        public int id_solicitante { get; set; }
        public string Solicitante { get; set; }
        public int ID_Almacen { get;set; }
        public string Nombre_Almacen { get; set; }
        public int ID_encargado { get; set; }
        public string Encargado_Almacen { get; set; }
              
    }
}
