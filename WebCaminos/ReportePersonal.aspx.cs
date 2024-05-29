using LogicaSiscon;
using LogicaSiscon.Dto.Reportes;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSISCON
{
    public partial class ReportePersonal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            

            if (!Page.IsPostBack)
            {
                Personal objPersonal = new Personal();

                List<PersonalRptDto> objReporte = objPersonal.ObtenerPersonal_rpt(Sesion.Login.Id_Empresa);

                ReportDataSource rdsReporte = new ReportDataSource("dsPersonal", objReporte);

                rvPersonal.LocalReport.DataSources.Add(rdsReporte);

                //Path
                rvPersonal.LocalReport.ReportPath = Server.MapPath("rptPersonalEmpresa.rdlc");

                //Parametros .. Si tuviera
                //ReportParameter[] rptParametros = new ReportParameter[] { 
                //    new ReportParameter("nombre","txtALgo.text"),
                //    new ReportParameter("nombre2","txtotro.text")
                //};

                rvPersonal.ProcessingMode = ProcessingMode.Local;

                //ReportViewer1.LocalReport.SetParameters(rptParametros);

                // Refresh
                rvPersonal.DataBind();
                rvPersonal.LocalReport.Refresh();
            }

            

        }
    }
}