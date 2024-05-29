﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Dto
{
    public class PersonalDto
    {
        public int ID_Personal { get; set; }
        public string Nombres { get; set; }
        public string Ap_Paterno { get; set; }
        public string Ap_Materno { get; set; }
        public string Direccion { get; set; }
        public string Tel_Fijo { get; set; }
        public string Tel_Movil { get; set; }
        public string Mail { get; set; }
        public int ID_Cargo { get; set; }
        public int ID_Area { get; set; }
        public DateTime? Fecha_Nac { get; set; }
        public int Estado { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public int id_empresa { get; set; }
        public string NombreCompleto { get; set; }
        public string Cargo { get; set; }
        public string Area { get; set; }
        public string descEstado { get; set; }
    }

}
