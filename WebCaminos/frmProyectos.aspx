<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="frmProyectos.aspx.cs" Inherits="WebSISCON.frmProyectos" %>

<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="Estilos/Contactenos.css" rel="stylesheet" />
    <%--<link href="Estilos/Grilla.css" rel="stylesheet" />--%>
    <link href="Estilos/Responsive-Grilla.css" rel="stylesheet" />
    <script src="JavaScript/Utilidades.js"></script>
    <script src="JavaScript/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="JavaScript/jquery.blockUI.js"></script>
    <script src="JavaScript/jquery.numeric.js"></script>
    <script type="text/javascript">
        function pageLoad() {
            loadCombos();

            $("[id$=txtFecha]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'Imagenes/web_03.png',
                showOtherMonths: true,
                dateFormat: "dd/mm/yy",
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb']
            });

            $('#Block_div').click(function () {
                $.unblockUI();
            });

            $("#ContentPlaceHolder_txtTelefono").numeric();
        }
        function closeLoading() {
            $.unblockUI();
        }
        function validarEmail(campo) {
            var RegExPattern = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            $("#ContentPlaceHolder_lblMensajeError").html('');
            if ((campo.value.match(RegExPattern)) && (campo.value != '')) { //Comparación                
                return true;
            } else {
                $("#ContentPlaceHolder_lblMensajeError").html('Debe ingresar un email válido');
                $("#ContentPlaceHolder_txtCorreo").focus();
                return false;
            }
        }
        function validar() {
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

            var telefono = $("#ContentPlaceHolder_txtTelefono").val();
            var correo = $("#ContentPlaceHolder_txtCorreo").val();
            var asunto = $("#ContentPlaceHolder_txtAsunto").val();
            var detalle = $("#ContentPlaceHolder_txtDetalle").val();
            var dpOficina = $("#ContentPlaceHolder_drpOficina option:selected").val();

            if (telefono.length <= 0) {
                $("#ContentPlaceHolder_lblMensajeError").html('Debe ingresar un teléfono.');
                $.unblockUI();
                return false;
            }

            var RegExPattern = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
            $("#ContentPlaceHolder_lblMensajeError").html('');
            if ((correo.match(RegExPattern)) && (correo != '')) { //Comparación  

                if (asunto.length <= 0) {
                    $("#ContentPlaceHolder_lblMensajeError").html('Debe ingresar el asunto.');
                    $.unblockUI();
                    return false;
                }
                if (dpOficina == 0) {
                    $("#ContentPlaceHolder_lblMensajeError").html('Seleccione una oficina.');
                    $.unblockUI();
                    return false;
                }
                if (detalle.length <= 0) {
                    $("#ContentPlaceHolder_lblMensajeError").html('Debe ingresar el detalle.');
                    $.unblockUI();
                    return false;
                }

                return true;
            } else {
                $("#ContentPlaceHolder_lblMensajeError").html('Debe ingresar un email válido');
                $.unblockUI();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Contenido" runat="server" ContentPlaceHolderID="ContentPlaceHolder">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 class="titulo_grilla">Formulario de Registro de Proyectos</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label><br />
            </div>

            <div id="il_datos_usuarioAcceso" style="margin-left: 10px;">

                <table style="width: 100%">
                    <tr>
                        <td style="width: 150px;">
                            <asp:Label ID="Label1" CssClass="il_lb_campos" runat="server">Codigo de Proyecto:</asp:Label>
                        </td>
                        <td style="width: 260px;">
                            <asp:Label ID="Label3" CssClass="il_lb_campos" runat="server">Nombre Proyecto:</asp:Label>
                        </td>
                        <%--<td style="width: 150px;">--%>
                        <td>
                            <asp:Label ID="Label4" CssClass="il_lb_campos" runat="server">Cliente:</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtCodProyecto" runat="server" CssClass="il_txt_campos" MaxLength="20" Style="margin-bottom: 1%" Width="90%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombreProyecto" runat="server" CssClass="il_txt_campos" Style="margin-bottom: 1%" Width="90%"></asp:TextBox>

                        </td>
                        <td>
                            <asp:Label ID="lblProyecto" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbCliente" runat="server" AppendDataBoundItems="true" CssClass="customSelect" Width="90%">
                                    
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="3">
                            <asp:Label ID="Label5" runat="server" CssClass="il_lb_campos">Ubicación</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:TextBox ID="txtUbicacion" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 150px;">
                             <asp:Label ID="lblsss" runat="server" CssClass="il_lb_campos">Director de Obra</asp:Label>
                        </td>
                        <td style="width: 150px;">
                             <asp:Label ID="Label6" runat="server" CssClass="il_lb_campos">Fiscal de Obra</asp:Label>
                        </td>
                        <td style="width: 150px;">
                             <asp:Label ID="Label7" runat="server" CssClass="il_lb_campos">Almacen Asignado</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDirectorObra" runat="server" CssClass="custom-dropdown" >
                                <asp:DropDownList ID="cmbDirectorObra" runat="server" CssClass="customSelect" Width="250px" >
                                                                  
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                   
                        <td >
                            <asp:Label ID="lblFiscalObra" runat="server" CssClass="custom-dropdown" >
                                <asp:DropDownList ID="cmbFiscalObra" runat="server" CssClass="customSelect" Width="250px" >
                                                                  
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                    
                        <td >
                            <asp:Label ID="lblAlmacen" runat="server" CssClass="custom-dropdown" >
                                <asp:DropDownList ID="cmbAlmacen" runat="server" CssClass="customSelect" Width="250px" >
                                                                  
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" CssClass="il_lb_campos" runat="server">Estado</asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="lblEtiquetaMotivo" Visible="false" CssClass="il_lb_campos" runat="server">Motivo Deshabilitacion</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCmdEstado" runat="server" CssClass="custom-dropdown" >
                                <asp:DropDownList ID="cmbEstado" runat="server" CssClass="customSelect" AutoPostBack="true" Width="150px" OnSelectedIndexChanged="cmbEstado_SelectedIndexChanged">
                                    <asp:ListItem Value="1">Habilitado</asp:ListItem>
                                    <asp:ListItem Value="0">Deshabilitado</asp:ListItem>                                
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                        <td colspan="2">
                             <asp:TextBox ID="txtMotivoDesh" runat="server" Visible="false" CssClass="il_txt_campos" Style="margin-bottom: 1%" Width="90%"></asp:TextBox>
                        </td>
                    </tr>

                </table>
                <div style="text-align: center;">
                    <asp:Button ID="btnEnviar" CssClass="il_botones2" runat="server" Text="Guardar Proyecto" OnClick="btnEnviar_Click" />
                </div>
            </div>
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

