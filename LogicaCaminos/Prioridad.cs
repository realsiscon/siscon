using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;


namespace LogicaSiscon
{
    [Serializable]
    public class Prioridad : AccesoDatos
    {
        public int Id_Prioridad { get; set; }
        public string Desc_Prioridad { get; set; }

        
        public List<Prioridad> CargarPrioridad()
        {
            List<Prioridad> lstPrioridad = new List<Prioridad>();
            DataSet dsDatos = new DataSet();
            dsDatos = EjecutarConsulta("select ID_Prioridad, Descripcion from prioridad where estado = 0 ");

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow item in dsDatos.Tables[0].Rows)
                {
                    Prioridad p = new Prioridad()
                    {
                        Id_Prioridad = Convert.ToInt32(item["ID_Prioridad"]),
                        Desc_Prioridad = Convert.ToString(item["Descripcion"])
                    };

                    lstPrioridad.Add(p);
                }
            }
            else
            {
                lstPrioridad = null;
                MensajeError = "Error al Cargar los Proyectos";
            }

            return lstPrioridad;
        }
    }
}
