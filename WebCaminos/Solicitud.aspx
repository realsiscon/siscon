<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Solicitud.aspx.cs" Inherits="WebSISCON.Solicitud" %>

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
            <h1 class="titulo_grilla">Formulario de Solicitud</h1>
            <div class="il_lb_error">
                <asp:Label ID="lblMensajeError" runat="server"></asp:Label><br />
            </div>

            <div id="il_datos_usuarioAcceso" style="margin-left: 10px;">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 70px;">
                            <asp:Label ID="Label1" CssClass="il_lb_campos" runat="server">Proyecto:</asp:Label>
                        </td>
                        <td style="width: 150px;">
                            <asp:Label ID="Label3" CssClass="il_lb_campos" runat="server">Nombre Proyecto:</asp:Label>
                        </td>
                        <td style="width: 150px;">
                            <asp:Label ID="Label4" CssClass="il_lb_campos" runat="server">Responsable:</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<div id="divdrpOficina" style="margin-bottom: 1%; margin-top: 1%">--%>
                            <asp:Label ID="lblProyecto" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbProyecto" runat="server" AppendDataBoundItems="true" AutoPostBack="true" CssClass="customSelect" Width="150px" OnSelectedIndexChanged="cmbProyecto_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                                <%--<br />--%>
                            </asp:Label>
                            <%--</div>--%>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombreProyecto" runat="server" CssClass="il_txt_campos" MaxLength="20" Style="margin-bottom: 1%" Width="90%"></asp:TextBox>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="txtResponsable" runat="server" CssClass="il_txt_campos" MaxLength="20" Style="margin-bottom: 1%" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" CssClass="il_lb_campos" runat="server">Prioridad</asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFechaEntrega" CssClass="il_lb_campos" runat="server">Fecha de Entrega</asp:Label>
                        </td>
                        <td>
                             <asp:Label ID="lblLugarEntrega" CssClass="il_lb_campos" runat="server">Lugar de Entrega</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrioridad" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbPrioridad" runat="server" AppendDataBoundItems="true" Width="150px" AutoPostBack="true" CssClass="customSelect">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                        <td>
                            <%--<asp:TextBox ID="txtFechaEntrega" runat="server" CssClass="il_txt_campos" MaxLength="30" Style="margin-bottom: 1%"></asp:TextBox>--%>
                            <input  type="text" id="txtFecha" runat="server" class="il_txt_campos" readonly="readonly" style="text-align:center"/>  
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbLugarEntrega" runat="server" AppendDataBoundItems="true" AutoPostBack="true" CssClass="customSelect"  Width="150px">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                </asp:DropDownList><br />
                            </asp:Label>
                        </td>
                    </tr>
                </table>

                <h2 class="titulos_secundarios">Detalle de Materiales</h2>                

                <table style="width: 100%;">
                    <tr>
                        <td style="width:150px;">
                            <asp:Label ID="lblUnidad" CssClass="il_lb_campos" runat="server">Unidad</asp:Label>
                        </td>
                        <td style="width: 70px;">
                            <asp:Label ID="lblCantidad" CssClass="il_lb_campos" runat="server">Cantidad</asp:Label>
                        </td>
                        <td style="width: 150px;">
                            <asp:Label ID="lblMaterial" CssClass="il_lb_campos" runat="server">Material</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" CssClass="custom-dropdown" >
                                <asp:DropDownList ID="cmbUnidad" runat="server" AppendDataBoundItems="true" CssClass="customSelect"  Width="90%">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCantidad" runat="server" CssClass="il_txt_campos" MaxLength="10" Style="margin-bottom: 1%"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="Label7" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbMaterial" runat="server" AppendDataBoundItems="true" AutoPostBack="true" CssClass="customSelect"  Width="90%">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="Label5" CssClass="il_lb_campos" runat="server">Observaciones</asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label9" CssClass="il_lb_campos" runat="server">Precio Unitario</asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label11" CssClass="il_lb_campos" runat="server">Precio Parcial</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" CssClass="custom-dropdown">
                                <asp:DropDownList ID="cmbObservaciones" runat="server" AppendDataBoundItems="true" CssClass="customSelect"  Width="90%">
                                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="il_txt_campos"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPrecioParcial" runat="server" CssClass="il_txt_campos"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:center">
                            <asp:Button ID="btnAgregar" CssClass="il_botones" runat="server" Text="Agregar Detalle" Width="150px" OnClick="btnAgregar_Click" />
                        </td>
                    </tr>
                </table>

                 <div id="FacturasPagoServicio">
                     <asp:Repeater id="rptDetallePago" runat="server" >
                        <HeaderTemplate>
                            <table class="tbGrilla">
                                <tr class="trTitulo">
                                    <td class="titulo_grilla " colspan="6">Detalle de Materiales</td>
                                </tr>
                                <tr  class="trSubTitulo">   
                                    <td>Item</td>
                                    <td>Unidad</td>
                                    <td>Cantidad</td>
                                    <td>Descripcion</td>                                        
                                    <td>Precio Unitario</td>
                                    <td>Precio Parcial</td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="trSubTitulo_item" style="background-color: #F7F6F2">
                                <td style="text-align:left">
                                   
                                    <asp:Label ID="lblItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Item")%>'></asp:Label>                                       
                                </td>
                                <td style="text-align:left">
                                    <asp:Label ID="lblDesc_Unidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Unidad")%>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblCantidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cantidad")%>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDes_Material" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Material")%>'></asp:Label>
                                </td>
                                <td style="text-align:right">
                                    <asp:Label ID="lblPrecio_Unitario" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Precio_Unitario")%>'></asp:Label>
                                    <%--<asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="il_txt_campos" MaxLength="10" ></asp:TextBox>--%>
                                </td>
                                 <td>
                                     <asp:Label ID="lblPrecioParcial" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Precio_Parcial")%>'></asp:Label>
                                 </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate >
                            <tr class="trSubTitulo_item">
                                <td style="text-align:left">
                                  
                                    <asp:Label ID="lblItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Item")%>'></asp:Label>                                       
                                </td>
                                <td style="text-align:left">
                                    <asp:Label ID="lblDesc_Unidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Unidad")%>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblCantidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cantidad")%>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDes_Material" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Material")%>'></asp:Label>
                                </td>
                                <td style="text-align:right">
                                    <asp:Label ID="lblPrecio_Unitario" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Precio_Unitario")%>'></asp:Label>
                                    <%--<asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="il_txt_campos" MaxLength="10" ></asp:TextBox>--%>
                                </td>
                                 <td>
                                     <asp:Label ID="lblPrecioParcial" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Precio_Parcial")%>'></asp:Label>
                                 </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            <tr class="trSubTitulo">
                                <td class="titulo_grilla " style="text-align: right; border-top-left-radius: 0px; border-top-right-radius: 0px;" colspan="6">
                                    <asp:Label ID="lblEtiquetaCuota" runat="server" Font-Bold="true" Text="Total Solicitud: "></asp:Label>
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblTotalCuota" runat="server" ></asp:Label>
                                </td>
                            </tr>
                            </table>
                          </FooterTemplate>
                    </asp:Repeater>
                     <%--OnItemCommand="dgAutorizacionesTraspasos_ItemCommand" OnItemDataBound="dgAutorizacionesTraspasos_ItemDataBound"--%>
                     <%--<asp:DataGrid ID="dgDetallePlanilla" runat="server" Width="100%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
                         
                            Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Traspasos</td></tr>' CssClass="tbGrilla">
                            <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                            <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                            <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                            <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            <Columns>
                                <asp:BoundColumn DataField="nroAutorizacion" HeaderText="NroAut" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="cuentaOrigen" HeaderText="Cuenta Origen" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="conceptoOrigen" HeaderText="Producto Origen" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="cuentaDestino" HeaderText="Cuenta. Destino" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="conceptoDestino" HeaderText="Producto Destino" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="concepto" HeaderText="Descripción" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="moneda" HeaderText="Moneda" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="codMoneda" HeaderText="codMoneda" Visible="false" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="monto" HeaderText="Monto" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
                                <asp:BoundColumn DataField="firmo" HeaderText="firmo" Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Firmantes" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="firmantes" HeaderStyle-CssClass="firmantes">
                                    <ItemTemplate>
                                        <a class="link_saldo" href="#" onclick="abrirPopUp('Firmantes.aspx?idAutorizacion=<%# DataBinder.Eval(Container.DataItem, "nroAutorizacion")%>');">Firmantes</a>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Autorizar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="chkImgTraspaso" runat="server" CommandName="CheckTraspaso"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                            </Columns>
                            <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                            <EditItemStyle BackColor="#999999" />
                        </asp:DataGrid>--%>
                    
                </div>
                <div style="text-align:center;">
                    <asp:Button ID="btnEnviar" CssClass="il_botones2" runat="server" Text="Registrar Solicitud" OnClick="btnEnviar_Click" />
                </div>
                
            </div>
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
