<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Fases_Actividad.aspx.cs" Inherits="WebSISCON.Fases_Actividad" %>


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

            $("[id$=txtFechaIni]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'Imagenes/web_03.png',
                showOtherMonths: true,
                dateFormat: "dd/mm/yy",
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb']
            });

            $("[id$=txtFechaFinal]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'Imagenes/web_03.png',
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
            <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 27px">Registro de Actividad</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                <asp:Label ID="lblMensajeErrorSmart" runat="server"></asp:Label><br />
            </div>

            <asp:Panel ID="pnlRegistro" runat="server" Height="600px">
                <div id="DatosIdentificacion" runat="server" style="height: 50px;">
                    <div style="float: left; width: 40%">
                        <asp:Label ID="Label2" runat="server" CssClass="il_lb_campos">Codigo de Proyecto</asp:Label>
                        <br />
                        <asp:TextBox ID="txtIDProyecto" runat="server" ReadOnly="true" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                    </div>
                    <div style="float: left; width: 40%">
                        <asp:Label ID="Label1" runat="server" CssClass="il_lb_campos">Nombre Proyecto</asp:Label>
                        <br />
                        <asp:TextBox ID="txtNombreProyecto" runat="server" ReadOnly="true" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                    </div>

                </div>
                <br />
                <div id="Div1" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label3" runat="server" CssClass="il_lb_campos">Nombre Actividad</asp:Label>
                        <br />
                        <asp:TextBox ID="txtNombreActividad" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>
                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label6" runat="server" CssClass="il_lb_campos">Secuencia Actividad</asp:Label>
                        <br />
                        <asp:TextBox ID="txtSecuencia" runat="server" CssClass="il_txt_campos" Width="90%"></asp:TextBox>

                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="lblEtiquetaEstado" runat="server" CssClass="il_lb_campos">Estado</asp:Label>
                        <br />
                        <div id="divcmbEstado">
                            <asp:Label ID="lblEstado" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbEstadoActidad" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                    <asp:ListItem Value="0">Nuevo</asp:ListItem>
                                    <asp:ListItem Value="1">En Ejecución</asp:ListItem>
                                    <asp:ListItem Value="2">Completado</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>

                    </div>
                </div>
                <br />
                <div id="Div2" runat="server" style="height: 50px;">
                    <div style="float: left; width: 90%">
                        <asp:Label ID="Label4" runat="server" CssClass="il_lb_campos">Descripción</asp:Label>
                        <br />
                        <asp:TextBox ID="txtDescripcion" runat="server" class="il_txt_campos" Style="width: 100%" />
                    </div>
                </div>
                <br />
                <div id="Div3" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label5" runat="server" CssClass="il_lb_campos">Fecha Inicio</asp:Label>
                        <br />
                        <input type="text" id="txtFechaIni" runat="server" class="il_txt_campos" readonly="readonly" style="text-align: center" />

                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label7" runat="server" CssClass="il_lb_campos">Fecha Fin</asp:Label>
                        <br />
                        <input type="text" id="txtFechaFinal" runat="server" class="il_txt_campos" readonly="readonly" style="text-align: center" />

                    </div>
                    <div style="float: left; width: 30%">
                    </div>
                </div>
                <br />
                <div id="Div4" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label8" runat="server" CssClass="il_lb_campos">Modulo</asp:Label>
                        <br />
                        <div id="divcmbModulo">
                            <asp:Label ID="lblModulo" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbModulo" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>

                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label9" runat="server" CssClass="il_lb_campos">Grupo</asp:Label>
                        <br />
                        <div id="divcmbGrupo">
                            <asp:Label ID="lblGrupo" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbGrupo" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label10" runat="server" CssClass="il_lb_campos">Contratista</asp:Label>
                        <br />
                        <div id="divcmbContratista">
                            <asp:Label ID="lblContratista" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbContratista" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                </div>
                <br />
                <div id="Div5" runat="server" style="height: 50px;">
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label16" runat="server" CssClass="il_lb_campos">Precio Unitario</asp:Label>
                        <br />
                        <asp:TextBox ID="txtPrecioUnitario" runat="server" class="il_txt_campos" Style="width: 90%" />
                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label18" runat="server" CssClass="il_lb_campos">Cantidad</asp:Label>
                        <br />
                        <asp:TextBox ID="txtCantidad" runat="server" class="il_txt_campos" Style="width: 90%" />
                    </div>
                    <div style="float: left; width: 30%">
                        <asp:Label ID="Label11" runat="server" CssClass="il_lb_campos">Precio de Mano de Obra</asp:Label>
                        <br />
                        <asp:TextBox ID="txtPrecioManoObra" runat="server" class="il_txt_campos" Style="width: 90%" />
                    </div>
                </div>
                <br />
                <div id="Div6" runat="server" style="height: 50px;">
                    <div style="float: left; width: 20%">
                        <asp:Label ID="Label12" runat="server" CssClass="il_lb_campos">Forma de Pago</asp:Label>
                        <br />
                        <div id="divcmbFormaPago">
                            <asp:Label ID="lblFormaPago" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbFormaPago" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                    <asp:ListItem Value="1">Avance</asp:ListItem>
                                    <asp:ListItem Value="2">Jornal</asp:ListItem>
                                    <asp:ListItem Value="3">LLave en Mano</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                    <div style="float: left; width: 20%">
                        <asp:Label ID="Label13" runat="server" CssClass="il_lb_campos">Costo Mano de Obra</asp:Label>
                        <br />
                        <asp:TextBox ID="txtCostoManoObra" runat="server" class="il_txt_campos" Style="width: 90%" />
                    </div>
                    <div style="float: left; width: 20%">
                        <asp:Label ID="Label14" runat="server" CssClass="il_lb_campos">Costo Material</asp:Label>
                        <br />
                        <asp:TextBox ID="txtCostoMaterial" runat="server" class="il_txt_campos" Style="width: 90%" />
                    </div>
                    <div style="float: left; width: 20%">
                        <asp:Label ID="Label15" runat="server" CssClass="il_lb_campos">Costo Maquinaria</asp:Label>
                        <br />
                        <asp:TextBox ID="txtCostoMaquinaria" runat="server" class="il_txt_campos" Style="width: 90%" />
                    </div>
                    <div style="float: left; width: 20%">
                        <asp:Label ID="Label17" runat="server" CssClass="il_lb_campos">Unidad</asp:Label>
                        <br />
                        <div id="divcmbUnidad">
                            <asp:Label ID="lblUnidad" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbUnidad" runat="server" CssClass="customSelect cmbDrpAFP" Width="90%">
                                </asp:DropDownList>
                                <br />
                            </asp:Label>
                        </div>
                    </div>
                </div>
                <br />
                <h2 class="titulos_secundarios">Detalle de Fases</h2>
                <br />

                <div style="float: left; width: 100%; text-align: center;">
                    <asp:Button ID="btnRegistro" CssClass="il_botones2" runat="server" Text="Agregar Actividad" OnClick="btnRegistro_Click" />
                </div>

                <div id="FacturasPagoServicio" style="float:left; width:100%; margin-bottom:15px;" >
                    <asp:DataGrid ID="dgFases" runat="server" Width="100%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                        OnItemCommand="dgFases_ItemCommand"
                        Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Actividades</td></tr>' CssClass="tbGrilla">
                        <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                        <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                        <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                        <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                        <Columns>

                            <asp:BoundColumn DataField="id_actividad" HeaderText="ID Actividad" Visible="false" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="id_proyecto" HeaderText="ID proyecto" Visible="false" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Nomb_Proyecto" HeaderText="Nombre Proyecto" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="nombre_actividad" HeaderText="Actividad" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="fecha_ini" HeaderText="Fecha Inicio" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="fecha_fin" HeaderText="Fecha Fin" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Nombre_contratista" HeaderText="Contratista" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:ImageButton ID="chkImgEditar" runat="server" CommandName="Editar" ImageUrl="~/Imagenes/check.png" onmouseover="this.src='Imagenes/check_.png'" onmouseout="this.src='Imagenes/check.png'" ToolTip="Modificar Registro" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                        <EditItemStyle BackColor="#999999" />
                    </asp:DataGrid>
                </div>
                <%-- <div style="text-align: center;">
                    <asp:Button ID="btnRegistrar" CssClass="il_botones2" runat="server" Text="Registrar Solicitud" OnClick="btnRegistro_Click"  />
                </div>--%>

                <asp:HiddenField ID="hddGerenteArea" runat="server" />
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnRegistro" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
