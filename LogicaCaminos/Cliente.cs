using Datos;
using LogicaSiscon.Dto;
using LogicaSiscon.Utilitarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaSiscon
{
    public class Cliente : AccesoDatos
    {

        #region Propiedades

        public int id_cliente { get; set; }
        public string Nombre_cliente { get; set; }
        public short tipo_persona { get; set; }
        public string Nro_Doc { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string mail { get; set; }
        public int estado { get; set; }
        public int sec { get; set; }
        public DateTime fecha_alta { get; set; }
        public int usr_alta { get; set; }
        public int id_empresa { get; set; }

        //------------
        public DataTable DtbDatos { get; set; }

        public int Resultado { get; set; }
        public List<ClienteDto> lsClientes { get; set; }
        
        #endregion

        #region constructor
        public Cliente(int IDEmpresa = 1)
        {
            id_cliente = 0;
            Nombre_cliente = "";
            tipo_persona = 0;
            Nro_Doc = "";
            direccion = "";
            telefono = "";
            mail = "";
            estado = 0;
            sec = 0;
            fecha_alta = DateTime.Now;
            usr_alta = 0;
            id_empresa = IDEmpresa;

        }
        #endregion

        #region Metodos

        public int ModificarRegistro()
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

            if (id_cliente != 0)
            {
                sec = (int)EjecutarEscalar("Select max(sec) from Cliente where id_cliente = " + id_cliente + " and Id_empresa = "+ id_empresa +" ");
            }

            lStb.Append("update Cliente set ");
            lStb.Append(" estado = " + (int)Enums.EstadoActivo.Inactivo + " ");
           
            lStb.Append(" where id_cliente = " + id_cliente + " and sec = " + sec + " ");

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

            if (id_cliente == 0)
            {
                id_cliente = (int)EjecutarEscalar("Select isnull(max(id_cliente),0) + 1 from Cliente where id_empresa = "+ id_empresa +"");
                sec = 1;
            }
            else
            {
                sec = (int)EjecutarEscalar("Select max(sec) from Cliente where id_cliente = " + id_cliente + " and id_empresa = "+ id_empresa +" ") + 1;
            }

            lStb.Append(" INSERT INTO cliente (id_cliente, Nombre_cliente, tipo_persona, Nro_Doc, direccion, telefono, mail, estado, sec, fecha_alta, usr_alta, id_empresa) VALUES ");
            lStb.Append(" ("+id_cliente+", '"+ Nombre_cliente +"', "+ tipo_persona +", '"+ Nro_Doc +"', '"+ direccion +"', '"+ telefono +"', '"+ mail +"', "+(int)Enums.EstadoActivo.Activo+", "+sec+", getdate(), "+ usr_alta +", "+ id_empresa +") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }


        public DataTable Obtener()
        {
            string sSQL = "select cl.id_cliente, cl.Nombre_cliente,cl.tipo_persona,cl.Nro_Doc,cl.direccion,cl.telefono,cl.mail,cl.estado,cl.id_empresa, case estado when  1 then 'Habilitado' else 'Deshabilitado' end descEstado, " +
                          " case cl.Tipo_Persona when 1 then 'Persona Natural' else 'Persona Juridica'  end descTipoPesona " + 
                                 " from cliente cl " +
                                 " where cl.estado = "+ (int)Enums.EstadoActivo.Activo + " and cl.id_empresa = "+ id_empresa +" ";

            DataSet dsDatos = EjecutarConsulta(sSQL.ToString());

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                DtbDatos = dsDatos.Tables[0];
                lsClientes = DtbDatos.ToList<ClienteDto>();
            }
            else
            {
                DtbDatos = null;
                MensajeError = "Error al Cargar los datos";
                lsClientes = null;
            }

            return DtbDatos;
        }


        #endregion
    }
}
