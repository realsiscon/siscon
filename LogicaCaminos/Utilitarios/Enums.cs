using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon.Utilitarios
{
    public static class Enums
    {
         public enum  EstadoActivo
        {   
            Activo = 1,
            Inactivo = 0
        }

        public enum TipoTransaccion
        {
            Ingresos = 1,
            Salidas = 2,
            Traspaso = 3
        }

    }
}
