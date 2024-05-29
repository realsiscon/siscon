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
    [Serializable]
    public class Material : AccesoDatos
    {
        public int ID_Proyecto { get; set; }    
        public int Cod_Material { get; set; }
        public string Nombre_Material { get; set; }
        public int Unidad { get; set; }
        public decimal? precio_unitario { get; set; }
        public int id_grupo { get; set; }
        public decimal? stock_minimo { get; set; }
        public decimal? Cant_presupuestada { get; set; }
        public int Estado { get; set; }
        public int Secuencia { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime? Fecha_Desh { get; set; }
        public int? usr_desh { get; set; }
        public string Motivo_Desh { get; set; }
        public int id_empresa { get; set; }


        public string descEstado { get; set; }
       
        public DataTable dtDatos { get; set; }
        private int Resultado { get; set; }

        public Material(int IdEmpresa)
        {
            ID_Proyecto = 0;
            Cod_Material = 0;
            Nombre_Material = "";
            Unidad = 0;
            precio_unitario = 0;
            id_grupo = 0;
            stock_minimo = 0;
            Cant_presupuestada = 0;
            Estado = 1;
            Secuencia = 0;
            Fecha_Registro = DateTime.Now;
            Fecha_Desh = null;
            usr_desh = 0;
            Motivo_Desh = "";
            id_empresa = IdEmpresa;

            //************************************
            descEstado = "";
            dtDatos = new DataTable();
        }

        #region Metodos

        public List<Material> CargarMaterial()
        {
            List<Material> lstMaterial = new List<Material>();

            string sSQL = "select m.id_proyecto, m.Cod_Material, m.Nombre_Material, m.Unidad, m.precio_unitario, m.id_grupo, m.stock_minimo, m.Cant_presupuestada, " +
                          " m.Estado, m.Secuencia, m.Fecha_Registro, m.Fecha_Desh, m.usr_desh, m.Motivo_Desh, m.id_empresa, " +
                          " case  m.estado when 1 then 'Habilitado' else 'Deshabilitado'  end descEstado," +
                          " u.Descripcion NombUnidad, g.NombreGrupo " +
                          " from Material m " +
                          "    inner join Unidad u on u.Cod_unidad = m.Unidad and u.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                          "    inner join grupo g on g.id_grupo = m.id_grupo and g.estado = " + (int)Enums.EstadoActivo.Activo + " " +
                          " where m.estado = " + (int)Enums.EstadoActivo.Activo + "" +
                          " and m.id_empresa = " + id_empresa + " ";

            if(ID_Proyecto>0)
                sSQL += " and m.id_proyecto = " + ID_Proyecto + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL);

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];

                foreach (DataRow item in dsDatos.Tables[0].Rows)
                {
                    Material p = new Material(id_empresa)
                    {
                        ID_Proyecto = Convert.ToInt32(item["id_proyecto"]),
                        Cod_Material = Convert.ToInt32(item["Cod_Material"]),
                        Nombre_Material = Convert.ToString(item["Nombre_Material"]),
                        Unidad = Convert.ToInt32(item["Unidad"]),
                        precio_unitario = Convert.ToInt32(item["precio_unitario"]),
                        id_grupo = Convert.ToInt32(item["id_grupo"]),
                        stock_minimo = Convert.ToInt32(item["stock_minimo"]),
                        Cant_presupuestada = Convert.ToInt32(item["Cant_presupuestada"]),
                        Estado = Convert.ToInt32(item["Estado"]),
                        Secuencia = Convert.ToInt32(item["Secuencia"]),
                        Fecha_Registro = Convert.ToDateTime(item["Fecha_Registro"]),
                        //Fecha_Desh = Convert.ToDateTime(item["Fecha_Desh"]),
                        //usr_desh = Convert.ToInt32(item["usr_desh"]),
                        //Motivo_Desh = Convert.ToString(item["Motivo_Desh"]),
                        id_empresa = Convert.ToInt32(item["id_empresa"]),

                        descEstado = Convert.ToString(item["descEstado"])
                    };

                    lstMaterial.Add(p);
                }
            }
            else
            {
                lstMaterial = null;
                MensajeError = "Error al Cargar los Materiales";
            }

            return lstMaterial;
        }

        public List<Material> MaterialesParaIngresos()
        {
            List<Material> lstMaterial = new List<Material>();

            string sSQL = "select m.id_proyecto, m.Cod_Material, m.Nombre_Material, m.Unidad, m.precio_unitario, m.id_grupo, m.stock_minimo, m.Cant_presupuestada, " +
                          " m.Estado, m.Secuencia, m.Fecha_Registro, m.Fecha_Desh, m.usr_desh, m.Motivo_Desh, m.id_empresa, " +
                          " case  m.estado when 1 then 'Habilitado' else 'Deshabilitado'  end descEstado," +
                          " u.Descripcion NombUnidad, g.NombreGrupo " +
                          " from Material m " +
                          "    inner join Unidad u on u.Cod_unidad = m.Unidad and u.Estado = " + (int)Enums.EstadoActivo.Activo + " " +
                          "    inner join grupo g on g.id_grupo = m.id_grupo and g.estado = " + (int)Enums.EstadoActivo.Activo + " " +
                          " where m.estado = " + (int)Enums.EstadoActivo.Activo + "" +
                          " and m.id_empresa = " + id_empresa + " ";

            DataSet dsDatos = EjecutarConsulta(sSQL);

            if (dsDatos.Tables[0].Rows.Count > 0)
            {
                dtDatos = dsDatos.Tables[0];

                foreach (DataRow item in dsDatos.Tables[0].Rows)
                {
                    Material p = new Material(id_empresa)
                    {
                        ID_Proyecto = Convert.ToInt32(item["id_proyecto"]),
                        Cod_Material = Convert.ToInt32(item["Cod_Material"]),
                        Nombre_Material = Convert.ToString(item["Nombre_Material"]),
                        Unidad = Convert.ToInt32(item["Unidad"]),
                        precio_unitario = Convert.ToInt32(item["precio_unitario"]),
                        id_grupo = Convert.ToInt32(item["id_grupo"]),
                        stock_minimo = Convert.ToInt32(item["stock_minimo"]),
                        Cant_presupuestada = Convert.ToInt32(item["Cant_presupuestada"]),
                        Estado = Convert.ToInt32(item["Estado"]),
                        Secuencia = Convert.ToInt32(item["Secuencia"]),
                        Fecha_Registro = Convert.ToDateTime(item["Fecha_Registro"]),
                        //Fecha_Desh = Convert.ToDateTime(item["Fecha_Desh"]),
                        //usr_desh = Convert.ToInt32(item["usr_desh"]),
                        //Motivo_Desh = Convert.ToString(item["Motivo_Desh"]),
                        id_empresa = Convert.ToInt32(item["id_empresa"]),

                        descEstado = Convert.ToString(item["descEstado"])
                    };

                    lstMaterial.Add(p);
                }
            }
            else
            {
                lstMaterial = null;
                MensajeError = "Error al Cargar los Materiales";
            }

            return lstMaterial;
        }

        public int ModificarRegistro()
        {
            Resultado = -10;

            try
            {
                EjecutarTransaccion(ModificarRegistro_);
                //EjecutarProceso(ModificarRegistro_);
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
            DataTable dtProyecto = new DataTable();
            bool RegistroModificado = false;

            //dtProyecto = ObtenerProyectos(ID_proyecto);

            if (Cod_Material != 0)
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select Secuencia from Material where Cod_Material = " + Cod_Material + " ");
            }

            lStb.Append("update Material set ");
            lStb.Append(" fecha_desh=getdate() ,estado = "+ (int)Enums.EstadoActivo.Inactivo +" ");
            if (Estado == (int)Enums.EstadoActivo.Inactivo)
                lStb.Append(" ,motivo_desh='" + Motivo_Desh + "'");
            else
            {
                lStb.Append(" ,motivo_desh='MODIFICACION DE DATOS POR USUARIO'");
                RegistroModificado = true;
            }


            lStb.Append(" where Cod_Material = " + Cod_Material + " and Secuencia = " + Secuencia + " ");

            Resultado = EjecutarScript_Txn(lStb.ToString());

            if (Resultado == 0)
            {
                if (RegistroModificado)
                {
                    //Resultado = Registrar(); // Registro();

                    Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Material where Cod_Material = " + Cod_Material + " ") + 1;


                    lStb.Append("insert into Material values("+ ID_Proyecto +", " + Cod_Material + ",'" + Nombre_Material + "', "+ Unidad +", "+ precio_unitario +", "+ id_grupo +", "+ stock_minimo +", "+ Cant_presupuestada +", ");
                    lStb.Append(" "+ (int)Enums.EstadoActivo.Activo +", " + Secuencia + ", getdate(), null, null, null, "+ id_empresa +") ");

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

            if (Cod_Material == 0)
            {
                Cod_Material = (int)EjecutarEscalar("Select isnull(max(Cod_Material),0) + 1 from Material");
                Secuencia = 1;
            }
            else
            {
                Secuencia = (int)EjecutarEscalar_Txn("Select max(Secuencia) from Material where Cod_Material = " + Cod_Material + " ") + 1;
            }

            lStb.Append("insert into Material values("+ ID_Proyecto +", " + Cod_Material + ",'" + Nombre_Material + "', " + Unidad + ", " + precio_unitario + ", " + id_grupo + ", " + stock_minimo + ", " + Cant_presupuestada + ", ");
            lStb.Append(" " + (int)Enums.EstadoActivo.Activo + ", " + Secuencia + ", getdate(), null, null, null, " + id_empresa + ") ");

            Resultado = EjecutarScript(lStb.ToString());

            return Resultado;
        }

        #endregion
    }
}
