<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="frmGrupo.aspx.cs" Inherits="WebSISCON.frmGrupo" %>


<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="Estilos/Teclado.css" rel="stylesheet" />
    <link href="Estilos/Responsive-Grilla.css" rel="stylesheet" />
    <script src="JavaScript/Utilidades.js"></script>
    <script src="JavaScript/Teclado.js"></script>
    <script src="JavaScript/jquery.numeric.js"></script>
    <script src="JavaScript/jquery.blockUI.js"></script>

    <link href="Estilos/PopupPersonalizado.css" rel="stylesheet" />
    <%--<script src="JavaScriptFassilNet/PopupPerzonalizadoPDS.js"></script>--%>
    <script src="JavaScript/PopupPersonalizado.js"></script>

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

            $("#<%= cmbEstado.ClientID %>").change(function () {
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
            <%--<div id="dialogoverlay"></div>
            <div id="dialogbox">
                <div>
                    <div id="dialogboxhead"></div>
                    <div id="dialogboxbody"></div>
                    <div id="dialogboxfoot"></div>
                </div>
            </div>--%>
            <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 27px">Formulario de Registro de Grupos para Proyectos</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                <asp:Label ID="lblMensajeErrorSmart" runat="server"></asp:Label><br />
            </div>
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Nuevo" CssClass="il_botones2" Width="200px" OnClick="btnRegistrar_Click" />

            <!-- AQUI VA LO DE LA BUSQUEDA -->
            <asp:Panel ID="pnlRegistro" runat="server" Visible="false" Height="150px">
                <div id="DatosIdentificacion" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label2" runat="server" CssClass="il_lb_campos">Nombre Grupo</asp:Label>
                        <br />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>

                    </div>
                    <div style="float: left; width: 30%;">
                        <asp:Label ID="Label10" runat="server" CssClass="il_lb_campos">Estado:</asp:Label>
                        <br />
                        <div id="divcmbEstado">
                            <asp:Label ID="lblcmbEstado" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbEstado" runat="server" CssClass="customSelect cmbDrpAFP" AutoPostBack="true" Width="90%" OnSelectedIndexChanged="cmbEstado_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Habilitado</asp:ListItem>
                                    <asp:ListItem Value="9">Deshabilitado</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                </div>
                <br />
                <div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label1" runat="server" CssClass="il_lb_campos">Proyecto</asp:Label>
                        <br />
                        <div id="divcmbProyecto">
                            <asp:Label ID="Label15" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbProyecto" runat="server" CssClass="customSelect cmbDrpAFP" OnSelectedIndexChanged="cmbProyecto_SelectedIndexChanged" AutoPostBack="true" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                </div>

                <br />

                <div id="divMotivo" runat="server" style="width: 60%; float: left; ">
                    <asp:Label ID="lblEtiquetaMotivo" runat="server" CssClass="il_lb_campos">Motivo Deshabilitacion</asp:Label>
                    <br />
                    <asp:TextBox ID="txtMotivo" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                    <br />
                </div>

               
               
                <asp:HiddenField ID="hddID_Area" runat="server" />
                <div style="float: left; width: 100%; text-align: center;">
                    <asp:Button ID="btnEnviar" CssClass="il_botones2" runat="server" Text="Guardar Registro" OnClick="btnEnviar_Click" />
                </div>
                <br />
                <br />
            </asp:Panel>
            
            <div id="divGeneral" runat="server" style="margin-bottom: 15px;">

                <div id="FacturasPagoServicio">
                    <asp:DataGrid ID="dgGrupo" runat="server" Width="100%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                        OnItemCommand="dgGrupo_ItemCommand" Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Grupos</td></tr>' CssClass="tbGrilla">
                        <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                        <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                        <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                        <Columns>
                            <asp:BoundColumn DataField="id_grupo" HeaderText="Codigo Grupo" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="NombreGrupo" HeaderText="Nombre" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Nomb_Proyecto" HeaderText="Proyecto" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <%--<asp:BoundColumn DataField="descEstado" HeaderText="Estado" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>--%>
                            <%--<asp:BoundColumn DataField="Estado" HeaderText="Estado" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>--%>
                            <asp:BoundColumn DataField="id_proyecto" HeaderText="id_proyecto" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <%--<asp:ImageButton ID="chkImgEditar" ImageUrl="~/Imagenes/check.png" runat="server" CommandName="Editar" ToolTip="Modificar Registro" />--%>
                                    <asp:ImageButton ID="chkImgEditar" runat="server" CommandName="Editar" ImageUrl="~/Imagenes/check.png" onmouseover="this.src='Imagenes/check_.png'" onmouseout="this.src='Imagenes/check.png'" ToolTip="Modificar Registro" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                        <EditItemStyle BackColor="#999999" />
                    </asp:DataGrid>
                </div>


            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
