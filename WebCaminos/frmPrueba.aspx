<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="frmPrueba.aspx.cs" Inherits="WebSISCON.frmPrueba" %>

<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMA" TagName="ucMA" %>

<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="assets/css/Teclado.css" rel="stylesheet"/>
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">
        function numberWithCommas(x) {
            var parts = x.toString().split(".");
            parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            return parts.join(".");
        }

        function pageLoad() {
            cargar_random();
            loadpage();
        }

        function MsjConfirm(element) {
            var moneda = $("#<%= cbmMoneda.ClientID %> option:selected").text();
            var monto = $("#<%= txtMonto.ClientID %>").val();
            var beneficiario = $("#<%= hfMensaje.ClientID %>").val();
            monto = numberWithCommas(monto);
            var mensaje = "¿Confirma que desea realizar la transacción?";
            if (moneda !== "Seleccionar" && monto !== "" && monto !== "." && beneficiario !== "") {
                mensaje = "¿Confirma que desea realizar la transacción por un monto de " + monto + " " + moneda + ", a la cuenta " + beneficiario + "?";
            }
            UIkit.modal.confirm(mensaje, { 'labels': { 'cancel': 'Cancelar', 'ok': 'Aceptar' } }).then(function () {
                bloqueo();
                __doPostBack(element.name, "");
            }, function () {
            });
            return false;
        }

        function MsjEliminar(element) {
            var mensaje = "¿Está seguro que desea realizar la operación?";
            UIkit.modal.confirm(mensaje, { 'labels': { 'cancel': 'Cancelar', 'ok': 'Aceptar' } }).then(function () {
                bloqueo();
                location.href = element.href;
            }, function () {
            });
            return false;
        }
        function BlockAgregarCtaExterna() {
            bloqueo();
        }
    </script>
</asp:Content>
<asp:Content ID="Contenido" runat="server" ContentPlaceHolderID="ContentPlaceHolder">
<asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<h1 id="hTitulo" runat="server" class="titulos">A cuentas de otros Bancos</h1>
<asp:HiddenField ID="hfMensaje" runat="server"/>
<ucMA:ucMA runat="server" ID="ucAlertas"/>
<div id="TransferenciasACH" runat="server">
    <div>
        <div id="cuentas_origen">
            <ul uk-accordion>
                <li class="uk-open">
                    <a class="uk-accordion-title uk-text-center" href="#">Cuentas Origen</a>
                    <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                        <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                            <asp:Repeater ID="rptCuentasPropias" runat="server" OnItemDataBound="rptCuentasPropias_ItemDataBound">
                                <HeaderTemplate>
                                    <thead>
                                    <tr class="trSubTitulo">
                                        <th>Cuenta</th>
                                        <th>Producto</th>
                                        <th>Tipo de Manejo</th>
                                        <th>Saldo Disponible</th>
                                        <th>Moneda</th>
                                    </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                        <td data-label="Cuenta" class="uk-text-left@s">
                                            <span class="Etiqueta">
                                                <asp:RadioButton ID="rdbSeleccionar" GroupName="rbGrupo" runat="server"/>
                                                <asp:Label ID="lblCuenta" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "nroCuenta") %>'/>
                                            </span>
                                        </td>
                                        <td data-label="Producto">
                                         <span class="Etiqueta">
                                            <asp:Label ID="lblConcepto" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "concepto") %>' />
                                         </span>
                                        </td>
                                        <td data-label="Tipo de Manejo">
                                         <span class="Etiqueta">
                                            <asp:Label ID="lblTipo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tipo") %>'/>
                                         </span>
                                        </td>
                                        <td data-label="Saldo Disponible" class="uk-text-right@s">
                                         <span class="Etiqueta">
                                            <asp:Label ID="lblSaldo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "saldo") %>' />
                                         </span>
                                        </td>
                                        <td data-label="Moneda">
                                         <span class="Etiqueta">
                                            <asp:Label ID="lblMoneda" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descMoneda") %>' />
                                            <asp:Label ID="lblCodMoneda" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "moneda") %>'/>
                                            <asp:Label ID="lblProducto" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "producto") %>'
                                                       Visible="false">
                                            </asp:Label>
                                         </span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </li>
            </ul>
        </div>
        <div id="cuentas_destino">
            <ul uk-accordion>
                <li class="uk-open">
                    <a class="uk-accordion-title uk-text-center" href="#">Cuentas Destino</a>
                    <div class="uk-accordion-content uk-margin-small-top uk-overflow-auto">
                        <table id="cuentasDestino" class="uk-table uk-table-divider uk-table-middle uk-table-hover uk-table-striped uk-table-small uk-table-responsive cuentasDestino">
                            <asp:Repeater ID="rptCuentasExternas" runat="server" OnItemDataBound="rptCuentasExternas_ItemDataBound">
                                <HeaderTemplate>
                                    <thead>
                                    <tr class="trSubTitulo">
                                        <th>Entidad</th>
                                        <th>Cuenta Destino</th>
                                        <th>Tipo de Cuenta</th>
                                        <th>Nombre del Titular</th>
                                        <th>Acci&oacute;n</th>
                                    </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="trSubTitulo_item">
                                        <td data-label="Entidad" class="uk-text-left@s" style="width: 150px">
                                            <span class="Etiqueta">
                                                <asp:RadioButton ID="rdbSeleccionarDestino" GroupName="rbGrupoTerceros" runat="server" AutoPostBack="true" OnCheckedChanged="SelecionCuenta"/>
                                                <asp:Label ID="lblentidad" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "entidadDesc") %>'/>
                                                <asp:Label ID="lblcodentidad" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "entidad") %>'/>
                                            </span>
                                        </td>
                                        <td data-label="Cuenta Destino">
                                            <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cuenta") %>' class="Etiqueta"/>
                                        </td>
                                        <td data-label="Tipo de Cuenta" class="uk-text-left@s">
                                            <span class="Etiqueta">
                                                <asp:Label ID="lblTipoCuentaDesc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tipoDesc") %>'/>
                                                <asp:Label ID="lblTipoCuentaCod" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "tipoCod") %>'/>
                                                <asp:Label ID="lblTipoCuentaId" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "idTipoCuenta") %>'/>
                                                <asp:Label ID="Label2" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "moneda") %>'/>
                                            </span>
                                        </td>
                                        <td data-label="Nombre del Titular" class="uk-text-left@s">
                                            <span class="Etiqueta">
                                                <asp:Label ID="lblNombre" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "titular") %>'/>&nbsp;
                                                <asp:Label ID="lblcinit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "cinit") %>'/>
                                            </span>
                                        </td>
                                        <td data-label="Acci&oacute;n">
                                            <span class="Etiqueta">
                                                <asp:LinkButton ID="lnkEliminar" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cuenta") %>'
                                                                OnCommand="lnkEliminar_Command" Text="Eliminar" OnClientClick="return MsjEliminar(this)">
                                                </asp:LinkButton>
                                            </span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div id="panelDatosTransferencia" class="uk-margin-small">
        <h2 id="hDatosTransferencia" runat="server" class="titulos_secundarios">Datos de la Transferencia</h2>
        <div class="uk-margin-small">
            <div uk-grid class="uk-grid-small">
                <div class="uk-width-1-2 uk-width-1-4@m">
                    <asp:Label ID="Label6" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Monto</asp:Label>
                    <asp:TextBox ID="txtMonto" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-right" AutoPostBack="True" OnTextChanged="txtMonto_TextChanged">
                    </asp:TextBox>
                </div>

                <div class="uk-width-1-2 uk-width-1-4@m">
                    <asp:Label runat="server" CssClass="custom-dropdown">
                        <asp:Label ID="Label3" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Moneda</asp:Label>
                        <asp:DropDownList ID="cbmMoneda" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true"  AutoPostBack="true" OnSelectedIndexChanged="cbmMoneda_SelectedIndexChanged">
                            <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                        </asp:DropDownList>
                    </asp:Label>
                </div>
                <div class="uk-width-1-1">
                    <asp:Label ID="lblDesc" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Descripci&oacute;n</asp:Label>
                    <asp:TextBox ID="txtDesc" runat="server" CssClass="uk-input uk-form-small" MaxLength="30">
                    </asp:TextBox>
                </div>
            </div>
        </div>

        <div class="uk-margin-medium" uk-alert>
            <asp:Label ID="LblMsjACH" runat="server">
                Solo se validar&aacute; el n&uacute;mero de cuenta de beneficiario, por lo que es responsabilidad del ordenante verificar la informaci&oacute;n registrada.
            </asp:Label>
        </div>
        <div id="mostrar1" runat="server" visible="false" class="uk-margin-small">
            <asp:Label ID="lblOrigenFondo" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Or&iacute;gen de los Fondos</asp:Label>
            <asp:TextBox ID="TextBoxOrigenFondo" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
            </asp:TextBox>
        </div>
        <div id="mostrar2" runat="server" visible="false" class="uk-margin-small">
            <asp:Label ID="lblDestinoFondo" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Destino de los Fondos</asp:Label>
            <asp:TextBox ID="TextBoxDestinoFondo" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
            </asp:TextBox>
        </div>
        <div id="mostrar3" runat="server" visible="false" class="uk-margin-small">
            <asp:Label ID="Label8" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Motivo de la Transacción</asp:Label>
            <asp:TextBox ID="TextBoxMotivo" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
            </asp:TextBox>
        </div>
    </div>
    <div class="uk-form-stacked uk-margin-small">
        <!-- Ingreso de OTP para Validacion de Transaccion -->
        <uc1:ucOTP runat="server" ID="ucOTP"/>
        <asp:Button ID="btnTransferir" ValidationGroup="Procesar" runat="server" Text="Procesar" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnTransferir_Click" OnClientClick="return MsjConfirm(this);"/>
    </div>

    <asp:HiddenField ID="cdHidden" runat="server"/>
</div>
</ContentTemplate>
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="btnTransferir" EventName="Click"/>
</Triggers>
</asp:UpdatePanel>
</asp:Content>
