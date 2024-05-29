using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class SolicitudesPendientesDto
    {
        public int Cod_Solicitud { get; set; }
        public int id_proyecto { get; set; }
        public string Nomb_Proyecto { get; set; }
        public int Cod_Persona { get; set; }
        public string Autorizador { get; set; }
        public int id_solicitante { get; set; }
        public string Solicitante { get; set; }
        public string Autorizo { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public string Descripcion { get; set; }

    }
}
