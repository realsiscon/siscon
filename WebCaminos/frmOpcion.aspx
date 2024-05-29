<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="frmOpcion.aspx.cs" Inherits="WebSISCON.frmOpcion" %>

<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="Estilos/Teclado.css" rel="stylesheet" />
    <link href="Estilos/Responsive-Grilla.css" rel="stylesheet" />
    <script src="JavaScript/Utilidades.js"></script>
    <script src="JavaScript/Teclado.js"></script>
    <script src="JavaScript/jquery.numeric.js"></script>
    <script src="JavaScript/jquery.blockUI.js"></script>

    <link href="Estilos/PopupPersonalizado.css" rel="stylesheet" />
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



            $("#<%= cmbValido.ClientID %>").change(function () {
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

           $("#<%= cmbPadre.ClientID %>").change(function () {
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

            $("#<%= cmbSubValido.ClientID %>").change(function () {
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
            <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 27px">Formulario de Registro de Opciones</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                <asp:Label ID="lblMensajeErrorSmart" runat="server"></asp:Label><br />
            </div>
            <asp:Panel ID="pnlPrincipal" runat="server">
                <h2 id="hSubTitulo" class="titulos_secundarios" style="margin-right: 10px; padding-top: 27px">Seleccionar Tipo de Menu</h2>
                <br />
                <asp:Button ID="btnVistaMenu" runat="server" Text="Registrar Menu" CssClass="il_botones2" Width="200px" OnClick="btnVistaMenu_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnVistaSubMenu" runat="server" Text="Registrar SubMenu" CssClass="il_botones2" Width="200px" OnClick="btnVistaSubMenu_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlMenu" runat="server" Visible="false" Height="100%">
                <h2 id="hSubTituloMenu" class="titulos_secundarios" style="margin-right: 10px; padding-top: 27px">Menu</h2>
                <br />
                <asp:Button ID="btnRegistrarNuevoMenu" runat="server" CssClass="il_botones2" Width="200px" Text="Registrar Nuevo" OnClick="btnRegistrarNuevoMenu_Click" />
                <br />
                <asp:Panel ID="pnlRegistroMenu" runat="server" Visible="false" Height="150px">
                    <div id="DatosIdentificacion" runat="server" style="height: 50px;">
                        <div style="float: left; width: 30%">
                            <asp:Label ID="Label2" runat="server" CssClass="il_lb_campos">Menu</asp:Label>
                            <br />
                            <asp:TextBox ID="txtMenu" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                        </div>
                        <div style="float: left; width: 30%">
                            <asp:Label ID="Label19" runat="server" CssClass="il_lb_campos">Valido</asp:Label>
                            <br />
                            <div id="divcmbValido">
                                <asp:Label ID="lblCmbValido" runat="server" CssClass="custom-dropdown">
                                    <asp:DropDownList ID="cmbValido" runat="server" CssClass="customSelect cmbDrpAFP" AutoPostBack="true" Width="90%">
                                        <asp:ListItem Value="1" Text="Si"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />
                    <asp:HiddenField ID="hddID_Menu" runat="server" />
                    <div style="float: left; width: 100%; text-align: center;">
                        <asp:Button ID="btnRegistrarMenu" CssClass="il_botones2" runat="server" Text="Guardar Registro" OnClick="btnRegistrarMenu_Click" />
                    </div>
                </asp:Panel>
                <!-- OnItemCommand="dgUsuario_ItemCommand"  -->
                <div id="divGeneral" runat="server" style="width: 100%; margin-top: 15px; margin-bottom: 15px;">
                    <div id="FacturasPagoServicio">
                        <asp:DataGrid ID="dgMenu" runat="server" Width="98%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                             OnItemCommand="dgMenu_ItemCommand" Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Menu de Sistema</td></tr>' CssClass="tbGrilla">
                            <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                            <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                            <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                            <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            <Columns>
                                <asp:BoundColumn DataField="idOpcion" HeaderText="Codigo Opcion" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="textoOpcion" HeaderText="Texto Menu" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="descValido" HeaderText="Valido" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="valido" HeaderText="Valido" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="chkImgEditar" ImageUrl="~/Imagenes/check.png" runat="server" CommandName="Editar" ToolTip="Modificar Registro" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                            <EditItemStyle BackColor="#999999" />
                        </asp:DataGrid>
                    </div>
                </div>
            </asp:Panel>

            <!-- Sub Menu -->

            <asp:Panel ID="pnlSubMenu" runat="server" Visible="false" Height="100%">
                <h2 id="hSubTituloSubMenu" class="titulos_secundarios" style="margin-right: 10px; padding-top: 27px">SubMenu</h2>
                <br />
                <asp:Button ID="btnRegistrarNuevoSubMenu" runat="server" Text="Registrar Nuevo" CssClass="il_botones2" Width="200px" OnClick="btnRegistrarNuevoSubMenu_Click" />
                <br />
                <asp:Panel ID="pnlRegistroSubMenu" runat="server" Visible="false" Height="200px">
                    <div id="Div1" runat="server" style="height: 50px;">
                        <div style="float: left; width: 30%">
                            <asp:Label ID="Label1" runat="server" CssClass="il_lb_campos">SubMenu</asp:Label>
                            <br />
                            <asp:TextBox ID="txtSubMenu" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                        </div>
                        <div style="float: left; width: 30%">
                            <asp:Label ID="Label3" runat="server" CssClass="il_lb_campos">Menu Padre</asp:Label>
                            <br />
                            <div id="divcmbPadre">
                                <asp:Label ID="lblcmbPadre" runat="server" CssClass="custom-dropdown">
                                    <asp:DropDownList ID="cmbPadre" runat="server" CssClass="customSelect cmbDrpAFP" OnSelectedIndexChanged="cmbPadre_SelectedIndexChanged" AutoPostBack="true" Width="90%">
                                    </asp:DropDownList>
                                    <br />
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div id="Div3" runat="server" style="height: 50px;">
                        <div style="float: left; width: 30%">
                            <asp:Label ID="Label5" runat="server" CssClass="il_lb_campos">Pantalla</asp:Label>
                            <br />
                            <asp:TextBox ID="txtNombrePantalla" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                        </div>
                        <div style="float: left; width: 30%">
                            <asp:Label ID="Label6" runat="server" CssClass="il_lb_campos">Valido</asp:Label>
                            <br />
                            <div id="divcmbSubValido">
                                <asp:Label ID="lblSubMenuValido" runat="server" CssClass="custom-dropdown">
                                    <asp:DropDownList ID="cmbSubValido" runat="server" CssClass="customSelect cmbDrpAFP" AutoPostBack="true" Width="90%">
                                        <asp:ListItem Value="1">SI</asp:ListItem>
                                        <asp:ListItem Value="0">NO</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField ID="hddSubMenu" runat="server" />
                    <div style="float: left; width: 100%; text-align: center;">
                        <asp:Button ID="btnRegistrarSubMenu" CssClass="il_botones2" runat="server" Text="Guardar Registro" OnClick="btnRegistrarSubMenu_Click" />
                    </div>
                </asp:Panel>
                <!-- OnItemCommand="dgUsuario_ItemCommand"  -->
                <div id="divDetallePantallas" runat="server" style="width: 100%; margin-top: 15px; margin-bottom: 15px;">
                    <div id="divSubMenu">
                        <asp:DataGrid ID="dgSubMenu" runat="server" Width="98%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                             OnItemCommand="dgSubMenu_ItemCommand" Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Pantallas de Sistema</td></tr>' CssClass="tbGrilla">
                            <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                            <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                            <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                            <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            <Columns>
                                <asp:BoundColumn DataField="idOpcion" HeaderText="Codigo Usuario" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="textoOpcion" HeaderText="Texto Menu" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="OpcionPadre" HeaderText="Padre" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="descValido" HeaderText="Valido" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="valido" HeaderText="Valido" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="idOpcionPadre" HeaderText="idOpcionPadre" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Pantalla" HeaderText="Pantalla" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                    <ItemTemplate>
                                        <%--<asp:ImageButton ID="chkImgEditar" ImageUrl="~/Imagenes/check.png" runat="server" CommandName="Editar" ToolTip="Modificar Registro" />--%>
                                        <asp:ImageButton ID="chkImgEditar" runat="server" CommandName="Editar" ImageUrl= "~/Imagenes/check.png" onmouseover="this.src='Imagenes/check_.png'" onmouseout="this.src='Imagenes/check.png'" ToolTip="Modificar Registro"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                            <EditItemStyle BackColor="#999999" />
                        </asp:DataGrid>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnRegistrarMenu" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnRegistrarSubMenu" EventName="Click" />            
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
