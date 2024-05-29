<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="WebCaminos.Reportes.Reporte" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="../Estilos/Teclado.css" rel="stylesheet" />
    <link href="../Estilos/Responsive-Grilla.css" rel="stylesheet" />
    <script src="../JavaScript/Utilidades.js"></script>
    <script src="../JavaScript/Teclado.js"></script>
    <script src="../JavaScript/jquery.numeric.js"></script>
    <script src="../JavaScript/jquery.blockUI.js"></script>
    <script src="../JavaScript/jquery-ui-1.8.18.custom.min.js"></script>

    <link href="../Estilos/PopupPersonalizado.css" rel="stylesheet" />
    <script src="../JavaScript/PopupPersonalizado.js"></script>

    <script type="text/javascript">
        if (window.history) {
            function noBack() { window.history.forward() }
            noBack();
            window.onload = noBack;
            window.onpageshow = function (evt) { if (evt.persisted) noBack() }
            window.onunload = function () { void (0) }
        }
        function preventBackspace(e) {
            var evt = e || window.event;
            if (evt) {
                var keyCode = evt.charCode || evt.keyCode;
                if (keyCode === 8) {
                    if (evt.preventDefault) {
                        evt.preventDefault();
                    } else {
                        evt.returnValue = false;
                    }
                }
                else {
                    evt.returnValue = false;
                }
            }
            else {
                evt.returnValue = false;
            }

        }
        function esInteger(e) {
            var charCode

            if (navigator.appName == "Netscape")
                charCode = e.which
            else
                charCode = e.keyCode

            if (charCode < 48 || charCode > 57) { 			//	alert("Esto no es un Numero !!")
                return false
            }

            return true
        }


        function MsjCofirmacionPago() {
            return Confirm.render("¿Confirma que desea realizar la transacción?");
        }

        function pageLoad() {

            loadCombos();

            $("[id$=txtFechaEntrega]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: '../Imagenes/web_03.png',
                showOtherMonths: true,
                dateFormat: "dd/mm/yy",
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb']
            });

            $("input.claseNit").mask("999999999999999");
            $("input.claseMonto").mask("999999999999999.99");
            cargar_random();
            validar_responsive();

            var radios = $("span.rbCuentas input:radio");

            radios.change(function () {

                $.blockUI({
                    message: $('#Block_div'),
                    css:
                    {
                        padding: 0,
                        margin: 0,
                        textAlign: 'center',
                        fontSize: 12,
                        cursor: 'auto',
                        border: 'none',
                        background: 'none'
                    }
                });

            });

            <%--$("#<%= cmbProyecto.ClientID %>").change(function () {
                $.blockUI({
                    message: $('#Block_div'),
                    css:
                    {
                        padding: 0,
                        margin: 0,
                        textAlign: 'center',
                        fontSize: 12,
                        cursor: 'auto',
                        border: 'none',
                        background: 'none'
                    }
                });
            });--%>


            $('#Block_div').click(function () {
                $.unblockUI();
            });
        };

        $(window).resize(function () {
            validar_responsive();
        });

        function validar_responsive() {
            if ($("#contenedor").css('width') == '980px') {
                $("#ContentPlaceHolder_txtClaveTran1").prop('readonly', true);
                $("#ContentPlaceHolder_txtClaveTran1").keydown(function () {
                    preventBackspace();
                });
            } else {
                $("#ContentPlaceHolder_txtClaveTran1").prop('readonly', false);
                $("#ContentPlaceHolder_txtClaveTran1").keydown(function () {
                });
            }
        }
        function closeLoading() {
            $.unblockUI();
        }

    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 27px">Reporte de Prueba</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                <asp:Label ID="lblMensajeErrorSmart" runat="server"></asp:Label><br />
            </div>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="dsSolicitudTableAdapters."></asp:ObjectDataSource>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="800px"></rsweb:ReportViewer>


        </ContentTemplate>
        <Triggers>
            <%--<asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

