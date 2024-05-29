<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSISCON.Login_"  %>



<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <title>Login - SISCON</title>
    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/login.js"></script>
    <script src="assets/js/Teclado.js"></script>

    <style type="text/css">
        #img_icon_verisign {
            border: none;
        }
    </style>
    <script>
        function pageLoad() {
            $("#keyboard").css('display', 'none');
            if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                $('#<%= hfdispositivo.ClientID %>').val(2);
            }
            else {
                $('#<%= hfdispositivo.ClientID %>').val(1);
            }
            $(document).ready(function ($) {
                //restriccion de input
                $('.alphanumerico').mask('AAAAAAAAAAAAAAAAAAAAAAA');
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div id="il_contenedor" class="uk-grid-collapse" uk-grid style="padding-top: 4%">

        <div class="uk-width-1-6@s"></div>
        <div class="uk-width-expand@s">
            <%--<div id="il_mensaje_out" class="mensaje_out uk-padding-small" runat="server">
                <p id="mensajeOutTitulo" class="texto_22 texto_blanco uk-text-center uk-margin-small">POR SEGURIDAD, LA SESION HA CADUCADO</p>
                <p id="mensajeOut" class="texto_16 texto_blanco uk-text-center uk-margin-small">Estimado Cliente, por su seguridad al excederse el límite de inactividad permitido, la sesión ha caducado.</p>
                <p id="mensajeOut2" class="texto_16 texto_blanco uk-text-center uk-margin-remove-vertical">Por favor ingrese nuevamente. Gracias</p>
            </div>--%>

            <div class="borde_gris uk-margin-small">
                <div id="il_cabecera" class="uk-grid-small uk-grid-row-collapse" uk-grid>
                    <div class="uk-width-auto@m">
                        <asp:HiddenField ID="hfdispositivo" runat="server" Value="0" />
                        <span id="il_ingreso_sistema" class="titulo_login texto_gris texto_Bold uk-margin-remove">Ingreso al sistema</span>
                    </div>
                    <div class="uk-width-expand@m">
                        <%--<span class="texto_16 texto_blanco texto_semiBold il_zona_segura uk-align-right uk-margin-remove uk-visible@s" id="zona_segura_normal">Usted se encuentra en una zona segura</span>--%>
                    </div>
                </div>
            </div>

            <%--<div class="uk-hidden@s">
                <span class="il_zona_segura texto_15 texto_semiBold texto_blanco " id="zona_segura_smart" runat="server">Zona segura</span>
            </div>--%>

            <div id="il_datos_usuario" class="uk-grid-collapse uk-margin-small uk-margin-small-top borde_gris" uk-grid>
                <div class="uk-width-1-6@m"></div>
                <div class="uk-width-expand@s">

                    <div class="uk-form-stacked">
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-1@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="lblMoneda" CssClass="uk-form-label texto_15 texto_gris" runat="server">Empresa</asp:Label>
                                    <asp:DropDownList ID="cmbEmpresa" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                        <asp:ListItem Value="1">CORVIC</asp:ListItem>                                        
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                        </div>

                        <div class="uk-margin-small">
                            <asp:Label ID="lblUsuario" CssClass="uk-form-label texto_15 texto_gris" runat="server">Código de usuario:</asp:Label>

                            <div class="uk-inline uk-form-controls uk-width-1-1">
                                <a class="uk-form-icon uk-form-icon-flip" href="#" uk-icon="icon: fa-solid-eye" onclick="mostrar(this,'<%= txtUsuario.ClientID %>','Usuario')" uk-tooltip="Mostrar Usuario"></a>
                                <asp:TextBox ID="txtUsuario" CssClass="uk-input uk-form-small alphanumerico" TextMode="Password" TabIndex="1" AutoCompleteType="Disabled" runat="server" />
                            </div>

                        </div>

                        <div class="uk-margin-small">
                            <asp:Label ID="lblContrasena" CssClass="uk-form-label texto_15 texto_gris" runat="server">Clave de acceso:</asp:Label>
                            <div class="uk-inline uk-form-controls uk-width-1-1">
                                <a class="uk-form-icon uk-form-icon-flip" href="#" uk-icon="icon: fa-solid-eye" onclick="mostrar(this,'<%= txtPassword.ClientID %>','Contraseña')" uk-tooltip="Mostrar Contraseña"></a>
                                <asp:TextBox ID="txtPassword" CssClass="uk-input uk-form-small alphanumerico" TextMode="Password" TabIndex="2" AutoCompleteType="Disabled" runat="server" />                                
                            </div>
                        </div>
                         <% if (!String.IsNullOrEmpty(lblMensajeError.Text))
                                   { %>
                                    <div class="uk-alert-danger" uk-alert>
                                        <a class="uk-alert-close" uk-close></a>
                                        <p>
                                            <asp:Label ID="lblMensajeError" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                <% } %>
                        <div class="uk-grid-small uk-margin-small" uk-grid>
                            <div class="uk-width-1-2@s ">
                                <asp:Button ID="btnContinuarLogin" CssClass="uk-button uk-button-primary uk-width-1-1" runat="server" TabIndex="3" Text="Ingresar" OnClick="btnContinuarLogin_Click" OnClientClick="bloqueo();" />
                            </div>
                            <div class="uk-width-1-2@s">
                                <asp:Button ID="btnCancelar" CssClass="uk-button uk-button-primary uk-width-1-1" runat="server" Text="Cancelar" TabIndex="4" OnClick="btnCancelar_Click" />
                            </div>
                        </div>
                    </div>

                </div>
                <div class="uk-width-1-6@m"></div>
            </div>
        </div>
        <div class="uk-width-1-6@s"></div>
    </div>

</asp:Content>
