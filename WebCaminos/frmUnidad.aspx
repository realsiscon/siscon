<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="frmUnidad.aspx.cs" Inherits="WebSISCON.frmUnidad" %>

<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMS" TagName="ucMS" %>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">

    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">


        function pageLoad() {
            cargar_random();

            $("#<%= cmbEstado.ClientID %>").change(function () {
                bloqueo();
            });

            <%--$("#<%= cmbPrincipal.ClientID %>").change(function () {
                bloqueo();
            });--%>
        }

    </script>
</asp:Content>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <h1 id="hTitulo" class="titulos">Formulario de Registro de Unidad de Medida</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />

            <div id="pnlRegistro" runat="server">
                <div class="uk-form-stacked uk-margin-small">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Nuevo" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnRegistrar_Click" />
                </div>

                <div class="uk-form-stacked uk-margin-small" />

                <div id="cuentas_origen">
                    <ul uk-accordion>
                        <li class="uk-open">
                            <a class="uk-accordion-title uk-text-center" href="#">Unidades de Medida</a>
                            <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                                <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                                    <asp:Repeater ID="rptUnidades" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr class="trSubTitulo">
                                                    <th>ID</th>
                                                    <th>Descripcion</th>
                                                    <th>Estado</th>
                                                    <th>Editar</th>
                                                </tr>
                                            </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                                <td data-label="ID" class="uk-text-center@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cod_unidad") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Descripcion">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label9" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descripcion") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Estado" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descEstado") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Editar">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkEditar" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cod_unidad") %>'
                                                            OnCommand="lnkEditar_Command" Text="Editar">
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

            <div id="RegistroDatos" runat="server">
                <div class="uk-margin-small">
                    <h2 id="hDatosTransferencia" runat="server" class="titulos_secundarios">Datos</h2>
                    <div class="uk-margin-small">
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label8" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Nombre Unidad</asp:Label>
                                <asp:TextBox ID="txtUnidad" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                            
                                <div class="uk-width-1-2 uk-width-1-3@m">
                                    <asp:Label runat="server" CssClass="custom-dropdown">
                                        <asp:Label ID="Label9" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Estado</asp:Label>
                                        <asp:DropDownList ID="cmbEstado" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="cmbEstado_SelectedIndexChanged">
                                            <asp:ListItem Value="-1">Seleccionar</asp:ListItem>
                                            <asp:ListItem Value="1">Habilitado</asp:ListItem>
                                            <asp:ListItem Value="0">Deshabilitado</asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:Label>
                                </div>
                                <div id="divMotivo" runat="server" class="uk-width-1-3">
                                    <asp:Label ID="Label3" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Motivo Deshabilitaci&oacute;n</asp:Label>
                                    <asp:TextBox ID="txtMotivo" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
                                    </asp:TextBox>
                                </div>
                            
                        </div>
                    </div>
                </div>
                <div class="uk-margin-small">
                    <div uk-grid class="uk-grid-small">
                        <div class="uk-width-1-2 uk-width-1-3@m">
                        </div>
                        <div class="uk-width-1-2 uk-width-1-3@m">
                            <asp:Button ID="btnEnviar" runat="server" Text="Guardar Registro" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnEnviar_Click" />
                        </div>
                        <div class="uk-width-1-2 uk-width-1-3@m">
                        </div>
                    </div>
                </div>

            </div>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
