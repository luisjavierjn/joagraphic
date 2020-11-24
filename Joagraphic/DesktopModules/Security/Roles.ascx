<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Roles.ascx.cs" Inherits="Joagraphic.DesktopModules.Security.Roles" %>

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
                        <asp:Label ID="lblTitulo" runat="server" Width="239px" CssClass="EtiquetaTitulo">Seguridad > Roles</asp:Label>
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
                        <table id="Table5" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td colspan="3">
                                    <asp:DataGrid ID="dgdRoles" runat="server" CssClass="GridNormal" AllowPaging="True"
                                        ShowFooter="True" AutoGenerateColumns="False" GridLines="Horizontal" CellPadding="0"
                                        BackColor="White" BorderWidth="0px" BorderStyle="None" BorderColor="#E7E7FF"
                                        PageSize="20">
                                        <SelectedItemStyle Font-Bold="True" Height="22px" ForeColor="#F7F7F7" BackColor="#738A9C">
                                        </SelectedItemStyle>
                                        <EditItemStyle Height="22px"></EditItemStyle>
                                        <AlternatingItemStyle Height="22px" BackColor="#F7F7F7"></AlternatingItemStyle>
                                        <ItemStyle Height="22px" ForeColor="#4A3C8C" VerticalAlign="Top" BackColor="#E7E7FF">
                                        </ItemStyle>
                                        <HeaderStyle Height="22px" ForeColor="#F7F7F7" BackColor="#4A3C8C"></HeaderStyle>
                                        <FooterStyle Height="22px" ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="Numero">
                                                <HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                <HeaderTemplate>
                                                    <asp:LinkButton ID="Linkbutton1" runat="server" CssClass="TituloGrid" CausesValidation="False"
                                                        CommandArgument="Ordenar" CommandName="Numero">N°</asp:LinkButton>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNumero" runat="server" Width="40px" Text='<%# DataBinder.Eval(Container, "DataItem.shtRol", "{0:000}") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="lblNumeroEdit" runat="server" Width="40px" Text='<%# DataBinder.Eval(Container, "DataItem.shtRol", "{0:000}") %>'>
                                                    </asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Rol">
                                                <HeaderStyle Width="300px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:LinkButton ID="lbtnRoles" runat="server" CssClass="TituloGrid" CausesValidation="False"
                                                        CommandName="Rol" CommandArgument="Ordenar">Rol</asp:LinkButton>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRol" runat="server" Width="280px" Text='<%# DataBinder.Eval(Container, "DataItem.strRol") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtRol" runat="server" CssClass="TextoNormal" Width="280px" MaxLength="255"
                                                        Text='<%# DataBinder.Eval(Container, "DataItem.strRol") %>'>
                                                    </asp:TextBox>&nbsp;
                                                    <asp:RequiredFieldValidator ID="rfvRol" runat="server" CssClass="ValidadorNormal"
                                                        ControlToValidate="txtRol">*</asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="Descripci&#243;n">
                                                <HeaderStyle Width="560px"></HeaderStyle>
                                                <HeaderTemplate>
                                                    <asp:LinkButton ID="lbtnDescripcion" runat="server" CssClass="TituloGrid" CausesValidation="False"
                                                        CommandName="Descripcion" CommandArgument="Ordenar">Descripción</asp:LinkButton>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDescripcion" runat="server" Width="540px" Text='<%# DataBinder.Eval(Container, "DataItem.strDescripcionRol") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="TextoNormal" Width="540px"
                                                        MaxLength="255" Text='<%# DataBinder.Eval(Container, "DataItem.strDescripcionRol") %>'>
                                                    </asp:TextBox>&nbsp;
                                                    <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" CssClass="ValidadorNormal"
                                                        ControlToValidate="txtDescripcion">*</asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn>
                                                <HeaderStyle Width="45px"></HeaderStyle>
                                                <ItemTemplate>
                                                    <p>
                                                        <asp:ImageButton ID="ibtnAsignar" runat="server" CausesValidation="False" ImageUrl="../Imagenes/Asignar.gif"
                                                            CommandName="Asignar"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ibtnEditar" runat="server" Width="15px" CausesValidation="False"
                                                            Height="15px" ImageUrl="../Imagenes/Actualizar.gif" CommandName="Edit"></asp:ImageButton></p>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton ID="ibtnActualizar" runat="server" Width="15px" CausesValidation="False"
                                                        Height="15px" ImageUrl="../Imagenes/Salvar.gif" CommandName="Update"></asp:ImageButton>&nbsp;&nbsp;
                                                    <asp:ImageButton ID="ibtnCancel" runat="server" Width="15px" CausesValidation="False"
                                                        Height="15px" ImageUrl="../Imagenes/Cancelar.gif" CommandName="Cancel"></asp:ImageButton>
                                                </EditItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle Height="22px" HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF"
                                            Mode="NumericPages"></PagerStyle>
                                    </asp:DataGrid>
                                    <table class="TablaAgregar" id="tblAgregar" cellspacing="0" cellpadding="0" border="0"
                                        height="30">
                                        <tr>
                                            <td style="width: 50px">
                                            </td>
                                            <td style="width: 300px">
                                                <asp:TextBox ID="txtRolInsertar" runat="server" Width="280px" CssClass="TextoNormal"
                                                    MaxLength="250"></asp:TextBox>&nbsp;
                                                <asp:RequiredFieldValidator ID="rfvRolInsertar" runat="server" CssClass="ValidadorNormal"
                                                    ControlToValidate="txtRolInsertar">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 560px">
                                                <asp:TextBox ID="txtDescripcionInsertar" runat="server" Width="540px" CssClass="TextoNormal"
                                                    MaxLength="250"></asp:TextBox>&nbsp;
                                                <asp:RequiredFieldValidator ID="rfvDescripcionInsertar" runat="server" CssClass="ValidadorNormal"
                                                    ControlToValidate="txtDescripcionInsertar">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 45px">
                                                <asp:ImageButton ID="ibtnAgregar" runat="server" Width="15px" ImageUrl="../Imagenes/Salvar.gif"
                                                    Height="15px" CausesValidation="False"></asp:ImageButton>&nbsp;&nbsp;
                                                <asp:ImageButton ID="ibtnCancelar" runat="server" Width="15px" CausesValidation="False"
                                                    ImageUrl="../Imagenes/Cancelar.gif" Height="15px"></asp:ImageButton>
                                            </td>
                                        </tr>
                                    </table>
                                    &nbsp;
                                    <asp:Label ID="lblCantidad" runat="server" Width="123px" CssClass="EtiquetaItems">0 Roles</asp:Label>
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
                        <asp:Button ID="btnCancelar" runat="server" CssClass="BotonNormal" Text="Regresar"
                            CausesValidation="False" Visible="False"></asp:Button>
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
                        <font color="#ccccff">ESSEP003A</font>
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
