<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="frmUsuarioOpcion.aspx.cs" Inherits="WebSISCON.frmUsuarioOpcion" %>

<%@ Register Src="~/Controles/MensajeAlertas.ascx" TagPrefix="ucMS" TagName="ucMS" %>


<asp:Content ID="Header" runat="server" ContentPlaceHolderID="head">
    <link href="assets/css/Teclado.css" rel="stylesheet" />
    <script src="assets/js/Teclado.js"></script>
    <script src="assets/js/jquery.numeric.js"></script>

    <script type="text/javascript">

        //-----------------------------------------------------------------------------------
        function OnTreeClick(evt) {
            var src = window.event != window.undefined ? window.event.srcElement : evt.target;
            var isChkBoxClick = (src.tagName.toLowerCase() == "input" && src.type == "checkbox");
            var t = GetParentByTagName("table", src);
            if (isChkBoxClick) {
                var parentTable = GetParentByTagName("table", src);
                var nxtSibling = parentTable.nextSibling;
                if (nxtSibling && nxtSibling.nodeType == 1) {
                    if (nxtSibling.tagName.toLowerCase() == "div") {
                        CheckUncheckChildren(parentTable.nextSibling, src.checked);
                    }
                }
                CheckUncheckParents(src, src.checked);
            }
        }

        function CheckUncheckChildren(childContainer, check) {
            var childChkBoxes = childContainer.getElementsByTagName("input");
            var childChkBoxCount = childChkBoxes.length;
            for (var i = 0; i < childChkBoxCount; i++) {
                childChkBoxes[i].checked = check;
            }
        }

        function CheckUncheckParents(srcChild, check) {
            var parentDiv = GetParentByTagName("div", srcChild);
            var parentNodeTable = parentDiv.previousSibling;

            if (parentNodeTable) {
                var checkUncheckSwitch;
                var isAllSiblingsChecked = AreAllSiblingsChecked(srcChild);
                if (isAllSiblingsChecked) {
                    checkUncheckSwitch = true;
                }
                else {
                    checkUncheckSwitch = false;
                }
                var inpElemsInParentTable = parentNodeTable.getElementsByTagName("input");
                if (inpElemsInParentTable.length > 0) {
                    var parentNodeChkBox = inpElemsInParentTable[0];
                    parentNodeChkBox.checked = checkUncheckSwitch;

                    CheckUncheckParents(parentNodeChkBox, checkUncheckSwitch);
                }
            }
        }

        function AreAllSiblingsChecked(chkBox) {
            var parentDiv = GetParentByTagName("div", chkBox);
            var childCount = parentDiv.childNodes.length;
            var k = 0;
            var j = 0;

            for (var i = 0; i < childCount; i++) {
                if (parentDiv.childNodes[i].nodeType == 1) {
                    j = i;
                    if (parentDiv.childNodes[i].tagName.toLowerCase() == "table") {
                        //var prevChkBox = parentDiv.childNodes[j].getElementsByTagName("input")[0];
                        if (parentDiv.childNodes[j].getElementsByTagName("input")[0] == undefined)
                            j = j + 1;
                        else {
                            var prevChkBox = parentDiv.childNodes[j].getElementsByTagName("input")[0];
                            //if any of sibling nodes are not checked, return false
                            if (prevChkBox.checked) {
                                //add each selected node one value
                                k = k + 1;
                            }
                        }


                    }
                }
            }

            //Finally check any one of child node is select if selected yes then return ture parent node check

            if (k > 0) {
                return true;
            }
            else {
                return false;
            }
        }

        //utility function to get the container of an element by tagname
        function GetParentByTagName(parentTagName, childElementObj) {
            var parent = childElementObj.parentNode;
            //while (parent.tagName.toLowerCase() != parentTagName.toLowerCase()) {
            var par = parent.tagName;
            var par_tag = parentTagName;

            try {
                while (par != null && (par.toLowerCase() != par_tag.toLowerCase())) {
                    parent = parent.parentNode;
                    par = parent.tagName;
                    if (par === undefined)
                        par = null;
                }
            } catch (e) {

            }

            return parent;
        }


        function pageLoad() {

            cargar_random();

            $("#<%= cmbUsuario.ClientID %>").change(function () {
                bloqueo();
            });



        };
    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="updGeneral" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h1 id="hTitulo" class="titulos">Asignacion de Opciones a Usuario</h1>
            <ucMS:ucMS runat="server" ID="ucAlertas" />
            <asp:HiddenField ID="hddOpcionesMarcadas" runat="server" />

            <div id="RegistroDatos" runat="server">
                <div class="uk-margin-small">
                    <h2 id="hDatosTransferencia" runat="server" class="titulos_secundarios">Datos</h2>
                    <div class="uk-margin-small">
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <asp:Label runat="server" CssClass="custom-dropdown">
                                    <asp:Label ID="Label9" CssClass="il_lb_campos uk-form-label texto_15" runat="server">Usuario</asp:Label>
                                    <asp:DropDownList ID="cmbUsuario" runat="server" CssClass="customSelect uk-select uk-form-small" AppendDataBoundItems="true" OnSelectedIndexChanged="cmbUsuario_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                </asp:Label>
                            </div>
                        </div>
                        <div uk-grid class="uk-grid-small">
                            <div class="uk-width-1-2 uk-width-1-3@m">
                                <div class="uk-form-stacked uk-margin-small">
                                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Opciones" CssClass="uk-button uk-button-primary uk-width-medium@s" OnClick="btnRegistrar_Click" />
                                </div>
                            </div>
                        </div>
                    <div uk-grid class="uk-grid-small">
                        <asp:TreeView ID="trOpciones" runat="server" CssClass="il_lb_campos" ForeColor="Blue" ExpandDepth="0" ShowExpandCollapse="true" ShowCheckBoxes="All"
                            onclick="OnTreeClick(event)" PopulateNodesFromClient="true">
                            <LevelStyles>
                                <asp:TreeNodeStyle ChildNodesPadding="10"
                                    Font-Bold="true"
                                    Font-Size="12pt"
                                    ForeColor="DarkGreen" />
                                <asp:TreeNodeStyle ChildNodesPadding="5"
                                    Font-Bold="true"
                                    Font-Size="10pt" />

                            </LevelStyles>
                        </asp:TreeView>
                    </div>
                </div>
            </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnRegistrar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="trOpciones" EventName="TreeNodeCheckChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
