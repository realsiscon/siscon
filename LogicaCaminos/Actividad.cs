using Datos;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon
{
    public class Actividad : AccesoDatos
    {
        #region Propiedades

        public int id_actividad { get; set; }
        public int id_Proyecto { get; set; }
        public string nombre_actividad { get; set; }
        public int sec_actividad { get; set; }
        public int estado_actividad { get; set; }
        public string descripcion { get; set; }
        public DateTime fecha_ini { get; set; }
        public DateTime fecha_fin { get; set; }
        public decimal? duracion { get; set; }
        public int id_grupo { get; set; }
        public int id_modulo { get; set; }
        public int contratista { get; set; }
        public decimal? precio_unitario { get; set; }
        public decimal? cantidad { get; set; }
        public decimal? precio_mano_obra { get; set; }
        public int forma_pago { get; set; }
        public decimal? costo_mano_obra { get; set; }
        public decimal? costo_material { get; set; }
        public decimal? costo_maquinaria { get; set; }
        public int unidad { get; set; }
        public int estado { get; set; }
        public int sec { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }
        public int id_empresa { get; set; }


        public DataTable DtbDatos { get; set; }

        public int Resultado { get; set; }
        #endregion

        #region constructor
        public Actividad(int IDEmpresa=1)
        {
            id_Proyecto = 0;
            nombre_actividad = "";
            sec_actividad = 0;
            estado_actividad = 0;
            descripcion = "";
            fecha_ini = DateTime.Now;
            fecha_fin = DateTime.Now;
            duracion = 0;
            id_grupo = 0;
            id_modulo = 0;
            contratista = 0;
            precio_unitario = 0;
            cantidad = 0;
            precio_mano_obra = 0;
            forma_pago = 0;
            costo_mano_obra = 0;
            costo_material = 0;
            costo_maquinaria = 0;
            unidad = 0;
            estado = 1;
            sec = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;
            id_empresa = IDEmpresa;
        }
        #endregion

        #region Metodos

        public int ModificarProyecto()
        {
            Resultado = 0;

            try
            {
                EjecutarProceso(Modificar_);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int Modificar_()
        {
            StringBuilder lStb = new StringBuilder();
            DataTable dtProyecto = new DataTable();
            bool RegistroModificado = false;

            DtbDatos = Obtener(id_actividad);

            if (id_actividad != 0)
            {
                sec = (int)EjecutarEscalar("Select sec from Actividad where id_actividad = " + id_actividad + " ");
            }

            lStb.Append("update proyecto set ");
            lStb.Append(" fecha_desh=getdate() ,estado = " + Enums.EstadoActivo.Inactivo + " ");
            //if (estado == (int)Enums.EstadoActivo.Inactivo)
            //    lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            //else
            //{
            //    lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
            //    RegistroModificado = true;
            //}


            lStb.Append(" where id_actividad = " + id_actividad + " and sec = " + sec + " ");

            Resultado = EjecutarScript(lStb.ToString());

            if (Resultado > 0)
            {
                if (RegistroModificado)
                {
                    Resultado = Registrar(); // Registro();

                    if (Resultado > 0)
                        Resultado = 0;
                }
            }

            return Resultado;
        }

        public int Registrar()
        {
            Resultado = 0;

            try
            {
                EjecutarProceso(Registro);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }


        private int Registro()
        {
            StringBuilder lStb = new StringBuilder();

            if (id_actividad == 0)
            {
                id_actividad = (int)EjecutarEscalar("Select isnull(max(id_actividad),0) + 1 from actividad");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from actividad where id_actividad = " + id_actividad + " ") + 1;
            }

            lStb.Append(" INSERT INTO actividad (id_actividad, id_Proyecto, nombre_actividad, sec_actividad, estado_actividad, descripcion, fecha_ini, fecha_fin, duracion, id_grupo, id_modulo, contratista, precio_unitario, cantidad, precio_mano_obra, forma_pago, costo_mano_obra, costo_material, costo_maquinaria, unidad, estado, sec, fecha_alta, usr_alta, id_empresa)");
            lStb.Append(" VALUES(" + id_actividad + ", " + id_Proyecto + ", '" + nombre_actividad + "', " + sec_actividad + ", " + estado_actividad + ", '" + descripcion + "', '" + fecha_ini.ToString("yyyyMMdd") + "', '" + fecha_fin.ToString("yyyyMMdd") + "', " + duracion + ", " + id_grupo + ", " + id_modulo + ", " + contratista + ", " + precio_unitario + ", " + cantidad + ", " + precio_mano_obra + ", " + forma_pago + ", " + costo_mano_obra + ", " + costo_material + ", " + costo_maquinaria + ", " + unidad + ", " + estado + ", " + sec + ", getdate(), " + usr_alta + ", " + id_empresa + " )" );

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }


        public DataTable Obtener(int IdProyecto = 0)
        {


            string sSQL = "select a.id_actividad,a.id_Proyecto,a.nombre_actividad,a.sec_actividad,a.estado_actividad,a.descripcion,a.fecha_ini,a.fecha_fin,a.duracion, " +
                                 " a.id_grupo,a.id_modulo,a.contratista,a.precio_unitario,a.cantidad,a.precio_mano_obra,a.forma_pago,a.costo_mano_obra,a.costo_material, " +
                                 " a.costo_maquinaria,a.unidad,a.estado,a.sec,a.fecha_alta,a.usr_alta,a.id_empresa ," +
                                 " p.Nomb_Proyecto, g.NombreGrupo, m.Nombremodulo, ct.Nombre_contratista " +
                                 "   from actividad a " +
                                 "      inner join proyecto p on p.ID_proyecto = a.id_Proyecto and p.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 "      inner join grupo g on g.id_grupo = a.id_grupo and g.estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 "      inner join modulo m on m.id_modulo = a.id_modulo and m.estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 "      inner join contratista ct on ct.id_contratista = a.contratista and ct.estado = " + (int)Enums.EstadoActivo.Activo + " " +
                                 "   where a.estado = "+ (int)Enums.EstadoActivo.Activo + "   and a.id_Proyecto = " + id_Proyecto + " " +
                                 "       and a.id_empresa = " + id_empresa + " " +
                                 " order by a.estado_actividad ";

            DataSet dsDatos  = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DtbDatos = dsDatos.Tables[0];               
            }
            else
            {
                DtbDatos = null;
                MensajeError = "Error al Cargar los datos";
            }

            return DtbDatos;
        }


        #endregion

    }
}
