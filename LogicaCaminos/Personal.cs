using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using LogicaSiscon.Utilitarios;
using LogicaSiscon.Dto.Reportes;
using LogicaSiscon.Dto;


namespace LogicaSiscon
{
    [Serializable]
    public class Personal : AccesoDatos
    {
        #region Propiedades
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
        public DateTime Fecha_Nac { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public int ID_Empresa { get; set; }

        public string descEstado { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }

        public List<PersonalDto> lstPersonal { get; set; }
        #endregion

        #region Constructor
        public Personal(int iD_Empresa = 1)
        {
            ID_Personal = 0;
            Nombres = "";
            Ap_Paterno = "";
            Ap_Materno = "";
            Direccion = "";
            Tel_Fijo = "";
            Tel_Movil = "";
            Mail = "";
            ID_Cargo = 0;
            ID_Area = 0;
            Fecha_Nac = DateTime.Now;
            Estado = 0;
            Secuencia = 0;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = DateTime.Now;
            usr_desh = 0;
            Motivo_Desh = "";
            descEstado = "";
            dtDatos = new DataTable();
            ID_Empresa = iD_Empresa;
        }
        #endregion

        #region Metodos

        public int ModificarPersonal()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(ModificarRegistro_);                
                if (Resultado > 0)
                    Resultado = 0;

            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int ModificarRegistro_()
        {
            StringBuilder lStb = new StringBuilder();
            bool RegistroModificado = false;

            if (ID_Personal != 0)
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Personal where ID_Personal = " + ID_Personal + " and id_empresa = "+ ID_Empresa + " ");
            }

            lStb.Append("update Personal set ");
            lStb.Append(" fecha_desh=getdate(), usr_desh = "+ usr_desh +" ,estado = "+ (int)Enums.EstadoActivo.Inactivo +" ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where ID_Personal = " + ID_Personal + " and Secuencia = " + Secuencia + " and id_empresa =  " + ID_Empresa +" ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                if (RegistroModificado)
                {
                    Secuencia += 1;
                    lStb.Clear();
                    lStb.Append("INSERT INTO Personal (ID_Personal, Nombres, Ap_Paterno, Ap_Materno, Direccion, Tel_Fijo, Tel_Movil, Mail, ID_Cargo, ID_Area, Fecha_Nac, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) ");
                    lStb.Append(" VALUES (@id_personal, @nombres, @ap_paterno, @ap_materno, @direccion, @tel_fijo, @tel_movil, @mail, @id_cargo, @id_area, @fecha_nac, @estado, @secuencia, getdate(), null, null, null, @id_empresa) ");

                    parametros = new List<Datos.Item>() { };                    
                    parametros.Add(new Datos.Item() { nombre = "@id_personal", tipodato = Item.TIPODATO.Int, valor = ID_Personal });                    
                    parametros.Add(new Datos.Item() { nombre = "@nombres", tipodato = Item.TIPODATO.VarChar, valor = Nombres, longitud = 50  });
                    parametros.Add(new Datos.Item() { nombre = "@ap_paterno", tipodato = Item.TIPODATO.VarChar, valor = Ap_Paterno, longitud = 50 });
                    parametros.Add(new Datos.Item() { nombre = "@ap_materno", tipodato = Item.TIPODATO.VarChar, valor = Ap_Materno, longitud = 50 });
                    parametros.Add(new Datos.Item() { nombre = "@direccion", tipodato = Item.TIPODATO.VarChar, valor = Direccion, longitud = 100 });
                    parametros.Add(new Datos.Item() { nombre = "@tel_fijo", tipodato = Item.TIPODATO.VarChar, valor = Tel_Fijo, longitud = 15 });
                    parametros.Add(new Datos.Item() { nombre = "@tel_movil", tipodato = Item.TIPODATO.VarChar, valor = Tel_Movil, longitud = 15 });
                    parametros.Add(new Datos.Item() { nombre = "@mail", tipodato = Item.TIPODATO.VarChar, valor = Mail, longitud = 50 });
                    parametros.Add(new Datos.Item() { nombre = "@id_cargo", tipodato = Item.TIPODATO.Int, valor = ID_Cargo });
                    parametros.Add(new Datos.Item() { nombre = "@id_area", tipodato = Item.TIPODATO.Int, valor = ID_Area });
                    parametros.Add(new Datos.Item() { nombre = "@fecha_nac", tipodato = Item.TIPODATO.DateTime, valor = Convert.ToDateTime(Fecha_Nac).ToString("yyyyMMdd")  });
                    parametros.Add(new Datos.Item() { nombre = "@estado", tipodato = Item.TIPODATO.Int, valor = Estado });
                    parametros.Add(new Datos.Item() { nombre = "@secuencia", tipodato = Item.TIPODATO.Int, valor = Secuencia });                   ;
                    parametros.Add(new Datos.Item() { nombre = "@id_empresa", tipodato = Item.TIPODATO.Int, valor = ID_Empresa });

                    Resultado = EjecutarScript_Txn(lStb.ToString());


                    if (Resultado > 0)
                        Resultado = 0;
                }
            }

            return Resultado;
        }

        public int Registrar()
        {
            Resultado = -10;

            try
            {
                EjecutarProceso(Registrar_);
                if (Resultado > 0)
                    Resultado = 0;
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
                Resultado = -1;
            }


            return Resultado;
        }

        private int Registrar_()
        {
            StringBuilder lStb = new StringBuilder();

            if (ID_Personal == 0)
            {
                ID_Personal = (int)EjecutarEscalar("Select isnull(max(ID_Personal),0) + 1 from Personal");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Personal where ID_Personal = " + ID_Personal + " ") + 1;
            }

            lStb.Append("insert into Personal values(" + ID_Personal + ",'" + Nombres + "', '" + Ap_Paterno + "', '" + Ap_Materno + "', '" + Direccion + "','" + Tel_Fijo + "', ");
            lStb.Append(" '" + Tel_Movil + "','" + Mail + "'," + ID_Cargo + "," + ID_Area + ",'" + Fecha_Nac.ToString("yyyyMMdd") + "', "+ (int)Enums.EstadoActivo.Activo +", " + Secuencia + ", getdate(), null, null, null, "+ ID_Empresa +") ");


            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }
                
        public DataTable ObtenerPersonal()
        {           
            DataSet dsDatos;
            
            StringBuilder lStbProyectos = new System.Text.StringBuilder();
            lStbProyectos.Append("select p.ID_Personal, p.Nombres, p.Ap_Paterno, p.Ap_Materno, p.Direccion, p.Tel_Fijo, p.Tel_Movil, p.Mail, p.ID_Cargo, p.ID_Area, p.Fecha_Nac, p.Estado, ");
            lStbProyectos.Append(" isnull(p.Fecha_Desh,'') Fecha_Desh, isnull(p.usr_desh,'') usr_desh, isnull(p.Motivo_Desh,'') Motivo_Desh, p.id_empresa, ");
            lStbProyectos.Append(" (p.Nombres + ' ' + p.Ap_Paterno + ' ' + p.Ap_Materno) NombreCompleto, c.Descripcion Cargo, a.Descripcion Area,  ");
            lStbProyectos.Append(" case p.estado when "+ (int)Enums.EstadoActivo.Activo +" then 'Habilitado' else 'Deshabilitado'  end descEstado ");
            lStbProyectos.Append(" from Personal p ");
            lStbProyectos.Append("  inner join Cargo c on c.ID_cargo = p.ID_Cargo and c.estado = "+ (int)Enums.EstadoActivo.Activo +" ");
            lStbProyectos.Append("  inner join Area a on a.ID_Area = p.ID_Area and a.estado = "+ (int)Enums.EstadoActivo.Activo +" ");
            lStbProyectos.Append(" where p.estado = " + (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append(" and p.id_empresa = " + ID_Empresa + " ");


            dsDatos = EjecutarConsulta(lStbProyectos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                lstPersonal = dtDatos.ToList<PersonalDto>();
            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Cargar el Personal";
            }

            return dtDatos;
        }

        public DataTable ObtenerPersonal(int cargo)
        {
           
            DataSet dsDatos;

            StringBuilder lStbProyectos = new System.Text.StringBuilder();
            lStbProyectos.Append("select p.ID_Personal, p.Nombres, p.Ap_Paterno, p.Ap_Materno, p.Direccion, p.Tel_Fijo, p.Tel_Movil, p.Mail, p.ID_Cargo, p.ID_Area, p.Fecha_Nac, p.Estado, ");
            lStbProyectos.Append(" isnull(p.Fecha_Desh,'') Fecha_Desh, isnull(p.usr_desh,'') usr_desh, isnull(p.Motivo_Desh,'') Motivo_Desh, p.id_empresa, ");
            lStbProyectos.Append(" (p.Nombres + ' ' + p.Ap_Paterno + ' ' + p.Ap_Materno) NombreCompleto, c.Descripcion Cargo, a.Descripcion Area,  ");
            lStbProyectos.Append(" case p.estado when " + (int)Enums.EstadoActivo.Activo + " then 'Habilitado' else 'Deshabilitado'  end descEstado ");
            lStbProyectos.Append(" from Personal p ");
            lStbProyectos.Append(" inner join Cargo c on c.ID_cargo = p.ID_Cargo and c.estado = " + (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append(" inner join Area a on a.ID_Area = p.ID_Area and a.estado = " + (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append(" where p.estado = " + (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append(" and p.id_cargo = " + cargo + " ");
            lStbProyectos.Append(" and p.id_empresa = " + ID_Empresa + " ");


            dsDatos = EjecutarConsulta(lStbProyectos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                lstPersonal = dtDatos.ToList<PersonalDto>();
            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Cargar el Personal";
            }

            return dtDatos;
        }

        public List<PersonalRptDto> ObtenerPersonal_rpt(int Id_Empresa)
        {
            List<PersonalRptDto> objLista = new List<PersonalRptDto>();

            string sSQL =   "select  p.ID_Personal, p.Nombres, p.Ap_Paterno, p.Ap_Materno, p.Direccion,p.Tel_Fijo,p.Tel_Movil,p.Mail,p.ID_Cargo, c.Descripcion Cargo_Descripcion ,p.ID_Area, " +
                            " a.Descripcion Area_Descripcion,p.Fecha_Nac,p.Estado,p.Secuencia,p.Fecha_Registro, isnull(p.Fecha_Desh,'') Fecha_Desh , isnull(p.usr_desh,'') usr_desh, isnull(p.Motivo_Desh,'') Motivo_Desh, p.id_empresa, e.nombre nombre_empresa " +
                            " from personal p "+
                            "   inner join empresa e on e.id_empresa = p.id_empresa and e.estado = " + (int)Enums.EstadoActivo.Activo +  "" +
                            "   inner join Cargo c on c.ID_cargo = p.ID_Cargo and c.Estado = " + (int)Enums.EstadoActivo.Activo +  " " +
                            "   inner join area  a on a.ID_Area = p.id_area and a.estado = " + (int)Enums.EstadoActivo.Activo +  " " +
                            " where p.estado = " + (int)Enums.EstadoActivo.Activo +  " and e.id_empresa = " + Id_Empresa + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)            
                objLista = dsDatos.Tables[0].ToList<PersonalRptDto>();            
            else                           
                MensajeError = "Error al Cargar los datos";            

            return objLista;

        }


        #endregion
    }
}
