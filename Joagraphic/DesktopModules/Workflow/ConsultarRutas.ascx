<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConsultarRutas.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.ConsultarRutas" %>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<table cellspacing="0" cellpadding="0" width="100%" border="0" style="z-index: 101;
    left: 8px; position: absolute; top: 8px" height="100%">
    <tr>
        <td style="height: 10px" valign="top">
            <%--<uc1:banner id="Banner1" runat="server"></uc1:banner>--%>
        </td>
    </tr>
    <tr>
        <td valign="top" align="center" bgcolor="#ffffff" style="height: 395px">
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
                        <asp:Label ID="lblTitulo" runat="server" Width="256px" CssClass="EtiquetaTitulo">Workflow > Consultar rutas para aprobacion</asp:Label>
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
                        <table id="tblDatos" style="width: 542px" cellspacing="0" cellpadding="1" width="542"
                            border="0">
                            <tr>
                                <td style="width: 154px">
                                    <asp:Label ID="lblModulo" runat="server" CssClass="EtiquetaNormal" Width="144px">Modulo de trabajo:</asp:Label>
                                </td>
                                <td style="width: 414px">
                                    <asp:DropDownList ID="ddlModulo" runat="server" CssClass="#listItem" Width="300px"
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 87px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 154px">
                                    <asp:Label ID="lblTipoDocumento" runat="server" CssClass="EtiquetaNormal">Tipo de documento:</asp:Label>
                                </td>
                                <td style="width: 414px">
                                    <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="#listItem" Width="300px"
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="rfvTipoDocumento" runat="server" ControlToValidate="ddlTipoDocumento"
                                        InitialValue="0">*</asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 87px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 154px; height: 20px">
                                    <asp:Label ID="lblWorkFlow" runat="server" CssClass="EtiquetaNormal" Width="144px">Descripcion del Workflow:</asp:Label>
                                </td>
                                <td style="width: 414px; height: 20px">
                                    <asp:TextBox ID="txtDescripcion" runat="Server" CssClass="TextoBloqueado" Width="300px"
                                        ReadOnly="True" TextMode="MultiLine" Columns="40" Height="70px"></asp:TextBox>
                                </td>
                                <td style="width: 87px; height: 20px">
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
                        <asp:Button ID="btnConsultar" runat="server" CssClass="BotonNormal" Text="Consultar">
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
