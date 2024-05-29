<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="AutorizarSolicitud.aspx.cs" Inherits="WebSISCON.AutorizarSolicitud" %>


<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMS" TagName="ucMS" %>


<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">

    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">

        function MsjEliminar(element) {
            var mensaje = "¿Está seguro que desea Rechazar la solicitud de Materiales?";
            UIkit.modal.confirm(mensaje, { 'labels': { 'cancel': 'Cancelar', 'ok': 'Aceptar' } }).then(function () {
                bloqueo();
                location.href = element.href;
            }, function () {
            });
            return false;
        }
        function MsjAutorizar(element) {
            var mensaje = "¿Está seguro que desea Autorizar la solicitud de Materiales?";
            UIkit.modal.confirm(mensaje, { 'labels': { 'cancel': 'Cancelar', 'ok': 'Aceptar' } }).then(function () {
                bloqueo();
                location.href = element.href;
            }, function () {
            });
            return false;
        }

        function pageLoad() {
            cargar_random();

           <%-- $("#<%= cmbEstado.ClientID %>").change(function () {
                bloqueo();
            });

            $("#<%= cmbPrincipal.ClientID %>").change(function () {
                bloqueo();
            });--%>

        }

    </script>
</asp:Content>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 id="h1" runat="server" class="titulos">Autorizaciones Pendientes</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />
            <asp:HiddenField ID="hfMensaje" runat="server" />

            <div id="pnlRegistro" runat="server">

                <div id="cuentas_origen">
                    <ul uk-accordion>
                        <li class="uk-open">
                            <a class="uk-accordion-title uk-text-center" href="#">Solicitud de Materiales</a>
                            <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                                <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                                    <asp:Repeater ID="rptAutorizacion" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr class="trSubTitulo">
                                                    <th>Código</th>
                                                    <th>Proyecto/Obra</th>
                                                    <th>Solicitante</th>
                                                    <th>Fecha Registro</th>
                                                    <th>Descripción</th>
                                                    <th>Autorizar</th>
                                                    <th>Rechazar</th>
                                                    <th>Ver Solicitud</th>
                                                </tr>
                                            </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                                <td data-label="Código" class="uk-text-center@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cod_Solicitud") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Proyecto/Obra">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label9" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nomb_Proyecto") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Solicitante">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Solicitante") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Fecha Registro" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblNombres" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Fecha_Registro", "{0:dd/MM/yyyy}") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Descripción" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Descripcion") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Autorizar">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkAutorizar" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cod_Solicitud") %>'
                                                            OnCommand="lnkAutorizar_Command" Text="Autorizar" OnClientClick="return MsjAutorizar(this);">
                                                        </asp:LinkButton>
                                                    </span>
                                                </td>
                                                <td data-label="Rechazar">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkRechazar" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cod_Solicitud") %>'
                                                            OnCommand="lnkRechazar_Command" Text="Rechazar" OnClientClick="return MsjEliminar(this);">
                                                        </asp:LinkButton>
                                                    </span>
                                                </td>
                                                <td data-label="Ver Solicitud">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkVerSolicitud" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Cod_Solicitud") %>'
                                                            OnCommand="lnkVerSolicitud_Command" Text="Ver Solicitud">
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
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
