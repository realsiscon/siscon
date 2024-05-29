<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="frmProyecto_Material.aspx.cs" Inherits="WebSISCON.frmProyecto_Material" %>

<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="Estilos/Teclado.css" rel="stylesheet" />
    <link href="Estilos/Teclado.css" rel="stylesheet" />
    <link href="Estilos/Responsive-Grilla.css" rel="stylesheet" />
    <script src="JavaScript/Utilidades.js"></script>
    <script src="JavaScript/Teclado.js"></script>
    <link href="Estilos/Autorizaciones.css" rel="stylesheet" />
    <script src="JavaScript/jquery.numeric.js"></script>
    <script src="JavaScript/jquery.blockUI.js"></script>
    <script src="JavaScript/Autorizaciones.js"></script>

    <link href="Estilos/PopupPersonalizado.css" rel="stylesheet" />
    <script src="JavaScript/PopupPersonalizado.js"></script> 
    <script type="text/javascript">
        function pageLoad() {
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
            loadCombos();

            cargar_random();
            validar_responsive();

            $('#Block_div').click(function () {
                $.unblockUI();
            });

        }

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

            <h1 id="hTitulo" class="titulos" style="margin-right: 10px; padding-top: 10px;">Busqueda de Proyectos</h1>
            <asp:UpdatePanel ID="updLabel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="il_lb_error">
                        <asp:Label ID="lblMensajeError" runat="server"></asp:Label><br />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="divGeneral" runat="server" style="margin-bottom: 15px;">

                <div id="divPendienteTraspasos" runat="server">                   
                    <div id="traspasos_pendientes" style="margin-right: 20px;">
                        <asp:DataGrid ID="dgProyectos" runat="server" Width="100%" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1"
                            OnItemCommand="dgProyectos_ItemCommand"
                            Caption='<tr class="trTitulo"><td class="titulo_grilla " colspan="9">Proyectos</td></tr>' CssClass="tbGrilla">
                            <SelectedItemStyle Font-Bold="True" ForeColor="#333333" BackColor="#E2DED6"></SelectedItemStyle>
                            <AlternatingItemStyle CssClass="trSubTitulo_item" BackColor="#FFFFFF"></AlternatingItemStyle>
                            <ItemStyle CssClass="trSubTitulo_item" BackColor="#F7F6F2"></ItemStyle>
                            <HeaderStyle CssClass="trSubTitulo"></HeaderStyle>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                            <Columns>

                                <asp:BoundColumn DataField="ID_proyecto" HeaderText="ID Proyecto" Visible="false" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Cod_proyecto" HeaderText="Codigo Proyecto" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Nomb_Proyecto" HeaderText="Nombre Proyecto" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Director_Obra" HeaderText="Director" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Fiscal_Obra" HeaderText="Fiscal Obra" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Nombre_cliente" HeaderText="Cliente" ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:BoundColumn DataField="descEstado" HeaderText="Estado" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Editar" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                                    <ItemTemplate>                                        
                                        <asp:ImageButton ID="chkImgEditar" runat="server" CommandName="Editar" ImageUrl= "../Imagenes/check.png" onmouseover="this.src='../Imagenes/check_.png'" onmouseout="this.src='../Imagenes/check.png'" ToolTip="Seleccionar Proyecto"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle CssClass="" Mode="NumericPages"></PagerStyle>
                            <EditItemStyle BackColor="#999999" />
                        </asp:DataGrid>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
           <%-- <asp:AsyncPostBackTrigger ControlID="btnPagarAutorizacion" EventName="Click" />--%>
            <%--<asp:AsyncPostBackTrigger ControlID="btnPagarAutorizacionSmart" EventName="Click"/>--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
