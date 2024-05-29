using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto;

namespace LogicaSiscon
{
    [Serializable]
    public class Proyecto : AccesoDatos
    {

        #region Propiedades

        public int ID_proyecto { get; set; }       
        public string Cod_proyecto { get; set; }
        public string Nomb_Proyecto { get; set; }
        public string Ubicacion { get; set; }
        public int Cliente { get; set; }
        public int Director_Obra { get; set; }
        public int Fiscal { get; set; }
        public int ID_Almacen { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public int ID_Empresa { get; set; }

        public string Nomb_Responsable { get; set; }
        public string Desc_Prioridad { get; set; }

        public DataTable DtbProyectos { get; set; }

        public int Resultado { get; set; }

        public List<ProyectoDto> lstProyecto { get; set; }

        #endregion

        #region Constructor

        public Proyecto(int id_empresa=0)
        {
            ID_proyecto = 0;
            Cod_proyecto = "";
            Nomb_Proyecto = "";
            Ubicacion = "";
            Cliente = 0;
            Director_Obra = 0;
            Fiscal = 0;
            ID_Almacen = 0;
            Estado = 1;
            Secuencia = 1;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = DateTime.Now;
            usr_desh = 0;
            Motivo_Desh = "";
            ID_Empresa = id_empresa;
        }

        #endregion

        #region Metodos

        public int ModificarProyecto()
        {
            Resultado = 0;

            try
            {
                EjecutarProceso(ModificarProyecto_);
                Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int ModificarProyecto_()
        {
            StringBuilder lStb = new StringBuilder();
            DataTable dtProyecto = new DataTable();
            bool RegistroModificado = false;

            dtProyecto = ObtenerProyectos(ID_proyecto);

            if (ID_proyecto != 0)
            {
                Secuencia = (int)EjecutarEscalar("Select max(Secuencia) from proyecto where Id_Proyecto = " + ID_proyecto + " and id_empresa = "+ ID_Empresa +" ");
            }

            lStb.Append("update proyecto set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo+" ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else 
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where Id_Proyecto = " + ID_proyecto + " and Secuencia = " + Secuencia + " and id_empresa = "+ ID_Empresa +"");

            Resultado = EjecutarScript(lStb.ToString());

            if (Resultado > 0)
            {
                if (RegistroModificado)
                {
                    Resultado = RegistrarProyecto(); // Registro();

                    if (Resultado > 0)
                        Resultado = 0;
                }
            }

            return Resultado;
        }

        public int RegistrarProyecto()
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

            if (ID_proyecto == 0)
            {
                ID_proyecto = (int)EjecutarEscalar("Select isnull(max(ID_proyecto),0) + 1 from proyecto");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar("Select max(Secuencia) from proyecto where Id_Proyecto = " + ID_proyecto + " ") + 1;
            }
            
            lStb.Append("INSERT INTO proyecto (ID_proyecto, Cod_proyecto, Nomb_Proyecto, Ubicacion, Id_cliente, Id_Director, Id_Fiscal, Id_Almacen, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) ");
            lStb.Append(" VALUES ("+ ID_proyecto + ", '"+ Cod_proyecto + "', '" + Nomb_Proyecto + "', '"+ Ubicacion +"', "+ Cliente +", "+ Director_Obra +", "+ Fiscal +", "+ ID_Almacen +", "+ (int)Enums.EstadoActivo.Activo + ", "+ Secuencia +", getdate(), null, null, null, "+ID_Empresa+")");
            
            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }


        public DataTable ObtenerProyectos(int IdProyecto = 0)
        {           
            DataSet dsDatos = new DataSet();

            StringBuilder lStbProyectos = new System.Text.StringBuilder();
            lStbProyectos.Append("Select p.ID_proyecto, p.Cod_proyecto, p.Nomb_Proyecto, p.Ubicacion,");
            lStbProyectos.Append(" p.Id_cliente, cli.Nombre_cliente, ");
            lStbProyectos.Append(" p.id_director , ");
            lStbProyectos.Append(" dir.Nombres + ' ' + dir.Ap_Paterno + ' ' + dir.Ap_Materno Director_Obra, ");
            lStbProyectos.Append(" p.id_fiscal, ");
            lStbProyectos.Append(" fis.Nombres + ' ' + fis.Ap_Paterno + ' ' + fis.Ap_Materno Fiscal_Obra , ");
            lStbProyectos.Append(" p.id_almacen, al.Nombre_Almacen, ");
            lStbProyectos.Append(" p.estado, ");
            lStbProyectos.Append(" case  p.estado when "+ (int)Enums.EstadoActivo.Activo +"  then 'Habilitado' when " + (int)Enums.EstadoActivo.Inactivo +" then 'Deshabilitado' end descEstado");
            lStbProyectos.Append(" , dir.mail mail_director ");
            lStbProyectos.Append(" from proyecto p ");
            lStbProyectos.Append(" inner join Personal dir on dir.ID_Personal = p.id_director and dir.estado = " + (int)Enums.EstadoActivo.Activo +"");
            lStbProyectos.Append(" inner join Personal fis on fis.ID_Personal = p.id_fiscal and fis.estado = " + (int)Enums.EstadoActivo.Activo +"");
            lStbProyectos.Append(" inner join cliente cli on cli.id_cliente = p.Id_cliente and cli.estado = " + (int)Enums.EstadoActivo.Activo + "");
            lStbProyectos.Append(" inner join Almacen al on al.id_almacen = p.Id_Almacen and al.estado = " + (int)Enums.EstadoActivo.Activo + "");
            lStbProyectos.Append(" where p.estado = "+ (int)Enums.EstadoActivo.Activo +" ");
            lStbProyectos.Append(" and p.id_empresa = "+ ID_Empresa +"");
            if (IdProyecto > 0)
                lStbProyectos.Append(" and p.ID_proyecto = " + IdProyecto + "");

            dsDatos = EjecutarConsulta(lStbProyectos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DtbProyectos = dsDatos.Tables[0];

                lstProyecto = DtbProyectos.ToList<ProyectoDto>();
            }
            else
            {
                DtbProyectos = null;
                MensajeError = "Error al Cargar los Proyectos";
            }

            return DtbProyectos;
        }


        #endregion

    }
}
