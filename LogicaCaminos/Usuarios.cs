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
    public class Usuarios : AccesoDatos
    {

        #region Propiedades
        public int cod_Usuario { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public int ID_Personal { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime Fecha_Desh { get; set; }
        public int usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public int Id_empresa { get; set; }


        public string descEstado { get; set; }
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }
        #endregion
        public List<UsuarioDto> lstUsuarios { get; set; }

        #region Constructor

        public Usuarios(int id_empresa=1)
        {
            cod_Usuario = 0;
            login = "";
            password = "";
            ID_Personal = 0;
            Estado = 0;
            Secuencia = 0;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = DateTime.Now;
            usr_desh = 0;
            Motivo_Desh = "";
            descEstado = "";
            dtDatos = new DataTable();
            Id_empresa = id_empresa;
        }

        #endregion

        #region Metodos

        public int ModificarRegistro()
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
           
            if (cod_Usuario != 0)
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Usuario where cod_Usuario = " + cod_Usuario + " and id_empresa = "+ Id_empresa +" ");
            }

            lStb.Append("update Usuario set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo +" ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where cod_Usuario = " + cod_Usuario + " and Secuencia = " + Secuencia + " and id_empresa = "+ Id_empresa +" ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                if (RegistroModificado)
                {
                    lStb.Clear();

                    if (password.Length == 0)
                    {
                        password = (string)EjecutarEscalar_Txn("Select password from Usuario where cod_Usuario = " + cod_Usuario + " and secuencia = " + Secuencia + " and id_empresa = "+ Id_empresa +" ");
                    }

                    Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Usuario where cod_Usuario = " + cod_Usuario + " and id_empresa = "+ Id_empresa +" ") + 1;


                    lStb.Append("INSERT INTO usuario (cod_Usuario, login, password, ID_Personal, Estado, Secuencia, Fecha_Registro, Fecha_Desh, usr_desh, Motivo_Desh, id_empresa) values ");                  
                    lStb.Append("(" + cod_Usuario + ",'" + login + "', '" + password + "', " + ID_Personal + ", "+ (int)Enums.EstadoActivo.Activo + ", " + Secuencia + ", getdate(), null, null, null, "+Id_empresa +") ");

                    Resultado = EjecutarScript_Txn(lStb.ToString());
                    
                    if (Resultado < 0)                        
                    {
                        Resultado = -1;
                        throw new Exception("Error al Modificar los valores del Usuario");
                    }
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

            if (cod_Usuario == 0)
            {
                cod_Usuario = (int)EjecutarEscalar("Select isnull(max(cod_Usuario),0) + 1 from Usuario");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Usuario where cod_Usuario = " + cod_Usuario + " ") + 1;
            }

            lStb.Append("insert into Usuario values(" + cod_Usuario + ",'" + login + "', '" + password + "', " + ID_Personal + ","+ (int)Enums.EstadoActivo.Activo + ", " + Secuencia + ", getdate(), null, null, null, "+ Id_empresa +") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        public DataTable ObtenerUsuarios()
        {
            DataSet dsDatos;

            StringBuilder lStbProyectos = new System.Text.StringBuilder();
            lStbProyectos.Append("select  u.cod_usuario, u.login, u.password, u.id_personal, u.estado, u.secuencia ");
            lStbProyectos.Append(" , p.Nombres + ' ' + p.Ap_Paterno + ' ' + p.Ap_Materno NombreCompleto, ");
            lStbProyectos.Append(" case u.estado when "+ (int)Enums.EstadoActivo.Activo + " then 'Habilitado' else 'Deshabilitado'  end descEstado ");
            lStbProyectos.Append(" from usuario u ");
            lStbProyectos.Append(" inner join Personal p on p.ID_Personal = u.ID_Personal and p.Estado = "+ (int)Enums.EstadoActivo.Activo + " and p.id_empresa = "+ Id_empresa +"");
            lStbProyectos.Append(" where u.Estado = "+ (int)Enums.EstadoActivo.Activo + " ");
            lStbProyectos.Append("   and u.id_empresa = "+ Id_empresa +"");

            dsDatos = EjecutarConsulta(lStbProyectos.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];
                lstUsuarios = dtDatos.ToList<UsuarioDto>();
            }
            else
            {
                dtDatos = null;
                MensajeError = "Error al Cargar los Usuarios";
            }

            return dtDatos;
        }


        #endregion
    }
}
