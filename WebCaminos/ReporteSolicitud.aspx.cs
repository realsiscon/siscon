using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Datos;
using LogicaCaminos;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Text;
using PrintReportSample;

namespace WebCaminos
{
    public partial class ReporteSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string ID_Solicitud = Page.Request.QueryString["ID_Solicitud"];

                if (Page.Request.Browser.Browser == "InternetExplorer")
                {
                    btnPrint.Visible = false;
                    btnPrint.Enabled = false;
                }

                try
                {
                    // Reset

                    rv1.LocalReport.DataSources.Clear();

                    //ReportViewer1.Reset();

                    // Data Source
                    Solicitud_Compra clsSolicitud = new Solicitud_Compra();
                    StringBuilder lStb = new StringBuilder();
                    lStb.Append("select s.ID_Solicitud, s.ID_Proyecto, p.Cod_proyecto, p.Nomb_Proyecto, p.Responsable Cod_Responsable, s.usr_Solicitud, ");
                    lStb.Append(" per.Nombres + ' ' + per.Ap_Paterno + ' ' +per.Ap_Materno Usuario_Solicitante, ");
                    lStb.Append(" ger.Nombres + ' ' + ger.Ap_Paterno + ' ' +ger.Ap_Materno Gerente_Area, ");
                    lStb.Append(" res.Nombres + ' ' + res.Ap_Paterno + ' ' +res.Ap_Materno Responsable, ");
                    lStb.Append(" l.Nombre_Lugar, pri.Descripcion Prioridad,s.Importe_Total, CONVERT(varchar, s.Fecha_Entrega ,103) Fecha_Entrega, CONVERT(varchar, s.Fecha_Registro,103) Fecha_Registro, DATEDIFF(day, s.Fecha_Registro, s.Fecha_Entrega) Plazo ");
                    lStb.Append(" from Solicitud s ");
                    lStb.Append("	inner join proyecto p on p.ID_proyecto= s.ID_Proyecto and p.Estado=0 ");
                    lStb.Append("	inner join Personal per on per.ID_Personal = s.usr_Solicitud and per.Estado=0 ");
                    lStb.Append("	inner join Personal ger on ger.ID_Personal = p.Gerente_Area and ger.Estado=0 ");
                    lStb.Append("	inner join Personal res on res.ID_Personal = p.Responsable and res.Estado=0 ");
                    lStb.Append("	inner join Lugar_Entrega l on l.ID_Lugar = s.ID_LugarEntrega and l.Estado=0 " );
                    lStb.Append("	inner join Prioridad pri on pri.ID_Prioridad = s.Cod_Prioridad and pri.Estado=0 ");
                    lStb.Append(" where s.ID_Solicitud= " + Convert.ToInt32(ID_Solicitud) + " ");

                    DataTable dt = clsSolicitud.EjecutarConsulta(lStb.ToString()).Tables[0];

                    ReportDataSource rds = new ReportDataSource("dtMaestro", dt);
                    rv1.LocalReport.DataSources.Add(rds);

                    lStb.Clear();
                    lStb.Append("select det.ID_Solicitud, det.Item, det.Cod_Material, m.Nombre_Material, det.Cantidad,det.Importe_Parcial,o.Descripcion Observaciones, 0 precio, det.cod_unidad, u.Descripcion Unidad, det.Importe ");
                    lStb.Append(" from Detalle_Solicitud  det ");
                    lStb.Append("	inner join Material m on m.Cod_Material = det.Cod_Material and m.estado=0 ");
                    lStb.Append("	inner join Observaciones o on o.Cod_Observaciones = det.Cod_Observaciones and o.estado=0 ");
                    lStb.Append(" 	inner join Unidad u on u.Cod_unidad = det.cod_unidad and u.estado=0 ");
                    lStb.Append("where det.ID_Solicitud = " + Convert.ToInt32(ID_Solicitud) + "  ");

                    DataTable dtDetalle = clsSolicitud.EjecutarConsulta(lStb.ToString()).Tables[0];

                    ReportDataSource rdsDetalle = new ReportDataSource("dtDetalle", dtDetalle);

                    rv1.LocalReport.DataSources.Add(rdsDetalle);

                    //Path
                    rv1.LocalReport.ReportPath = Server.MapPath("rptPersonal.rdlc"); //"../Reportes/rptPersonal.rdlc";

                    //Parametros .. Si tuviera
                    //ReportParameter[] rptParametros = new ReportParameter[] { 
                    //    new ReportParameter("nombre","txtALgo.text"),
                    //    new ReportParameter("nombre2","txtotro.text")
                    //};

                    rv1.ProcessingMode = ProcessingMode.Local;

                    //ReportViewer1.LocalReport.SetParameters(rptParametros);

                    // Refresh

                    rv1.DataBind();
                    rv1.LocalReport.Refresh();
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "blah", "closeLoading();", true);
                }
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            
            ReportPrintDocument rp = new ReportPrintDocument(rv1.LocalReport);            
            rp.Print();
        }
    }
}