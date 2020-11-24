<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CrearUsuario.ascx.cs" Inherits="Joagraphic.DesktopModules.Security.CrearUsuario" %>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<table style="z-index: 101; left: 8px; position: absolute; top: 8px" height="100%"
    cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td style="height: 10px" valign="top">
            <%--<uc1:banner id="Banner1" runat="server"></uc1:banner>--%>
        </td>
    </tr>
    <tr>
        <td valign="top" align="center" bgcolor="#ffffff">
            <table class="TablaNormal" id="Table1" style="height: 196px" cellspacing="0" cellpadding="0"
                width="100%" align="left" border="0">
                <tr height="8">
                    <td style="width: 8px">
                    </td>
                    <td colspan="2">
                    </td>
                    <td style="width: 8px">
                    </td>
                </tr>
                <tr height="20">
                    <td style="width: 8px; height: 20px" bgcolor="#4a3c8c">
                    </td>
                    <td style="width: 459px; height: 20px" valign="middle" bgcolor="#4a3c8c">
                        <asp:Label ID="lblTitulo" runat="server" CssClass="EtiquetaTitulo" Width="304px">Seguridad > Creación y actualización de usuarios</asp:Label>
                    </td>
                    <td style="height: 20px" valign="middle" align="right" bgcolor="#4a3c8c">
                        <%--<uc1:navegacion id="Navegacion1" runat="server"></uc1:navegacion>--%>
                    </td>
                    <td style="width: 8px; height: 20px" bgcolor="#4a3c8c">
                    </td>
                </tr>
                <tr>
                    <td style="width: 8px; height: 11px">
                    </td>
                    <td style="height: 11px" colspan="2">
                    </td>
                    <td style="width: 8px; height: 11px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 13px">
                    </td>
                    <td valign="top" colspan="2">
                        <table class="TablaNormal" id="Table5" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td style="width: 134px; height: 31px">
                                    <asp:Label ID="lblCodigo" runat="server">Código:</asp:Label>
                                </td>
                                <td style="width: 684px; height: 31px">
                                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="TextoBloqueado" Width="100px"
                                        ReadOnly="True"></asp:TextBox>&nbsp;
                                    <asp:ImageButton ID="ibtnBuscar" runat="server" CausesValidation="False" ImageUrl="../../images/Buscar.gif">
                                    </asp:ImageButton>&nbsp;
                                    <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" CssClass="ValidadorNormal"
                                        ControlToValidate="txtCodigo">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 134px; height: 31px">
                                    <asp:Label ID="lblNombre" runat="server">Nombre del empleado:</asp:Label>
                                </td>
                                <td style="width: 684px; height: 31px">
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="TextoBloqueado" Width="300px"
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 134px; height: 31px">
                                    <asp:Label ID="lblCategoria" runat="server">Categoría:</asp:Label>
                                </td>
                                <td style="width: 684px; height: 31px">
                                    <asp:TextBox ID="txtCategoria" runat="server" CssClass="TextoBloqueado" Width="300px"
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 134px; height: 31px">
                                    <asp:Label ID="lblUsuario" runat="server">Usuario:</asp:Label>
                                </td>
                                <td style="width: 684px; height: 31px">
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="TextoNormal" Width="300px"
                                        MaxLength="25"></asp:TextBox>&nbsp;
                                    <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" CssClass="ValidadorNormal"
                                        ControlToValidate="txtUsuario">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <asp:Panel ID="pnlPassword" runat="server">
                                <tr>
                                    <td style="width: 134px; height: 31px">
                                        <asp:Label ID="lblPassword" runat="server">Contraseña:</asp:Label>
                                    </td>
                                    <td style="width: 684px; height: 31px">
                                        <asp:TextBox ID="txtPassword" runat="server" Width="300px" CssClass="TextoNormal"
                                            MaxLength="25" TextMode="Password"></asp:TextBox>&nbsp;
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" CssClass="ValidadorNormal"
                                            ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 134px; height: 31px">
                                        <asp:Label ID="lblRepetir" runat="server">Confirme contraseña:</asp:Label>
                                    </td>
                                    <td style="width: 684px; height: 31px">
                                        <asp:TextBox ID="txtRepetir" runat="server" Width="300px" CssClass="TextoNormal"
                                            MaxLength="25" TextMode="Password"></asp:TextBox>&nbsp;
                                        <asp:RequiredFieldValidator ID="rfvRepetir" runat="server" CssClass="ValidadorNormal"
                                            ControlToValidate="txtRepetir">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cmvPassword" runat="server" CssClass="ValidadorNormal"
                                            ControlToValidate="txtRepetir" ControlToCompare="txtPassword">*</asp:CompareValidator>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="pnlComentarios" runat="server">
                                <tr>
                                    <td style="width: 134px">
                                    </td>
                                    <td style="width: 684px">
                                        <asp:CheckBox ID="chkActivo" runat="server" Checked="True" Text="  Usuario activo">
                                        </asp:CheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 134px" height="30">
                                    </td>
                                    <td style="width: 684px" valign="middle" height="30">
                                        <asp:CheckBox ID="chkCambiar" runat="server" Checked="True" Text=" Cambiar la contraseña en el próximo ingreso">
                                        </asp:CheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 134px; height: 31px" valign="top">
                                        <asp:Label ID="lblComentarios" runat="server">Comentarios:</asp:Label>
                                    </td>
                                    <td style="width: 684px; height: 31px">
                                        <asp:TextBox ID="txtComentarios" runat="server" Width="300px" CssClass="TextoNormal"
                                            MaxLength="255" TextMode="MultiLine" Height="49px"></asp:TextBox>
                                    </td>
                                </tr>
                            </asp:Panel>
                        </table>
                    </td>
                    <td style="width: 13px">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right" bgcolor="#ffffff" height="1">
            <table id="Table4" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td width="8">
                    </td>
                    <td align="right">
                        <asp:Button ID="btnCambiar" runat="server" CssClass="BotonNormal" Text="Cambiar contraseña">
                        </asp:Button><asp:Button ID="btnAceptar" runat="server" CssClass="BotonNormal" Text="Salvar" OnClick="btnAceptar_Click">
                        </asp:Button><asp:Button ID="btnCancelar" runat="server" CssClass="BotonNormal" Text="Regresar" OnClick="btnCancelar_Click"
                            CausesValidation="False"></asp:Button>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr height="8">
        <td bgcolor="#ffffff">
        </td>
    </tr>
    <tr>
        <td class="ValidadorSumarioNormal" align="center" height="1">
            <table class="TablaNormalEspecial" id="Table3" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td width="8">
                    </td>
                    <td>
                        <asp:ValidationSummary ID="vsmErrores" runat="server" CssClass="ValidadorSumarioNormal"
                            Width="784px" DisplayMode="List"></asp:ValidationSummary>
                        <asp:Label ID="lblError" runat="server" CssClass="ValidadorSumarioNormal"></asp:Label>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right" bgcolor="#5375a4" height="1">
            <table class="TablaNormal" id="Table2" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td width="8">
                    </td>
                    <td style="width: 422px">
                        <font color="#ccccff">ESSEP002A</font>
                    </td>
                    <td align="right">
                        <font color="#ccccff">Información restringida - Clasificación DC2</font></FONT>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
