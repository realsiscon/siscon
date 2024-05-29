﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="frmPersonalx.aspx.cs" Inherits="WebSISCON.frmPersonalx" %>

<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMS" TagName="ucMS" %>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="server">

    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">


        function pageLoad() {
            cargar_random();

            <%--$("#<%= cmbHabilitado.ClientID %>").change(function () {
                bloqueo();
            });--%>


        }
    </script>
</asp:Content>

<asp:Content ID="Contenido" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 id="hTitulo" runat="server" class="titulos">Formulario de Registro de Personal</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />
            <asp:HiddenField ID="hfMensaje" runat="server" />

            <div id="pnlRegistro" runat="server">
                <div class="uk-form-stacked uk-margin-small">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Nuevo" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnRegistrar_Click" />
                </div>
                <div class="uk-form-stacked uk-margin-small" />

                <div id="cuentas_origen">
                    <ul uk-accordion>
                        <li class="uk-open">
                            <a class="uk-accordion-title uk-text-center" href="#">Lista de Personal</a>
                            <div class="uk-accordion-content uk-margin-remove-top uk-overflow-auto">
                                <table class="uk-table uk-table-divider uk-table-hover uk-table-middle uk-table-striped uk-table-small uk-table-responsive cuentasOrigen">
                                    <asp:Repeater ID="rptPersonal" runat="server" OnItemDataBound="rptPersonal_ItemDataBound">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr class="trSubTitulo">
                                                    <th>Código</th>
                                                    <th>Nombre Completo</th>
                                                    <th>Estado</th>
                                                    <th>Editar</th>
                                                </tr>
                                            </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="trSubTitulo_item uk-text-right uk-text-center@s">
                                                <td data-label="Código Cargo" class="uk-text-center@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID_Personal") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Nombre Cargo" class="uk-text-left@s">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblNombres" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NombreCompleto") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Estado">
                                                    <span class="Etiqueta">
                                                        <asp:Label ID="lblDescEstado" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descEstado") %>' />
                                                    </span>
                                                </td>
                                                <td data-label="Editar">
                                                    <span class="Etiqueta">
                                                        <asp:LinkButton ID="lnkEditar" runat="server" CssClass="link_saldo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID_Personal") %>'
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

            <div id="RegistroDatos"  runat="server">
                <div id="panelDatosTransferencia" class="uk-margin-small">
                    <h2 id="hDatosTransferencia" runat="server" class="titulos_secundarios">Datos</h2>
                    <div class="uk-margin-small">
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label6" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Nombres</asp:Label>
                                <asp:TextBox ID="txtNombres" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label1" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Apellido Paterno</asp:Label>
                                <asp:TextBox ID="txtPaterno" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label2" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Apellido Materno</asp:Label>
                                <asp:TextBox ID="txtMaterno" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>     
                        </div>
                         <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-2-3@m">
                                <asp:Label ID="lblDesc" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Direcci&oacute;n</asp:Label>
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
                                </asp:TextBox>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label7" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Telefono Fijo</asp:Label>
                                <asp:TextBox ID="txtFijo" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                        </div>

                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label3" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Telefono Movil</asp:Label>
                                <asp:TextBox ID="txtMovil" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                            <div class="uk-width-1-2 uk-width-2-3@m">
                                <asp:Label ID="Label4" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Mail</asp:Label>
                                <asp:TextBox ID="txtMail" runat="server" CssClass="uk-input uk-form-small" MaxLength="100">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="lblMoneda" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Area</asp:Label>
                                    <asp:DropDownList ID="cmbArea" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true">                                       
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label5" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Cargo</asp:Label>
                                    <asp:DropDownList ID="cmbCargo" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true">                                    
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                           <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label ID="Label8" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Fecha Nacimiento</asp:Label>
                                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="uk-input uk-form-small claseMonto uk-text-left">
                                </asp:TextBox>
                            </div>
                        </div>
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label9" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Estado</asp:Label>
                                    <asp:DropDownList ID="cmbEstado" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true">
                                        <asp:ListItem Value="-1">Seleccionar</asp:ListItem>
                                        <asp:ListItem Value="1">Habilitado</asp:ListItem>
                                        <asp:ListItem Value="0">Deshabilitado</asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                            <div id="divMotivo" runat="server"  class="uk-width-2-3">
                                <asp:Label ID="Label10" runat="server" CssClass="il_lb_campos uk-form-label texto_15">Motivo</asp:Label>
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
                                <asp:Button ID="btnGuardar" runat="server" Text="Registrar Nuevo" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnGuardar_Click" />
                            </div>
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                
                            </div>     
                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnRegistrar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
