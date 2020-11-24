<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReversoAprobacion.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.ReversoAprobacion" %>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<table style="z-index: 101; left: 8px; position: absolute; top: 8px" height="100%"
    cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td style="height: 10px" valign="top" colspan="2">
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
                    <td style="width: 8px; height: 24px" bgcolor="#ffffff">
                    </td>
                    <td style="width: 459px; height: 24px" valign="middle" bgcolor="#ffffff">
                        <asp:Label ID="lblTitulo" runat="server" Height="8px" CssClass="EtiquetaTitulo" Width="333px">Workflow > Reverso de aprobación</asp:Label><asp:Button
                            ID="btnDefault" runat="server" Height="0px" Width="0px" Text="Button"></asp:Button>
                    </td>
                    <td style="height: 24px" valign="middle" align="right" bgcolor="#ffffff">
                        <%--<uc1:navegacion id="Navegacion1" runat="server"></uc1:navegacion>--%>
                    </td>
                    <td style="width: 8px; height: 24px" bgcolor="#ffffff">
                    </td>
                </tr>
                <tr>
                    <td style="width: 8px; height: 1px">
                    </td>
                    <td style="height: 1px" colspan="2">
                        <a href="javascript:OpenCalendar('txtFechaFin', false)"></a>
                    </td>
                    <td style="width: 8px; height: 1px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 3px">
                    </td>
                    <td valign="baseline" align="right" width="100%" colspan="2">
                        <table class="TablaNormal" id="Table4" style="height: 225px" cellspacing="0" cellpadding="0"
                            width="100%" border="0">
                            <tr>
                                <td style="width: 8px; height: 5px" valign="top" align="left">
                                </td>
                                <td style="width: 975px; height: 11px" valign="top" align="left">
                                    <table class="TablaNormalEspecial" id="Table3" style="width: 413px; height: 88px"
                                        cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                            <td style="width: 100px" valign="baseline" align="left" height="20">
                                            </td>
                                            <td style="width: 138px" valign="baseline" align="left" height="20">
                                            </td>
                                            <td valign="baseline" align="left" height="20">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; height: 6px" valign="baseline" align="left" rowspan="1">
                                                <asp:Label ID="lblModulo" runat="server" CssClass="EtiquetaNormal">Módulo:</asp:Label>
                                            </td>
                                            <td style="width: 138px; height: 6px" valign="baseline" align="left">
                                                <asp:DropDownList ID="ddlModulo" runat="server" CssClass="ComboNormal" Width="250px"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 6px" valign="baseline" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px; height: 6px" valign="baseline" align="left">
                                                <asp:Label ID="lblWorkflow" runat="server" CssClass="EtiquetaNormal">Workflow: </asp:Label>
                                            </td>
                                            <td style="width: 138px; height: 6px" valign="baseline" align="left">
                                                <asp:DropDownList ID="ddlWorkFlow" runat="server" CssClass="ComboNormal" Width="250px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 6px" valign="baseline" align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100px" valign="baseline" align="left">
                                                <asp:Label ID="lblEmpleado" runat="server" CssClass="EtiquetaNormal" Width="136px">Solicitante (código/nombre):</asp:Label>
                                            </td>
                                            <td style="width: 138px; height: 25px" valign="baseline" align="left">
                                                <asp:TextBox ID="txtEmpleado" runat="server" CssClass="TextoNormal" Width="250px"></asp:TextBox><a
                                                    href="javascript:BorrarText('txtFechaFin')"></a>
                                            </td>
                                            <td style="height: 25px" valign="baseline" align="left">
                                                <asp:ImageButton ID="ibtnConsultar" runat="server" ImageUrl="../Imagenes/Goazul.JPG">
                                                </asp:ImageButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr height="13">
                                <td style="width: 8px" valign="top" align="left" height="300">
                                </td>
                                <td valign="top" align="left" height="300">
                                    <asp:DataGrid ID="dgdWorkflow" runat="server" CssClass="Gridview_cuerpo" Width="960px"
                                        BackColor="White" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                        GridLines="Horizontal" CellPadding="0" BorderWidth="0px" BorderStyle="None" BorderColor="#4A3C8C"
                                        ShowFooter="True">
                                        <FooterStyle Height="22px" ForeColor="#4A3C8C" VerticalAlign="Top" BackColor="#B5C7DE">
                                        </FooterStyle>
                                        <SelectedItemStyle Height="22px" ForeColor="#4A3C8C" VerticalAlign="Top" BackColor="#FFCC66">
                                        </SelectedItemStyle>
                                        <EditItemStyle Height="22px" ForeColor="#4A3C8C" BackColor="#FFCC66"></EditItemStyle>
                                        <AlternatingItemStyle Height="22px" VerticalAlign="Top" BackColor="#F7F7F7"></AlternatingItemStyle>
                                        <ItemStyle Height="22px" ForeColor="#4A3C8C" VerticalAlign="Top" BackColor="#E7E7FF">
                                        </ItemStyle>
                                        <HeaderStyle Height="22px" ForeColor="#F7F7F7" VerticalAlign="Top" BackColor="#999966">
                                        </HeaderStyle>
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="10px"></HeaderStyle>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Referencia">
                                                <HeaderStyle Width="80px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblReferenciaTtiulo" runat="server" CssClass="EtiquetaNormal" ForeColor="White">N° documento</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReferencia" runat="server" CssClass="EtiquetaNormal" Width="70px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strReferencia","{0:000000}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="N&#176; Solicitud">
                                                <HeaderStyle Width="80px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblSolicitudTitulo" runat="server" CssClass="EtiquetaNormal" ForeColor="White">N° solicitud</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNumSolicitud" runat="server" CssClass="EtiquetaNormal" Width="70px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.intSolicitud", "{0:000000}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Fecha creaci&#243;n">
                                                <HeaderStyle Width="120px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblCreacionTtiulo" runat="server" CssClass="EtiquetaNormal" ForeColor="White">Fecha de creación</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemFechaCreacion" runat="server" Width="110px" Text='<%# DataBinder.Eval(Container, "DataItem.dttFechaCreacion","{0:dd/MM/yyyy hh:mm tt}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Codigo Solicitante">
                                                <HeaderStyle Width="70px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblCodigoTitulo" runat="server" CssClass="EtiquetaNormal" ForeColor="White">Código solicitante</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCodigo" runat="server" CssClass="EtiquetaNormal" Text='<%# DataBinder.Eval(Container, "DataItem.intCodSolicitante","{0:000000}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn SortExpression="Cliente" HeaderText="Solicitante">
                                                <HeaderStyle Width="150px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblSolicitanteTitulo" runat="server" CssClass="EtiquetaNormal" ForeColor="White">Solicitante</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSolicitante" runat="server" CssClass="EtiquetaNormal" Width="140px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strSolicitante") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Ultimo aprobador">
                                                <HeaderStyle Width="150px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblUltimoTitulo" runat="server" CssClass="EtiquetaNormal">Ultimo aprobador</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUltimo" runat="server" CssClass="EtiquetaNormal" Width="140px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strUltimoAprobador") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Fecha aprobacion">
                                                <HeaderStyle Width="120px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblTituloFechaAprobacion" runat="server" CssClass="EtiquetaNormal"
                                                        ForeColor="White">Fecha aprobación</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemFechaAprobacion" runat="server" Width="110px" Text='<%# DataBinder.Eval(Container, "DataItem.dttFechaRevision","{0:dd/MM/yyyy hh:mm tt}") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblItemAprobacionNada" runat="server" CssClass="EtiquetaNormal" Width="140px"
                                                        Text="---" Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Siguiente aprobador">
                                                <HeaderStyle Width="150px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblSiguienteTitulo" runat="server" CssClass="EtiquetaNormal" CommandName="OrdenarTipoSolicitud"
                                                        ForeColor="White">Siguiente aprobador</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSiguiente" runat="server" CssClass="EtiquetaNormal" Width="140px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strSiguienteAprobador") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Estatus">
                                                <HeaderStyle Width="70px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblEstatusTitulo" runat="server" CssClass="EtiquetaNormal">Estatus</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEstatus" runat="server" CssClass="EtiquetaNormal" Width="60px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strEstatus") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="20px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkSeleccioneTitulo" runat="server"></asp:CheckBox>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSeleccione" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="10px"></HeaderStyle>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle Height="22px" HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF"
                                            Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid>&nbsp;
                                    <asp:Label ID="lblCantidad" runat="server" Width="151px" CssClass="EtiquetaItems">0 Documentos pendientes</asp:Label>&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table class="TablaNormal" id="Table15" style="width: 970px; height: 33px" cellspacing="0"
                            cellpadding="0" width="970" align="right" border="0">
                            <tr>
                                <td style="width: 26px" align="right">
                                </td>
                                <td style="width: 545px" align="left">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                                <td style="width: 7px" align="right">
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnReversar" runat="server" CssClass="BotonNormal" Text="Reversar">
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="ValidadorSumarioNormal" style="width: 973px" align="center" height="1">
            <table class="TablaNormalEspecial" id="Table5" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td width="8">
                    </td>
                    <td>
                        <asp:ValidationSummary ID="vsmSolicitudFactura" runat="server" CssClass="ValidadorSumarioNormal"
                            Width="784px" DisplayMode="List" ForeColor=" "></asp:ValidationSummary>
                        <asp:Label ID="lblError" runat="server" CssClass="ValidadorSumarioNormal"></asp:Label>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

