<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AsistenteConfig.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.AsistenteConfig" %>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<table id="main" cellspacing="0" cellpadding="0" width="100%" border="0" height="100%">
    <tr>
        <td style="height: 10px" valign="top" colspan="2">
            <%--<uc1:banner id="Banner1" runat="server"></uc1:banner>--%>
        </td>
    </tr>
    <tr>
        <td valign="top" align="left" bgcolor="#ffffff" style="height: 395px">
            <table class="TablaNormal" id="Table1" style="height: 196px" cellspacing="0" cellpadding="0"
                border="0" width="100%" align="left">
                <tr height="8">
                    <td style="width: 8px">
                    </td>
                    <td colspan="2">
                    </td>
                    <td style="width: 8px">
                    </td>
                </tr>
                <tr height="20">
                    <td style="width: 8px; height: 20px" bgcolor="#ffffff">
                    </td>
                    <td style="width: 459px; height: 20px" valign="middle" bgcolor="#ffffff">
                        <asp:Label ID="lblTitulo" runat="server" Width="239px" CssClass="EtiquetaTitulo">&nbsp;&nbsp;Workflow > Asistente de Configuraci&oacute;n</asp:Label>
                    </td>
                    <td style="height: 20px" valign="middle" align="right" bgcolor="#ffffff">
                        <%--<uc1:navegacion id="Navegacion1" runat="server"></uc1:navegacion>--%>
                    </td>
                    <td style="width: 8px; height: 20px" bgcolor="#ffffff">
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
                        <p>
                            <asp:Label ID="lblTituloArbol" runat="server" CssClass="EtiquetaNormal"></asp:Label></p>
                        <asp:TreeView ID="wfTreeView" ShowLines="true" runat="server">
                        </asp:TreeView>
                        <p>
                            &nbsp;</p>
                    </td>
                    <td style="width: 13px">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right" bgcolor="#ffffff">
            <table id="Table4" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td width="8">
                    </td>
                    <td align="right">
                        &nbsp;
                        <asp:Button ID="btnSalir" runat="server" CssClass="BotonNormal" Text="Salir" OnClick="btnSalir_Click">
                        </asp:Button>
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
                        <asp:ValidationSummary ID="vsmErrores" runat="server" Width="784px" CssClass="ValidadorSumarioNormal"
                            DisplayMode="List"></asp:ValidationSummary>
                        <asp:Label ID="lblError" runat="server" CssClass="ValidadorSumarioNormal"></asp:Label>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
