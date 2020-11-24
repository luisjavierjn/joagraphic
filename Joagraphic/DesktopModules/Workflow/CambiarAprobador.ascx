<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CambiarAprobador.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.CambiarAprobador" %>

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
                        <asp:Label ID="lblTitulo" runat="server" Width="333px" CssClass="NormalL" Height="8px">Workflow > Cambio de aprobador</asp:Label><asp:Button
                            ID="btnDefault" runat="server" Width="0px" Height="0px" Text="Button"></asp:Button>
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
                                    <table class="TablaNormalEspecial" id="Table3" style="width: 480px; height: 8px"
                                        cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                            <td style="width: 80px" valign="baseline" align="left" height="20">
                                            </td>
                                            <td style="width: 308px" valign="baseline" align="left" height="20">
                                            </td>
                                            <td valign="baseline" align="left" height="20">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px" valign="baseline" align="left" height="20">
                                                <asp:Label ID="lblEmpleado" runat="server" Width="80px" CssClass="EtiquetaNormal">Aprobador:</asp:Label>
                                            </td>
                                            <td style="width: 308px" valign="baseline" align="left" height="20">
                                                <asp:TextBox ID="txtCodigoEmpleado" runat="server" Width="56px" CssClass="TextoBloqueado"
                                                    ReadOnly="True"></asp:TextBox><asp:TextBox ID="txtEmpleado" runat="server" Width="248px"
                                                        CssClass="TextoBloqueado" ReadOnly="True"></asp:TextBox>
                                            </td>
                                            <td valign="baseline" align="left" height="20">
                                                <asp:RequiredFieldValidator ID="rfvAprobador" runat="server" CssClass="ValidadorNormal"
                                                    ControlToValidate="txtEmpleado">*</asp:RequiredFieldValidator><asp:ImageButton ID="ibtnBuscarEmpleado"
                                                        runat="server" ImageUrl="../Imagenes/Buscar.gif" CausesValidation="False">
                                                </asp:ImageButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px; height: 6px" valign="baseline" align="left" rowspan="1">
                                                <asp:Label ID="lblModulo" runat="server" CssClass="EtiquetaNormal">Módulo:</asp:Label>
                                            </td>
                                            <td style="width: 308px; height: 6px" valign="baseline" align="left">
                                                <asp:DropDownList ID="ddlModulo" runat="server" Width="304px" CssClass="ComboNormal"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 6px" valign="baseline" align="left">
                                                <asp:RequiredFieldValidator ID="rfvModulo" runat="server" CssClass="ValidadorNormal"
                                                    ControlToValidate="ddlModulo" Display="Dynamic" InitialValue="0">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtCategoriaOrigen" runat="server" Height="0px" Width="0px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px; height: 6px" valign="baseline" align="left">
                                                <asp:Label ID="lblWorkflow" runat="server" CssClass="EtiquetaNormal">Workflow: </asp:Label>
                                            </td>
                                            <td style="width: 308px; height: 6px" valign="baseline" align="left">
                                                <asp:DropDownList ID="ddlWorkFlow" runat="server" Width="304px" CssClass="ComboNormal">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="height: 6px" valign="baseline" align="left">
                                                <asp:RequiredFieldValidator ID="rfvWF" runat="server" CssClass="ValidadorNormal"
                                                    ControlToValidate="ddlWorkFlow" Display="Dynamic" InitialValue="0">*</asp:RequiredFieldValidator><asp:ImageButton
                                                        ID="ibtnConsultar" runat="server" ImageUrl="../Imagenes/Goazul.JPG"></asp:ImageButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px" valign="baseline" align="left" height="15">
                                            </td>
                                            <td style="width: 308px" valign="baseline" align="left" height="15">
                                            </td>
                                            <td valign="baseline" align="left" height="15">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr height="13">
                                <td style="width: 8px" valign="top" align="left" height="300">
                                </td>
                                <td valign="top" align="left">
                                    <asp:DataGrid ID="dgdWorkflow" runat="server" Width="960px" CssClass="Gridview_cuerpo"
                                        ShowFooter="True" BorderColor="#4A3C8C" BorderStyle="None" BorderWidth="0px"
                                        CellPadding="0" GridLines="Horizontal" AutoGenerateColumns="False" AllowSorting="True"
                                        AllowPaging="True" BackColor="White">
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
                                                    <asp:Label ID="lblReferenciaTtiulo" runat="server" CssClass="Gridview_cuerpo" ForeColor="White">N°de documento</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReferencia" runat="server" CssClass="Gridview_cuerpo" Width="70px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strReferencia","{0:000000}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="N&#176; Solicitud">
                                                <HeaderStyle Width="80px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblSolicitudTitulo" runat="server" CssClass="Gridview_cuerpo" ForeColor="White">N° solicitud</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNumSolicitud" runat="server" CssClass="Gridview_cuerpo" Width="70px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.intSolicitud", "{0:000000}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Fecha creaci&#243;n">
                                                <HeaderStyle Width="120px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblCreacionTtiulo" runat="server" CssClass="Gridview_cuerpo" ForeColor="White">Fecha de creación</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblItemFechaCreacion" runat="server" Width="110px" Text='<%# DataBinder.Eval(Container, "DataItem.dttFechaCreacion","{0:dd/MM/yyyy hh:mm tt}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Workflow">
                                                <HeaderStyle Width="300px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblWFTitulo" runat="server" CssClass="Gridview_cuerpo" ForeColor="White">Workflow</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblWF" runat="server" CssClass="Gridview_cuerpo" Text='<%# DataBinder.Eval(Container, "DataItem.strWorkFlow") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblCodWF" runat="server" CssClass="Gridview_cuerpo" Text='<%# DataBinder.Eval(Container, "DataItem.shtWorkFlow") %>'
                                                        Visible="False">
                                                    </asp:Label>
                                                    <asp:Label ID="lblRolAsoc" runat="server" CssClass="Gridview_cuerpo" Text='<%# DataBinder.Eval(Container, "DataItem.intRolAsoc") %>'
                                                        Visible="False">
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn SortExpression="Cliente" HeaderText="Solicitante">
                                                <HeaderStyle Width="180px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblSolicitanteTitulo" runat="server" CssClass="Gridview_cuerpo" ForeColor="White">Solicitante</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSolicitante" runat="server" CssClass="Gridview_cuerpo" Width="140px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strSolicitante") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Aprobador">
                                                <HeaderStyle Width="180px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblAprobadorTitulo" runat="server" CssClass="Gridview_cuerpo">Aprobador</asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAprobador" runat="server" CssClass="Gridview_cuerpo" Width="140px"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strSiguienteAprobador") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="10px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkSeleccioneTitulo" runat="server"></asp:CheckBox>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSeleccione" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle Height="22px" HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF"
                                            Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid>&nbsp;
                                    <asp:Label ID="lblCantidad" runat="server" ForeColor="#4A3C8C">lblCantidad</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 8px; height: 23px" valign="top" align="left" height="23">
                                </td>
                                <td valign="top" align="left">
                                    <asp:Panel ID="pnlDestino" runat="server" Visible="False">
                                        <table class="TablaNormaEspecial" id="Table7" style="width: 961px; height: 54px"
                                            cellspacing="0" cellpadding="0" width="961" border="0">
                                            <tr>
                                                <td align="right">
                                                    <table id="Table16" style="width: 936px; height: 18px" cellspacing="0" cellpadding="0"
                                                        width="936" border="0">
                                                        <tr>
                                                            <td style="width: 988px; height: 14px" align="left" colspan="1">
                                                                &nbsp;
                                                            </td>
                                                            <td class="EtiquetaTitulo" style="width: 271px; height: 14px" align="center">
                                                                <asp:Label ID="lblTraspasar" runat="server" CssClass="EtiquetaNormal" Width="200px">Traspasar al aprobador</asp:Label>
                                                            </td>
                                                            <td style="width: 550px; height: 14px" align="center">
                                                            </td>
                                                        </tr>
                                                        <tr style="height: 5px">
                                                            <td style="width: 988px" align="left">
                                                            </td>
                                                            <td class="EtiquetaTitulo" style="width: 271px" align="center" colspan="1">
                                                            </td>
                                                            <td class="EtiquetaTitulo" style="width: 550px" align="center" colspan="2">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table class="TablaNormalEspecial" id="Table6" style="width: 392px; height: 38px"
                                                        cellspacing="0" cellpadding="0" width="392" border="0">
                                                        <tr>
                                                            <td style="width: 113px">
                                                                <asp:Label ID="lblEmpleadoD" runat="server" CssClass="EtiquetaNormal" Width="112px">Empleado aprobador:</asp:Label>
                                                            </td>
                                                            <td style="width: 447px">
                                                                <asp:TextBox ID="txtCodigoEmpleadoD" runat="server" CssClass="TextoBloqueado" Width="56px"
                                                                    ReadOnly="True"></asp:TextBox>
                                                                <asp:TextBox ID="txtEmpleadoD" runat="server" CssClass="TextoBloqueado" Width="199px"
                                                                    ReadOnly="True"></asp:TextBox>
                                                                <asp:ImageButton ID="ibtnBuscarDestino" runat="server" CausesValidation="False" ImageUrl="~/images/Buscar.gif">
                                                                </asp:ImageButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 113px">
                                                                <asp:Label ID="lblCategoriaD" runat="server" CssClass="EtiquetaNormal" Width="112px">Categoría:</asp:Label>
                                                            </td>
                                                            <td style="width: 447px">
                                                                <asp:TextBox ID="txtCategoriaD" runat="server" CssClass="TextoBloqueado" Width="256px"
                                                                    ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
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
                                    <asp:Button ID="btnReversar" runat="server" CssClass="BotonNormal" Text="Aceptar">
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
                        <asp:ValidationSummary ID="vsmSolicitudFactura" runat="server" Width="784px" CssClass="ValidadorSumarioNormal"
                            ForeColor=" " DisplayMode="List"></asp:ValidationSummary>
                        <asp:Label ID="lblError" runat="server" CssClass="ValidadorSumarioNormal"></asp:Label>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
