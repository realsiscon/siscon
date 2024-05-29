<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ReportePersonal.aspx.cs" Inherits="WebSISCON.ReportePersonal" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 27px">Reportes de Empleados </h1>

    <div id="divGeneral" runat="server" style="margin-bottom: 15px;">
        <rsweb:ReportViewer ID="rvPersonal" runat="server" Width="100%">
        </rsweb:ReportViewer>
    </div>

</asp:Content>
