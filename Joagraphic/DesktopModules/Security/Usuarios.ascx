<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Usuarios.ascx.cs" Inherits="Joagraphic.DesktopModules.Security.Usuarios" %>

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
                        <asp:Label ID="lblTitulo" runat="server" Width="352px" CssClass="EtiquetaTitulo">Seguridad > Usuarios</asp:Label>
                    </td>
                    <td style="height: 20px" valign="middle" align="right" bgcolor="#4a3c8c">
                        <%--<uc1:navegacion id="Navegacion1" runat="server"></uc1:navegacion>--%>
                    </td>
                    <td style="width: 8px; height: 20px" bgcolor="#4a3c8c">
                    </td>
                </tr>
                <tr>
                    <td style="width: 8px; height: 8px">
                    </td>
                    <td style="height: 8px" colspan="2">
                    </td>
                    <td style="width: 8px; height: 8px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 8px; height: 11px">
                    </td>
                    <td colspan="2">
                        <table id="Table1" cellspacing="0" cellpadding="0" border="0" style="width: 912px;
                            height: 120px">
                            <tr>
                                <td style="width: 500px; height: 25px">
                                    <asp:TextBox ID="txtOculto" runat="server" Width="0" Height="0"></asp:TextBox><asp:Label
                                        ID="lblCodigoNombre" runat="server" CssClass="EtiquetaNormal" Width="125px">Código / Nombre:</asp:Label><asp:TextBox
                                            ID="txtNombreCodigo" runat="server" CssClass="TextoNormal" Width="250px" TabIndex="1"></asp:TextBox>&nbsp;
                                </td>
                            </tr>
                            <tr height="25">
                                <td style="width: 500px">
                                    <asp:Label ID="lblLoSGeneral" runat="server" CssClass="EtiquetaNormal" Width="125px">LoS / Departamento:</asp:Label><asp:DropDownList
                                        ID="ddlLoS" runat="server" CssClass="ComboNormal" Width="250px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr height="25">
                                <td style="width: 500px">
                                    <asp:Label ID="lblOficinaGeneral" runat="server" CssClass="EtiquetaNormal" Width="125px">Oficina:</asp:Label><asp:DropDownList
                                        ID="ddlOficina" runat="server" CssClass="ComboNormal" Width="250px">
                                    </asp:DropDownList>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr height="25">
                                <td style="width: 500px">
                                    <asp:Label ID="Label1" runat="server" CssClass="EtiquetaNormal" Width="125px">Estatus:</asp:Label><asp:DropDownList
                                        ID="ddlEstatus" runat="server" CssClass="ComboNormal" Width="250px">
                                        <asp:ListItem Value="1">Activos</asp:ListItem>
                                        <asp:ListItem Value="0">Inactivos</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;
                                    <asp:ImageButton ID="ibtnBuscar" runat="server" ImageUrl="../../images/Goazul.JPG" OnClick="ibtnBuscar_Click">
                                    </asp:ImageButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 8px; height: 11px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 8px; height: 10px">
                    </td>
                    <td style="height: 10px" colspan="2">
                    </td>
                    <td style="width: 8px; height: 10px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 13px">
                    </td>
                    <td valign="top" colspan="2">
                        <asp:DataGrid ID="dgdUsuarios" runat="server" CssClass="GridNormal" BorderColor="#4A3C8C"
                            BorderStyle="None" BorderWidth="0px" BackColor="White" CellPadding="0" GridLines="Horizontal"
                            AutoGenerateColumns="False" AllowPaging="True" ShowFooter="True" AllowSorting="True"
                            PageSize="20" OnItemCreated="dgdUsuarios_ItemCreated" OnItemCommand="dgdUsuarios_ItemCommand"
                            OnPageIndexChanged="dgdUsuarios_PageIndexChanged">
                            <SelectedItemStyle Font-Bold="True" Height="22px" ForeColor="#F7F7F7" VerticalAlign="Top"
                                BackColor="#738A9C"></SelectedItemStyle>
                            <EditItemStyle Height="22px" VerticalAlign="Top"></EditItemStyle>
                            <AlternatingItemStyle Height="22px" VerticalAlign="Top" BackColor="#F7F7F7"></AlternatingItemStyle>
                            <ItemStyle Height="22px" ForeColor="#4A3C8C" VerticalAlign="Top" BackColor="#E7E7FF">
                            </ItemStyle>
                            <HeaderStyle Height="22px" ForeColor="#F7F7F7" VerticalAlign="Top" BackColor="#4A3C8C">
                            </HeaderStyle>
                            <FooterStyle Height="22px" ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="Fecha">
                                    <HeaderStyle HorizontalAlign="Center" Width="75px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnFecha" runat="server" CssClass="TituloGrid" CommandName="Fecha"
                                            CommandArgument="Ordenar">Creación</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblFecha" runat="server" Width="65px" Text='<%# DataBinder.Eval(Container, "DataItem.dttFechaCreacion", "{0:dd/MM/yyyy}") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Codigo">
                                    <HeaderStyle HorizontalAlign="Center" Width="95px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnCodigoTitulo" runat="server" CssClass="TituloGrid" CommandArgument="Ordenar"
                                            CommandName="Codigo">Código</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCodigo" runat="server" Width="85px" Text='<%# DataBinder.Eval(Container, "DataItem.intCodStaff", "{0:00000000}") %>'>
                                        </asp:Label>
                                        <asp:LinkButton ID="lbtnCodigo" runat="server" Width="85px" CausesValidation="False"
                                            CommandArgument="Interno" CommandName="Consultar" Visible="False">
											<%# DataBinder.Eval(Container, "DataItem.intCodStaff", "{0:00000000}") %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Usuario">
                                    <HeaderStyle Width="125px"></HeaderStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnUsuarioTitulo" runat="server" CssClass="TituloGrid" CommandArgument="Ordenar"
                                            CommandName="Usuario">Usuario</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUsuario" runat="server" Width="115px" Text='<%# DataBinder.Eval(Container, "DataItem.strUsuario") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Nombre">
                                    <HeaderStyle Width="250px"></HeaderStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnNombreTitulo" runat="server" CssClass="TituloGrid" CommandArgument="Ordenar"
                                            CommandName="Nombre">Nombre</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblNombre" runat="server" Width="240px" Text='<%# DataBinder.Eval(Container, "DataItem.strNombreCorto") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Categoria">
                                    <HeaderStyle Width="125px"></HeaderStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnCategoria" runat="server" CssClass="TituloGrid" CommandName="Categoria"
                                            CommandArgument="Ordenar">Categoría</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCategoria" runat="server" Width="115px" Text='<%# DataBinder.Eval(Container, "DataItem.strCategoria") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Linea">
                                    <HeaderStyle Width="130px"></HeaderStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnLinea" runat="server" Width="120px" CssClass="TituloGrid"
                                            CommandName="Linea" CommandArgument="Ordenar">LoS o Departamento</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLinea" runat="server" Width="120px" CssClass="EtiquetaNormal" Text='<%# DataBinder.Eval(Container, "DataItem.strLineaDepartamento") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Oficina">
                                    <HeaderStyle Width="120px"></HeaderStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnOficinaTitulo" runat="server" Width="110px" CssClass="TituloGrid"
                                            CommandName="Oficina" CommandArgument="Ordenar">Oficina</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblOficina" runat="server" Width="110px" CssClass="EtiquetaNormal"
                                            Text='<%# DataBinder.Eval(Container, "DataItem.strOficina") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="Estatus">
                                    <HeaderStyle Width="125px"></HeaderStyle>
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lbtnEstatus" runat="server" CssClass="TituloGrid" CommandName="Estatus"
                                            CommandArgument="Ordenar">Estatus</asp:LinkButton>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEstatus" runat="server" Width="115px" Text='<%# DataBinder.Eval(Container, "DataItem.strEstatus") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <HeaderStyle Width="45px"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtnAsignar" runat="server" ImageUrl="../../images/Asignar.gif"
                                            CausesValidation="false" CommandArgument="Interno" CommandName="Roles"></asp:ImageButton>&nbsp;
                                        <asp:ImageButton ID="ibtnEditar" runat="server" ImageUrl="../../images/Actualizar.gif"
                                            CausesValidation="false" CommandArgument="Interno" CommandName="Edit"></asp:ImageButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle Height="22px" HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF"
                                Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid>&nbsp;
                        <asp:Label ID="lblCantidad" runat="server" Width="151px" CssClass="EtiquetaItems">0 Usuarios</asp:Label>
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
                        <asp:Button ID="btnCrear" runat="server" CssClass="BotonNormal" Text="Crear" OnClick="btnCrear_Click"></asp:Button>
                        <asp:Button ID="btnImprimir" runat="server" CssClass="BotonNormal" Text="Previsualizar" OnClick="btnImprimir_Click">
                        </asp:Button>
                        <asp:Button ID="btnImprimirTransacciones" runat="server" CssClass="BotonNormal" Text="Previsualizar accesos" OnClick="btnImprimirTransacciones_Click">
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
    <tr>
        <td align="right" bgcolor="#5375a4" height="1">
            <table class="TablaNormal" id="Table2" cellspacing="0" cellpadding="0" width="100%"
                border="0">
                <tr>
                    <td width="8">
                    </td>
                    <td style="width: 422px">
                        <p>
                            <font color="#ccccff">ESSEP001A</font>&nbsp;</p>
                    </td>
                    <td align="right">
                        <font color="#ccccff">Información restringida - Clasificación DC2</font>
                    </td>
                    <td width="8">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
