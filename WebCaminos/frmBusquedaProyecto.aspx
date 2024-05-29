<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="frmBusquedaProyecto.aspx.cs" Inherits="WebSISCON.frmBusquedaProyecto" %>
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
            <h1 id="hTitulo" class="titulos" >Proyectos</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />
            <%--<asp:HiddenField ID="hfMensaje" runat="server" />--%>
           
            <div id="pnlRegistro" runat="server">
                <div class="uk-form-stacked uk-margin-small">
                    <asp:Button ID="btnRegistrarNuevo" runat="server" Text="Registrar Nuevo" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnRegistrarNuevo_Click" />
                </div>
                <div class="uk-form-stacked uk-margin-small" />

                <div id="cuentas_origen">
                    <ul uk-accordion>
                        <li class="uk-open">
                            <a class="uk-accordion-title uk-text-center" href="#">Proyectos</a>
                            <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                                <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                                    <asp:Repeater ID="rptProyectos" runat="server" >
                                        <HeaderTemplate>
                                            <thead>
                                                <tr class="trSubTitulo">
                                                    <th>ID</th>
                                                    <th>Codigo Proyecto</th>
                                                    <th>Nombre Proyecto</th>
                                                    <th>Cliente</th>
                                                    <th>Director</th>
                                                    <th>Fiscal</th>
                                                    <th>Estado</th>
                                                    <th>Editar</th>
                                                </tr>
                                            </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                                <td data-label="ID" class="uk-text-center@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID_proyecto") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Codigo Proyecto">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label9" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Cod_proyecto") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Nombre Proyecto" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblNombres" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nomb_Proyecto") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Cliente" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nombre_cliente") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Director" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Director_Obra") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Fiscal" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Fiscal_Obra") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Estado" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="Label4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descEstado") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Editar">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkEditar" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID_proyecto") %>'
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
                                <asp:Label ID="Label8" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Codigo de Proyecto</asp:Label>
                                <asp:TextBox ID="txtCodProyecto" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label7" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Nombre de Proyecto</asp:Label>
                                <asp:TextBox ID="txtNombreProyecto" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label2" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Cliente</asp:Label>
                                    <asp:DropDownList ID="cmbCliente" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" >
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                        </div>
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-1@m">
                                <asp:Label ID="lblDireccion" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Ubicaci&oacute;n</asp:Label>
                                <asp:TextBox ID="txtUbicacion" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div uk-grid class="uk-grid-small">
                             <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label10" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Director de Obra</asp:Label>
                                    <asp:DropDownList ID="cmbDirectorObra" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" >
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label11" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Fiscal de Obra</asp:Label>
                                    <asp:DropDownList ID="cmbFiscalObra" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" >
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label12" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Almacen Asignado</asp:Label>
                                    <asp:DropDownList ID="cmbAlmacen" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" >
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                        </div>
                        <div uk-grid class="uk-grid-small">
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
                            <div id="divMotivo" runat="server" class="uk-width-2-3">
                                <asp:Label ID="Label3" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Motivo Deshabilitaci&oacute;n</asp:Label>
                                <asp:TextBox ID="txtMotivo" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
                                </asp:TextBox>
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
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEnviar" EventName="Click" />            
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
