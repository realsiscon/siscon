<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="TraspasoAlmacen.aspx.cs" Inherits="WebSISCON.TraspasoAlmacen" %>

<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMS" TagName="ucMS" %>


<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">

    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">
        function soloNumeros(e) {
            var key = window.event ? e.which : e.keyCode;
            if (key < 48 || key > 57) {
                e.preventDefault();
            }
        }

        function pageLoad() {
            cargar_random();
            loadpage();
            $("input.claseMonto").mask("999999999999999.99");

            <%--$("#<%= cmbProyecto.ClientID %>").change(function () {
                bloqueo();
            });--%>


        }
    </script>
</asp:Content>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 id="h1" runat="server" class="titulos">Traspasos de Material a otro Almacen</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />
            <asp:HiddenField ID="hfMensaje" runat="server" />

            <asp:Panel ID="pnlRegistro" runat="server">

                <div id="RegistroDatos" runat="server">
                    <div id="panelDatosTransferencia" class="uk-margin-small">
                        <div class="uk-margin-small">
                            <div uk-grid class="uk-grid-small">
                                <div class="uk-width-1-2 uk-width-1-3@m">
                                    <asp:Label ID="lblDesc" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Nro Orden de Origen</asp:Label>
                                    <asp:TextBox ID="txtNroPedido" runat="server" CssClass="uk-input uk-form-small uk-text-center">
                                    </asp:TextBox>
                                </div>

                                <div class="uk-width-1-2 uk-width-1-3@m">
                                    <asp:Label runat="server" CssClass="custom-dropdown">
                                        <asp:Label ID="lblMoneda" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Almacen Origen</asp:Label>
                                        <asp:DropDownList ID="cmbAlmacenOrigen" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                    </asp:Label>
                                </div>

                                <div class="uk-width-1-2 uk-width-1-3@m">
                                    <asp:Label runat="server" CssClass="custom-dropdown">
                                        <asp:Label ID="Label1" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Almacen Destino</asp:Label>
                                        <asp:DropDownList ID="cmbAlmacenDestino" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="uk-margin-small">
                            <div class="uk-width-1-2 uk-width-2-3@m">
                                <asp:Label ID="Label2" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Descripci&oacute;n</asp:Label>
                                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
                                </asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
            </asp:Panel>


            <h1 id="h2" class="titulos_secundarios">Detalle de Materiales</h1>

            <div class="uk-margin-small">
                <div uk-grid class="uk-grid-small">
                    <div class="uk-width-1-2 uk-width-1-3@m">
                        <asp:Label runat="server" CssClass="custom-dropdown">
                            <asp:Label ID="Label3" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Material</asp:Label>
                            <asp:DropDownList ID="cmbMaterial" runat="server" CssClass="customSelect uk-select uk-form-small">
                            </asp:DropDownList>
                        </asp:Label>
                    </div>
                    <div class="uk-width-1-2 uk-width-1-3@m">
                        <asp:Label runat="server" CssClass="custom-dropdown">
                            <asp:Label ID="Label4" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Unidad</asp:Label>
                            <asp:DropDownList ID="cmbUnidad" runat="server" CssClass="customSelect uk-select uk-form-small">
                            </asp:DropDownList>
                        </asp:Label>
                    </div>
                </div>
            </div>
            <div class="uk-margin-small">
                <div uk-grid class="uk-grid-small">
                    <div class="uk-width-1-2 uk-width-1-3@m">
                        <asp:Label ID="Label5" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Cantidad</asp:Label>
                        <asp:TextBox ID="txtCantidad" runat="server" CssClass="uk-input uk-form-small" onkeypress="return soloNumeros(event)">
                        </asp:TextBox>
                    </div>
                    <div class="uk-width-1-2 uk-width-1-3@m">
                        <asp:Label ID="Label6" runat="server" CssClass="il_lb_campos uk-form-label texto_15 ">Precio Unitario</asp:Label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="uk-input uk-form-small uk-text-right">
                        </asp:TextBox>
                    </div>
                </div>

            </div>

            <div class="uk-margin-small">
                <div uk-grid class="uk-grid-small">
                    <div class="uk-width-1-2 uk-width-1-3@m">
                    </div>
                    <div class="uk-width-1-2 uk-width-1-3@m">
                        <asp:Button ID="btnEnviar" runat="server" Text="Agregar Detalle" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnEnviar_Click" />
                    </div>
                    <div class="uk-width-1-2 uk-width-1-3@m">
                    </div>
                </div>
            </div>

            <div id="cuentas_origen">
                <ul uk-accordion>
                    <li class="uk-open">
                        <a class="uk-accordion-title uk-text-center" href="#">Detalle de Materiales</a>
                        <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                            <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                                <asp:Repeater ID="rptDetallePago" runat="server" OnItemDataBound="rptDetallePago_ItemDataBound">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr class="trSubTitulo">
                                                <th>Item</th>
                                                <th>Unidad</th>
                                                <th>Cantidad</th>
                                                <th>Costo</th>
                                                <th>Costo Total</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                            <td data-label="Item" class="uk-text-center@s">
                                                <span class="Etiqueta">
                                                    <asp:Label ID="lblItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Producto_Nombre") %>' />
                                                </span>
                                            </td>
                                            <td data-label="Unidad">
                                                <span class="Etiqueta">
                                                    <asp:Label ID="lblDesc_Unidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Unidad_Nombre") %>' />
                                                </span>
                                            </td>
                                            <td data-label="Cantidad">
                                                <span class="Etiqueta">
                                                    <asp:Label ID="lblCantidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cantidad") %>' />
                                                </span>
                                            </td>
                                            <td data-label="Costo">
                                                <span class="Etiqueta">
                                                    <asp:Label ID="lblPrecio_Unitario" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Precio_Unitario") %>' />
                                                </span>
                                            </td>
                                            <td data-label="Costo Total">
                                                <span class="Etiqueta">
                                                    <asp:Label ID="lblPrecioParcial" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "costo_total") %>' />
                                                </span>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tfoot>
                                            <tr>
                                                <td class="texto_15 uk-text-right" colspan="4">
                                                    <asp:Label ID="lblEtiquetaCuota" runat="server" Font-Bold="true" Text="Total Solicitud: " />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lblTotalCuota" runat="server" />
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="uk-margin-small">
                <div uk-grid class="uk-grid-small">
                    <div class="uk-width-1-2 uk-width-1-3@m">
                    </div>
                    <div class="uk-width-1-2 uk-width-1-3@m">
                        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Solicitud" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnRegistrar_Click" />
                    </div>
                    <div class="uk-width-1-2 uk-width-1-3@m">
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
