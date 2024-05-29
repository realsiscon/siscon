<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="SalidasAlmacen.aspx.cs" Inherits="WebSISCON.SalidasAlmacen" %>

<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="Estilos/Teclado.css" rel="stylesheet" />
    <link href="Estilos/Responsive-Grilla.css" rel="stylesheet" />
    <script src="JavaScript/Utilidades.js"></script>
    <script src="JavaScript/Teclado.js"></script>
    <script src="JavaScript/jquery.numeric.js"></script>
    <script src="JavaScript/jquery.blockUI.js"></script>
    <script src="JavaScript/jquery-ui-1.8.18.custom.min.js"></script>

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

            $("[id$=txtFechaEntrega]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'Imagenes/web_03.png',
                showOtherMonths: true,
                dateFormat: "dd/mm/yy",
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
                altFormat: "dd/mm/yy",
                minDate: 0
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

            <%--$("#<%= cmbAlmacenOrigen.ClientID %>").change(function () {
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

            $("#<%= cmbAlmacenDestino.ClientID %>").change(function () {
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



            $("#<%= cmbUnidad.ClientID %>").change(function () {
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

            $("#<%= cmbMaterial.ClientID %>").change(function () {
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
            <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 27px">Salidas de Material de Almacen</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                <asp:Label ID="lblMensajeErrorSmart" runat="server"></asp:Label><br />
            </div>

            <asp:Panel ID="pnlSolicitudes" runat="server">
                <div>
                    <asp:DataGrid ID="dgSolicitudesPendientes" runat="server" Width="100%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                        OnItemCommand="dgSolicitudesPendientes_ItemCommand" Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Solicitud de Salida</td></tr>' CssClass="tbGrilla">
                        <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                        <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                        <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                        <Columns>
                            <asp:BoundColumn DataField="ID_Solicitud" HeaderText="ID Solicitud" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ID_Proyecto" HeaderText="ID_Proyecto" Visible="false" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Cod_proyecto" HeaderText="Cod_proyecto" Visible="false" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Nomb_Proyecto" HeaderText="Proyecto" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="solicitante" HeaderText="Solicitante" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Nombre_Almacen" HeaderText="Almacen" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="Seleccionar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:ImageButton ID="chkImgEditar" runat="server" CommandName="Editar" ImageUrl="~/Imagenes/check.png" onmouseover="this.src='Imagenes/check_.png'" onmouseout="this.src='Imagenes/check.png'" ToolTip="Seleccionar Solicitud" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                        <EditItemStyle BackColor="#999999" />
                    </asp:DataGrid>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlRegistro" runat="server">
                <div id="DatosIdentificacion" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label1" runat="server" CssClass="il_lb_campos">Nro Orden de Origen</asp:Label>
                        <br />
                        <asp:TextBox ID="txtNroPedido" runat="server" CssClass="il_txt_campos" Width="90%" Style="text-align: center"></asp:TextBox>
                    </div>

                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label2" runat="server" CssClass="il_lb_campos">Almacen Origen</asp:Label>
                        <br />
                        <div>
                            <asp:Label ID="lblAlmacenOrigen" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbAlmacenOrigen" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>

                </div>
                <br />
                <div id="div1" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label8" runat="server" CssClass="il_lb_campos">Proyecto</asp:Label>
                        <br />
                        <div>
                            <asp:Label ID="lblProyecto" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbProyecto" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label7" runat="server" CssClass="il_lb_campos">Contratista</asp:Label>
                        <br />
                        <div>
                            <asp:Label ID="lblContratista" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbContratista" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                </div>
                <br />

                <div id="divObseracion" runat="server" style="height: 50px;">
                    <div style="float: left; width: 90%">
                        <asp:Label ID="Label5" runat="server" CssClass="il_lb_campos">Descripción</asp:Label>
                        <br />
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>

                    </div>
                </div>
                <br />
                <h2 class="titulos_secundarios">Detalle de Materiales</h2>
                <br />
                <div id="Div6" runat="server" style="height: 50px;">
                    <div style="float: left; width: 60%">
                        <asp:Label ID="Label24" runat="server" CssClass="il_lb_campos">Producto</asp:Label>
                        <br />
                        <div id="divcmbMaterial">
                            <asp:Label ID="lblProducto" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbMaterial" runat="server" CssClass="customSelect cmbDrpAFP" AutoPostBack="true" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label21" runat="server" CssClass="il_lb_campos">Unidad</asp:Label>
                        <br />
                        <div id="divcmbUnidad">
                            <asp:Label ID="lblUnidad" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbUnidad" runat="server" CssClass="customSelect cmbDrpAFP" AutoPostBack="true" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>

                </div>
                <br />
                <div id="Div7" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label23" runat="server" CssClass="il_lb_campos">Cantidad</asp:Label>
                        <br />
                        <asp:TextBox ID="txtCantidad" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div style="float: left; width: 100%; text-align: center;">
                    <asp:Button ID="btnEnviar" CssClass="il_botones2" runat="server" Text="Agregar Material" OnClick="btnEnviar_Click" />
                </div>
                <br />
                <div>
                    <asp:DataGrid ID="dgMaterial" runat="server" Width="100%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                        OnItemCommand="dgMaterial_ItemCommand" Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Detalle de Materiales</td></tr>' CssClass="tbGrilla">
                        <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                        <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                        <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                        <Columns>
                            <asp:BoundColumn DataField="Cod_Material" HeaderText="Codigo Material" Visible="false" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Producto_Nombre" HeaderText="Material" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Unidad_Nombre" HeaderText="Unidad" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <%--<asp:BoundColumn DataField="Cantidad" HeaderText="Cantidad" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>--%>
                            <asp:TemplateColumn HeaderText="Cantidad" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCantidad" runat="server" CssClass="il_txt_campos"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Eliminar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:ImageButton ID="chkImgEditar" runat="server" CommandName="Editar" ImageUrl="~/Imagenes/check.png" onmouseover="this.src='Imagenes/check_.png'" onmouseout="this.src='Imagenes/check.png'" ToolTip="Modificar Registro" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                        <EditItemStyle BackColor="#999999" />
                    </asp:DataGrid>
                </div>
                <br />
                <div style="text-align: center;">
                    <asp:Button ID="btnRegistrar" CssClass="il_botones2" runat="server" Text="Registrar Solicitud" OnClick="btnRegistrar_Click" />
                </div>

            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
