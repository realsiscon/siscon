using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;

namespace LogicaSiscon
{
    public class Detalle_Solicitud : AccesoDatos
    {

        #region Propiedades

        public int ID_Solicitud { get; set; }
        public int Cod_Material { get; set; }
        public int Item { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Importe_Parcial { get; set; }
        public string Observaciones { get; set; }
        public int Estado { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }

        #endregion

        #region Metodos

        

        #endregion

    }
}
