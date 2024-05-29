<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPopUp.Master" AutoEventWireup="true" CodeBehind="ReporteSolicitud.aspx.cs" Inherits="WebCaminos.ReporteSolicitud" %>


<%--<%@ Register Assembly="printButtonDLL" Namespace="printButtonDLL" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script src="JavaScript/Utilidades.js"></script>
    <link href="Estilos/Responsive-Grilla.css" rel="stylesheet" />

    


   <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function $_create(elem, tag, target) { return addElem(elem, target, tag) }
        function $_add(elem, target) { return addElem(elem, target) }
        function $_GB() { return GetBrowser(); }

        function GetBrowser() {
            //JQuery Script;
            if ($.browser.mozilla)
                return 'FF';
            else if ($.browser.msie)
                return 'IE';
            else if ($.browser.webkit)
                return 'OP';
            else if ($.browser.opera)
                return 'WK';
            else
                return 'FF';
        }

        function addElem(elem, target, tag) {
            if (typeof elem === 'string') {
                var el = document.getElementById(elem);
                if (!el) {

                    el = document.createElement(tag);

                    el.id = elem;
                }
                elem = el;
            }
            if (target) {
                var dest;
                if (typeof target === 'string')
                    dest = document.getElementById(target);
                else
                    dest = target;

                dest.appendChild(elem);
            }

            return elem;
        }

        function insert(elem, target) {
            if (typeof target === 'string')
                target = document.getElementById(target);
            var myDoc = target.contentWindow || target.contentDocument;
            if (myDoc.document) {
                myDoc = myDoc.document;
            }
            var headLoc = myDoc.getElementsByTagName("head").item(0);
            var scriptObj = myDoc.createElement("script");
            scriptObj.setAttribute("type", "text/javascript");
            scriptObj.innerHTML = 'window.print();';
            if (elem)
                elem = document.getElementById(elem);

            if (elem)
                headLoc.appendChild(elem);
            else
                headLoc.appendChild(scriptObj);

        }

        function printElement(elementIDString) {
            var divToPrint = document.getElementById(elementIDString);
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            newWin.document.close();
            return false;
        }
    </script>--%>
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div id="oReportDiv">
        <%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>
        <%@Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="dsSolicitudTableAdapters."></asp:ObjectDataSource>
        
        <%--<cc1:PrintButton ID="PrintButton1" runat="server" ReportName="ReportViewer1" />
        <asp:Button ID="btnPrint" runat="server" Text="PRINT" Width="75px" UseSubmitBehavior="false" OnClientClick="printElement('ReportViewer_rv1'); return false;"></asp:Button>

        <input id="printreport" type="button" value="Print this Report" />
        --%>

        <asp:Button ID="btnPrint" runat="server" Text="Imprimir Reporte" OnClick="btnPrint_Click" />
        
        <rsweb:ReportViewer ID="rv1" runat="server" Height="700px" Width="950px" ShowPrintButton="true">
        </rsweb:ReportViewer>

        

    </div>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        function printElement(elementIDString) {
            var divToPrint = document.getElementById(elementIDString);
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
            newWin.document.close();
            return false;
        }

            //------------------------------------------------------------------
            // Cross-browser Multi-page Printing with ASP.NET ReportViewer
            // by Chtiwi Malek.
            // http://www.codicode.com
            //------------------------------------------------------------------

            // Linking the print function to the print button
            $('#printreport').click(function () {
                printReport('rv1');
            });

            // Print function (require the reportviewer client ID)
            function printReport(report_ID) {
                var rv1 = $('#' + report_ID);
                var iDoc = rv1.parents('html');

                // Reading the report styles
                var styles = iDoc.find("head style[id$='ReportControl_styles']").html();
                if ((styles == undefined) || (styles == '')) {
                    iDoc.find('head script').each(function () {
                        var cnt = $(this).html();
                        var p1 = cnt.indexOf('ReportStyles":"');
                        if (p1 > 0) {
                            p1 += 15;
                            var p2 = cnt.indexOf('"', p1);
                            styles = cnt.substr(p1, p2 - p1);
                        }
                    });
                }
                if (styles == '') { alert("Cannot generate styles, Displaying without styles.."); }
                styles = '<style type="text/css">' + styles + "</style>";

                // Reading the report html
                //var table = rv1.find("div[id$='_oReportDiv']");
                var table = rv1.find("div[id$='_oReportDiv']");
                if (table == undefined) {
                    alert("Report source not found.");
                    return;
                }

                // Generating a copy of the report in a new window
                var docType = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/loose.dtd">';
                var docCnt = styles + table.parent().html();
                var docHead = '<head><title>Printing ...</title><style>body{margin:5;padding:0;}</style></head>';
                var winAttr = "location=yes,statusbar=no,directories=no,menubar=no,titlebar=no,toolbar=no,dependent=no,width=720,height=600,resizable=yes,screenX=200,screenY=200,personalbar=no,scrollbars=yes";;
                var newWin = window.open("", "_blank", winAttr);
                writeDoc = newWin.document;
                writeDoc.open();
                writeDoc.write(docType + '<html>' + docHead + '<body onload="window.print();">' + docCnt + '</body></html>');
                writeDoc.close();

                // The print event will fire as soon as the window loads
                newWin.focus();
                // uncomment to autoclose the preview window when printing is confirmed or canceled.
                // newWin.close();
            };

        </script>

</asp:Content>
