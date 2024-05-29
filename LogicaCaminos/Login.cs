using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using System.Data;
using LogicaSiscon.Utilitarios;

namespace LogicaSiscon
{
    public class Login: AccesoDatos
    {
        private static log4net.ILog log { get; set; } = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #region Propiedades

        public string UsrLogin { get; set; }
        public string UsrPassword { get; set; }

        public bool esUsuario { get; set; }

        public int ID_Personal { get; set; }
        public string Nombres { get; set; }
        public string Ap_Paterno { get; set; }
        public string Ap_Materno { get; set; }
        public string Direccion { get; set; }
        public string Tel_Fijo { get; set; }
        public string Tel_Movil { get; set; }
        public string Mail { get; set; }
        public string Cargo { get; set; }
        public string Area { get; set; }
        public int Cod_Usuario { get; set; }
        public int Id_Empresa { get; set; }
        public string nomb_empresa { get; set; }
        public DataSet dsMenu { get; set; }
        #endregion

        #region Metodos - Login

        public Login InicioLogin()
        {
           
            DataSet dsDatos;

            StringBuilder lStbSQL = new StringBuilder();
            lStbSQL.Append("select p.ID_Personal,p.Nombres, p.Ap_Paterno,p.Ap_Materno,p.Direccion,p.Tel_Fijo,p.Tel_Movil,p.Mail,c.Descripcion cargo, a.Descripcion area,  u.cod_Usuario, e.id_empresa, e.nombre nomb_empresa  ");
            lStbSQL.Append("from usuario u ");
            lStbSQL.Append("inner join Personal p on p.ID_Personal= u.ID_Personal and p.Estado = "+ (int)Enums.EstadoActivo.Activo +" ");
            lStbSQL.Append("inner join Cargo c on c.ID_cargo = p.ID_Cargo and c.Estado = "+ (int)Enums.EstadoActivo.Activo +" ");
            lStbSQL.Append("inner join Area A on a.ID_Area = p.ID_Area and p.Estado = "+ (int)Enums.EstadoActivo.Activo + " ");
            lStbSQL.Append("inner join empresa e on e.id_empresa = p.id_empresa and e.estado = "+ (int)Enums.EstadoActivo.Activo + "  ");
            lStbSQL.Append("where u.login = '" + UsrLogin + "' and u.password = '"+ UsrPassword + "' and u.Estado = "+ (int)Enums.EstadoActivo.Activo + "");

            dsDatos = EjecutarConsulta(lStbSQL.ToString());

            if (dsDatos.Tables.Count > 0)
            {
                esUsuario = (dsDatos.Tables[0].Rows.Count > 0);
                if (esUsuario)
                {                   
                    DataRow fila = dsDatos.Tables[0].Rows[0];
                    Cod_Usuario = Convert.ToInt32(fila["cod_Usuario"]);
                    ID_Personal = Convert.ToInt32(fila["ID_Personal"]);
                    Nombres = Convert.ToString(fila["Nombres"]);
                    Ap_Paterno = Convert.ToString(fila["Ap_Paterno"]);
                    Ap_Materno = Convert.ToString(fila["Ap_Materno"]);
                    Direccion = Convert.ToString(fila["Direccion"]);
                    Tel_Fijo = Convert.ToString(fila["Tel_Fijo"]);
                    Tel_Movil = Convert.ToString(fila["Tel_Movil"]);
                    Mail = Convert.ToString(fila["Mail"]);
                    Cargo = Convert.ToString(fila["cargo"]);
                    Area = Convert.ToString(fila["area"]);                   
                    Id_Empresa = Convert.ToInt32(fila["id_empresa"]);
                    nomb_empresa = Convert.ToString(fila["nomb_empresa"]);

                    lStbSQL.Clear();

                    lStbSQL.Append("select m.idOpcion, m.textoOpcion, m.idOpcionPadre, m.pantalla, m.imagen1, m.imagen2, m.imagenOver, m.valido, m.mostrar, m.pantallaNueva  ");
                    lStbSQL.Append("from Usuario_Opcion o ");
                    lStbSQL.Append(" inner join OpcionesMenu m on m.idOpcion=o.idOpcion and m.valido = 1");
                    lStbSQL.Append(" inner join usuario u on u.cod_Usuario = o.cod_Usuario and u.estado = " + (int)Enums.EstadoActivo.Activo + " ");
                    lStbSQL.Append("where o.cod_Usuario = " + Cod_Usuario + "  ");

                    dsMenu = EjecutarConsulta(lStbSQL.ToString());
                }
                else
                {
                    log.Error("Error al iniciar Session, las credenciales no corresponden para el usuario "+ UsrLogin + "");
                    throw new ArgumentException("Las credenciales no pertenecen a un usuario valido del Sistema.");
                }
            }

            return this;

        }

        #endregion

    }
}
