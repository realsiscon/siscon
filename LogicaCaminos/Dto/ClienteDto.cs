using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class ClienteDto
    {
        public int id_cliente { get; set; }
        public string Nombre_cliente { get; set; }
        public short tipo_persona { get; set; }
        public string Nro_Doc { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string mail { get; set; }
        public int estado { get; set; }       
        public int id_empresa { get; set; }
        public string descEstado { get; set; }
        public string descTipoPesona { get; set; }

    }
}
