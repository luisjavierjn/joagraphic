<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WizardWorkflow.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.WizardWorkflow" %>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<asp:HiddenField ID="NodeIndex" runat="server" Value="0" />

<table id="main" height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td style="height: 10px" valign="top" colspan="2">
            <%--<uc1:banner id="Banner1" runat="server"></uc1:banner>--%>
        </td>
    </tr>
    <tr>
        <td style="height: 395px" valign="top" align="left" bgcolor="#ffffff">
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
                    <td style="width: 8px; height: 20px" bgcolor="#ffffff">
                    </td>
                    <td style="width: 459px; height: 20px" valign="middle" bgcolor="#ffffff">
                        <asp:Label ID="lblTitulo" runat="server" Width="239px" CssClass="EtiquetaTitulo">&nbsp;&nbsp;Workflow > Asistente de Configuración</asp:Label>
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
                        <table id="Table5" style="width: 569px; height: 119px" cellspacing="1" cellpadding="1"
                            width="569" bgcolor="#ffffff" border="0">
                            <tr>
                                <td class="EtiquetaNormal">
                                    <p style="color: black; font-family: Verdana">
                                        Configuración de Workflow
                                        <asp:Label ID="lblNombre" runat="server"></asp:Label>
                                        <asp:Label ID="lblStepNumber" runat="server"></asp:Label></p>
                                    <table id="Table6" style="width: 501px; height: 51px;" cellspacing="1" cellpadding="1"
                                        width="501" border="0">
                                        <tr>
                                            <td valign="top">
                                                <asp:PlaceHolder ID="plhWizardStep" runat="server"></asp:PlaceHolder>
                                                <table id="Table7" style="width: 100%; height: 20px" cellspacing="1" cellpadding="1"
                                                    width="100%" border="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="btnCancel" runat="server" CssClass="BotonNormal" Text="Cancelar"
                                                                CausesValidation="False" OnClick="btnCancel_Click"></asp:Button>
                                                            <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />--%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:Button ID="btnBack" runat="server" CssClass="BotonNormal" Text="Anterior" OnClick="btnBack_Click">
                                                            </asp:Button><asp:Button ID="btnNext" runat="server" CssClass="BotonNormal" Text="Siguiente"
                                                                OnClick="btnNext_Click"></asp:Button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <asp:TreeView ID="wfTreeView" ShowLines="true" runat="server" Visible="false" OnSelectedNodeChanged="wfTreeView_SelectedNodeChanged"
                                                    NodeStyle-ForeColor="DarkBlue" NodeStyle-Font-Names="Verdana" NodeStyle-Font-Size="8pt"
                                                    NodeStyle-HorizontalPadding="5" NodeStyle-VerticalPadding="0" NodeStyle-BorderColor="#FFFFFF"
                                                    NodeStyle-BorderStyle="solid" NodeStyle-BorderWidth="0px" RootNodeStyle-Font-Bold="true"
                                                    HoverNodeStyle-BackColor="#cccccc" HoverNodeStyle-BorderColor="#888888" HoverNodeStyle-BorderStyle="solid"
                                                    HoverNodeStyle-BorderWidth="0px" SelectedNodeStyle-BackColor="#cccccc" SelectedNodeStyle-BorderColor="#888888"
                                                    SelectedNodeStyle-BorderStyle="solid" SelectedNodeStyle-BorderWidth="0px">
                                                </asp:TreeView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
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
