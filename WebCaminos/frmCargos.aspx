<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="frmCargos.aspx.cs" Inherits="WebSISCON.frmCargos" %>

<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMS" TagName="ucMS" %>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">

    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">


        function pageLoad() {
            cargar_random();

            $("#<%= cmbHabilitado.ClientID %>").change(function () {
                bloqueo();
            });


        }
    </script>
</asp:Content>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 id="hTitulo" runat="server" class="titulos">Formulario de Registro de Cargos</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />
            <asp:HiddenField ID="hfMensaje" runat="server" />

            <div id="CargosEmpresa" runat="server">
                <div class="uk-form-stacked uk-margin-small">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Nuevo" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnRegistrar_Click" />
                </div>
                <div class="uk-form-stacked uk-margin-small" />

                <div id="cuentas_origen">
                    <ul uk-accordion>
                        <li class="uk-open">
                            <a class="uk-accordion-title uk-text-center" href="#">Cuentas Origen</a>
                            <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                                <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                                    <asp:Repeater ID="rptCargos" runat="server" OnItemDataBound="rptCargos_ItemDataBound">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr class="trSubTitulo">
                                                    <th>Código Cargo</th>
                                                    <th>Nombre Cargo</th>
                                                    <th>Estado</th>
                                                    <th>Editar</th>
                                                </tr>
                                            </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                                <td data-label="Código Cargo" class="uk-text-center@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID_Cargo") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Nombre Cargo" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblDescripcion" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descripcion") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Estado">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblDescEstado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descEstado") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Editar">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkEditar" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID_Cargo") %>'
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
                <div id="panelDatosTransferencia" class="uk-margin-small">
                    <h2 id="hDatosTransferencia" runat="server" class="titulos_secundarios">Datos</h2>
                    <div class="uk-margin-small">
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-4@m">
                                <asp:Label ID="Label6" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Nombre del Cargo</asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left" >
                                </asp:TextBox>
                            </div>

                            <div class="uk-width-1-2 uk-width-1-4@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="lblMoneda" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Estado</asp:Label>
                                    <asp:DropDownList ID="cmbHabilitado" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="cmbHabilitado_SelectedIndexChanged">
                                        <asp:ListItem Value="-1">Seleccionar</asp:ListItem>
                                        <asp:ListItem Value="1">Habilitado</asp:ListItem>
                                        <asp:ListItem Value="0">Deshabilitado</asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                            <div id="divMotivo" runat="server" visible="false" class="uk-width-1-">
                                <asp:Label ID="lblDesc" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Motivo de Deshabilitaci&oacute;n</asp:Label>
                                <asp:TextBox ID="txtMotivo" runat="server" CssClass="uk-input uk-form-small" MaxLength="80">
                                </asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="uk-form-stacked uk-margin-small">
                        <asp:Button ID="btnGuardar" runat="server" Text="Registrar Nuevo" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnGuardar_Click" />
                    </div>
                 
                </div>
            </div>
            <asp:HiddenField ID="hddID_Cargo" runat="server"  Value="0" />
        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnRegistrar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
