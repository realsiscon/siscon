using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.Common;

namespace Datos
{
    [Serializable]
    public class AccesoDatos
    {
        #region Propiedades Privadas

        private IDbConnection Conexion;
        private IDbTransaction Transaccion;

        //private IDbCommand Comando;
        private SqlCommand Comando;


        private string CadenaConexion;

        public bool esTransaccional = false;

        public List<Item> parametros { get; set; }

        #endregion


        #region Propiedades Publicas

        public string MensajeError { get; set; }

        #endregion


        #region Metodos

        public bool Conectar()
        {
            CadenaConexion = ConfigurationManager.AppSettings["Cnx"];

            if (Conexion == null)
                Conexion = new SqlConnection(CadenaConexion);

            if (string.IsNullOrEmpty(Conexion.ConnectionString))
                Conexion.ConnectionString = CadenaConexion;


            if (Conexion.State != ConnectionState.Open)
            {
                Conexion.Open();
            }

            return Conexion.State == ConnectionState.Open;
        }

        public void Cerrar()
        {
            if (Conexion != null)
                if (Conexion.State == ConnectionState.Open)
                {
                    Conexion.Close();
                    Conexion.Dispose();
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                }

        }


        public void IniciarTransaccion()
        {
            Transaccion = Conexion.BeginTransaction();
            esTransaccional = true;
        }

        public void ConfirmarTransaccion()
        {
            if (esTransaccional)
                Transaccion.Commit();
        }

        public void DeshacerTransaccion()
        {
            if (esTransaccional)
                Transaccion.Rollback();
        }
        #endregion

        #region Metodos Sp

        public DataSet ProcedimientoADataSet(string nombre_sp)
        {
            DataSet dsDatos = new DataSet();
            Comando = new SqlCommand();
            IDbDataAdapter Adapter = new SqlDataAdapter();

            try
            {
                Comando.Connection = (SqlConnection)Conexion;
                Comando.CommandText = nombre_sp;
                Comando.CommandType = CommandType.StoredProcedure;
                Comando.CommandTimeout = 0;
                if (esTransaccional)
                    Comando.Transaction = (SqlTransaction)Transaccion;

                Adapter.InsertCommand = Comando;

                Adapter.Fill(dsDatos);
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
            }

            return dsDatos;
        }

        #endregion


        #region Ejecutar Procesos

        //public delegate int DelegadoTransaccional(string nombresp);
        public delegate int DelegadoTransaccional();
        //public void EjecutarTransaccion(DelegadoTransaccional Transaccion, string nombresp)
        public void EjecutarTransaccion(DelegadoTransaccional Transaccion)
        {
            //resultado = new Resultado();
            try
            {
                Conectar();
                IniciarTransaccion();
                //Transaccion(nombresp);
                Transaccion();
                ConfirmarTransaccion();
            }
            catch (Exception ex)
            {
                DeshacerTransaccion();
                MensajeError = ex.Message;
            }
            finally
            {
                Cerrar();
            }
        }

        //protected delegate int ProcesoDelegado(string nombresp);
        //protected void EjecutarProceso(ProcesoDelegado Proceso, string nombresp)
        protected delegate int ProcesoDelegado();
        protected void EjecutarProceso(ProcesoDelegado Proceso)
        {
            try
            {
                Conectar();
                Proceso();
            }
            catch (Exception ex)
            {
                MensajeError = ex.Message;
            }
            finally
            {
                Cerrar();
            }
        }

        #endregion

        #region Metodos de Consulta

        public DataSet EjecutarConsulta(string consulta, string tipo = "SQL") //tipo =SQL, SP
        {
            Conectar();
            DataSet dsDatos = new DataSet();
            Comando = new SqlCommand();
            Comando.Connection = (SqlConnection)Conexion;
            Comando.CommandText = consulta;
            if (tipo == "SQL")
                Comando.CommandType = CommandType.Text;
            if (tipo == "SP")
                Comando.CommandType = CommandType.StoredProcedure;
            Comando.CommandTimeout = 0;
            if (esTransaccional)
                Comando.Transaction = (SqlTransaction)Transaccion;

            if (parametros != null && parametros.Count > 0)
                AdicionarParametros(parametros);

            IDbDataAdapter DataAdapter = new SqlDataAdapter(Comando);

            //DataAdapter.InsertCommand = Comando;

            DataAdapter.Fill(dsDatos);

            Cerrar();
            return dsDatos;
        }

        public object EjecutarEscalar(string pStrScript)
        {
            object objResultado;
            Conectar();
            Comando = new SqlCommand();
            Comando.Connection = (SqlConnection)Conexion;
            Comando.CommandText = pStrScript;
            Comando.CommandType = CommandType.Text;
            Comando.CommandTimeout = 0;
            if (esTransaccional)
                Comando.Transaction = (SqlTransaction)Transaccion;


            objResultado = Comando.ExecuteScalar();
            Cerrar();

            return objResultado;

        }

        public object EjecutarEscalar_Txn(string pStrScript)
        {
            object objResultado;
            //Conectar();
            Comando = new SqlCommand();
            Comando.Connection = (SqlConnection)Conexion;
            Comando.CommandText = pStrScript;
            Comando.CommandType = CommandType.Text;
            Comando.CommandTimeout = 0;
            if (esTransaccional)
                Comando.Transaction = (SqlTransaction)Transaccion;


            objResultado = Comando.ExecuteScalar();
            //Cerrar();

            return objResultado;

        }

        public int EjecutarScript(string pStrScript)
        {
            int Resultado = 0;
            if (esTransaccional)
                Comando.Transaction = (SqlTransaction)Transaccion;
            
                Conectar();
            Comando = new SqlCommand();
            Comando.Connection = (SqlConnection)Conexion;
            Comando.CommandText = pStrScript;
            Comando.CommandType = CommandType.Text;
            Comando.CommandTimeout = 0;

            if (Comando.Connection.State == ConnectionState.Closed)
                Comando.Connection.Open();

            if (parametros != null && parametros.Count > 0)
                AdicionarParametros(parametros);

            Resultado = Comando.ExecuteNonQuery();
            Cerrar();
            return Resultado;
        }

        public int EjecutarInsert(string pStrScript)
        {
            int Resultado = 0;
           

            if (esTransaccional)
                Comando.Transaction = (SqlTransaction)Transaccion;

            Conectar();
            Comando = new SqlCommand();
            Comando.Connection = (SqlConnection)Conexion;
            Comando.CommandText = pStrScript;
            Comando.CommandType = CommandType.Text;
            Comando.CommandTimeout = 0;

            if (Comando.Connection.State == ConnectionState.Closed)
                Comando.Connection.Open();

            if (parametros != null && parametros.Count > 0)
                AdicionarParametros(parametros);

            Resultado = Comando.ExecuteNonQuery();
            

            Cerrar();
            return Resultado;
        }


        public int EjecutarScript_Txn(string pStrScript)
        {
            int Resultado = -1;
            try
            {
                Comando = new SqlCommand();
                Comando.Connection = (SqlConnection)Conexion;
                Comando.CommandText = pStrScript;
                Comando.CommandType = CommandType.Text;
                Comando.CommandTimeout = 0;

                if (esTransaccional)
                    Comando.Transaction = (SqlTransaction)Transaccion;

                if (parametros != null && parametros.Count > 0)
                    AdicionarParametros(parametros);

                Resultado = Comando.ExecuteNonQuery();
                if (Resultado >= 0)
                    Resultado = 0;

            }
            catch (Exception ex)
            {
                this.MensajeError = ex.ToString();
            }

            return Resultado;
        }
        #endregion

        #region "Parametros"
        private int AdicionarParametros(List<Item> parametros, bool usareturn = true)
        {
            Comando.Parameters.Clear(); // eliminamos los parametros anteriores en caso de que existan.
            int cantidad = 0;
            foreach (Item par in parametros)
            {
                if (par.direccion == Item.RETUNRVALUE)
                {
                    Comando.Parameters.Add(par.nombre, SqlDbType.Int);
                }
                else
                {
                    if (par.direccion == Item.INPUTOUTPUT)
                    {
                        if ((par.tipodato == Item.TIPODATO.Decimal) && "".Equals(par.valor))
                            par.valor = 0.0;
                        SqlParameter sqlpar = new SqlParameter();
                        sqlpar.ParameterName = par.nombre;
                        sqlpar.SqlDbType = (SqlDbType)par.tipodato;
                        if ((new List<Item.TIPODATO>
                                {Item.TIPODATO.VarChar, Item.TIPODATO.NVarChar, Item.TIPODATO.Text, Item.TIPODATO.Xml})
                            .Contains(par.tipodato))
                        {
                            sqlpar.Size = par.longitud;
                        }
                        else
                        {
                            sqlpar.Precision = (byte)par.longitud;
                            sqlpar.Scale = (byte)par.cantidad_decimal;
                        }

                        sqlpar.Value = par.valor; // Convert.ToDecimal((string)par.valor);
                        Comando.Parameters.Add(sqlpar);
                    }
                    else
                    {
                        if (par.direccion == Item.OUTPUT)
                        {
                            if (par.tipodato == Item.TIPODATO.Decimal)
                            {
                                if ("".Equals(par.valor)) par.valor = 0.0;
                                SqlParameter sqlpar = new SqlParameter();
                                sqlpar.ParameterName = par.nombre;
                                sqlpar.SqlDbType = (SqlDbType)par.tipodato;
                                sqlpar.Precision = (byte)par.longitud;
                                sqlpar.Scale = (byte)par.cantidad_decimal;

                                sqlpar.Value = par.valor;
                                Comando.Parameters.Add(sqlpar);
                            }
                            else
                                Comando.Parameters.Add(par.nombre, (SqlDbType)par.tipodato, par.longitud);
                        }
                        else
                        {
                            if (par.tipodato == Item.TIPODATO.Decimal)
                            {
                                if ("".Equals(par.valor)) par.valor = 0.0;
                                SqlParameter sqlpar = new SqlParameter();
                                sqlpar.ParameterName = par.nombre;
                                sqlpar.SqlDbType = (SqlDbType)par.tipodato;
                                sqlpar.Precision = (byte)par.longitud;
                                sqlpar.Scale = (byte)par.cantidad_decimal;

                                sqlpar.Value = par.valor;
                                Comando.Parameters.Add(sqlpar);
                            }
                            else
                            {
                                object value = par.valor;
                                if ("".Equals(par.valor) &&
                                    (par.tipodato == Item.TIPODATO.TinyInt || par.tipodato == Item.TIPODATO.SmallInt ||
                                     par.tipodato == Item.TIPODATO.Int || par.tipodato == Item.TIPODATO.BigInt))
                                    par.valor = 0;
                                switch (par.tipodato)
                                {
                                    case Item.TIPODATO.Int:
                                        value = (par.valor == System.DBNull.Value
                                            ? int.MinValue
                                            : Convert.ToInt32(par.valor));
                                        break;
                                    case Item.TIPODATO.SmallInt:
                                        value = (par.valor == System.DBNull.Value
                                            ? Int16.MinValue
                                            : Convert.ToInt16(par.valor));
                                        break;
                                }

                                if ((Item.TIPODATO.Int == par.tipodato && (Convert.ToInt32(value) == int.MinValue)) ||
                                    (Item.TIPODATO.SmallInt == par.tipodato &&
                                     (Convert.ToInt16(value) == Int16.MinValue)) ||
                                    (Item.TIPODATO.Decimal == par.tipodato &&
                                     (Convert.ToDecimal(value) == Decimal.MinValue))
                                //||(Item.TIPODATO.Date == par.tipodato && (value == ""))
                                )
                                {
                                    Comando.Parameters.AddWithValue(par.nombre, System.DBNull.Value);
                                }
                                else
                                {
                                    if (par.tipodato == Item.TIPODATO.Xml)
                                    {
                                        Comando.Parameters.Add(new SqlParameter(par.nombre, SqlDbType.Xml));
                                        Comando.Parameters[par.nombre].Value = value;
                                    }
                                    else
                                    {
                                        Comando.Parameters.AddWithValue(par.nombre, value);
                                    }
                                }
                            }
                        }
                    }
                }

                if (par.direccion == Item.OUTPUT)
                {
                    Comando.Parameters[par.nombre].Direction = ParameterDirection.Output;
                }
                else if (par.direccion == Item.INPUTOUTPUT)
                {
                    Comando.Parameters[par.nombre].Direction = ParameterDirection.InputOutput;
                }
                else if (par.direccion == Item.RETUNRVALUE)
                {
                    Comando.Parameters[par.nombre].Direction = ParameterDirection.ReturnValue;
                }
                cantidad++;
            }

            if (usareturn)
            {
                Comando.Parameters.Add("@Return", SqlDbType.Int);
                Comando.Parameters["@Return"].Direction = ParameterDirection.ReturnValue;
            }

            return cantidad;
        }

        #endregion
    }
}
