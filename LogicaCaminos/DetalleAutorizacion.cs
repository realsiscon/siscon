using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;

namespace LogicaSiscon
{
    public class DetalleAutorizacion
    {
        #region Propiedades

        public int Cod_Detalle_Autorizadores { get; set; }
        public int Cod_Autorizacion { get; set; }
        public int Secuencia { get; set; }
        public int Cod_Persona { get; set; }
        public int Estado { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }

        #endregion

    }
}
