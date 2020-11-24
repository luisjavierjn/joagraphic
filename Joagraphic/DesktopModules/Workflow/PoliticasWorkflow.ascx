<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PoliticasWorkflow.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.PoliticasWorkflow" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<asp:HiddenField ID="hfIndex" runat="server" />
<asp:HiddenField ID="hfCommand" runat="server" OnValueChanged="hfCommand_ValueChanged" />
<asp:HiddenField ID="hfTipoDeDato" runat="server" />
<asp:HiddenField ID="hfCondicion" runat="server" />
<asp:HiddenField ID="hfValor" runat="server" />

<script type="text/javascript">

    function jsCommand(command) {
        //debugger;
        var hfCommand = $get('<%= this.hfCommand.ClientID %>');
        hfCommand.value = command;

        var grid = $get('<%= this.dgdPoliticas.ClientID %>');
        var hfIndex = $get('<%= this.hfIndex.ClientID %>');
        
        var hfTipoDeDato = $get('<%= this.hfTipoDeDato.ClientID %>');
        var hfCondicion = $get('<%= this.hfCondicion.ClientID %>');        
        var hfValor = $get('<%= this.hfValor.ClientID %>');

        var i = parseInt(hfIndex.value);
        hfTipoDeDato.value = grid.rows[i + 1].cells[0].childNodes[0].value;
        hfCondicion.value = grid.rows[i + 1].cells[1].childNodes[0].value;
        hfValor.value = grid.rows[i + 1].cells[2].childNodes[0].value;
    }

</script>

<fieldset>
    <legend class="EtiquetaNormal">Politicas</legend>
    <asp:DataGrid ID="dgdPoliticas" CssClass="Gridview_cuerpo" Width="512px" GridLines="Horizontal"
        CellPadding="3" BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#E7E7FF"
        AutoGenerateColumns="False" runat="server" OnDeleteCommand="dgdPoliticas_DeleteCommand"
        OnEditCommand="dgdPoliticas_EditCommand">
        <FooterStyle ForeColor="#4A3C8C" BackColor="#B5C7DE"></FooterStyle>
        <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#738A9C"></SelectedItemStyle>
        <AlternatingItemStyle BackColor="#F7F7F7"></AlternatingItemStyle>
        <ItemStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></ItemStyle>
        <HeaderStyle Font-Bold="True" ForeColor="#F7F7F7" BackColor="#999966"></HeaderStyle>
        <Columns>
            <asp:TemplateColumn HeaderText="Informaci&#243;n">
                <HeaderTemplate>
                    <asp:Label ID="lblTipoDeDatoTitulo" runat="server">Informacion</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTipoDeDatoItem" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.strNbrTipoDeDato") %>'>
                    </asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTipoDeDatoItem" runat="server" Width="150px" CssClass="ComboNormal">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Condici&#243;n">
                <HeaderTemplate>
                    <asp:Label ID="lblCondicionTitulo" runat="server">Condicion</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCondicionItem" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.strNbrCondicion") %>'>
                    </asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlCondicionItem" CssClass="ComboNormal" Width="150px" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Valor">
                <HeaderTemplate>
                    <asp:Label ID="lblValorTitulo" runat="server">Valor</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblValorItem" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.strValor") %>'>
                    </asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtValor" runat="server" CssClass="TextoDerecha" Text='<%# DataBinder.Eval(Container, "DataItem.strValor") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn>
                <HeaderStyle Width="45px"></HeaderStyle>
                <ItemStyle Width="45px"></ItemStyle>
                <ItemTemplate>
                    <asp:ImageButton ID="Editar" runat="server" ImageUrl="~/images/Actualizar.gif" CommandName="Edit">
                    </asp:ImageButton>&nbsp;&nbsp;
                    <asp:ImageButton ID="Eliminar" runat="server" ImageUrl="~/images/Eliminar.gif" CommandName="Delete">
                    </asp:ImageButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="ibtnActualizar" runat="server" ImageUrl="~/images/Salvar.gif"
                        OnClientClick="javascript:jsCommand('Update');"></asp:ImageButton>&nbsp;&nbsp;
                    <asp:ImageButton ID="ibtnCancelar" runat="server" ImageUrl="~/images/Cancelar.gif"
                        OnClientClick="javascript:jsCommand('Cancel');"></asp:ImageButton>
                </EditItemTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages">
        </PagerStyle>
    </asp:DataGrid>
    <table id="Table1" style="width: 512px; height: 8px" cellspacing="0" cellpadding="0"
        width="512" border="0">
        <tr>
            <td style="width: 156px; height: 14px" bgcolor="#738a9c">
                <p align="center">
                    <asp:DropDownList ID="ddlTipo" CssClass="ComboNormal" Width="150px" runat="server">
                    </asp:DropDownList>
                </p>
            </td>
            <td style="width: 156px; height: 14px" align="center" bgcolor="#738a9c">
                <p align="center">
                    <asp:DropDownList ID="ddlCondicion" CssClass="ComboNormal" Width="150px" runat="server"
                        DataMember="cas_nbr_cargoasoc">
                    </asp:DropDownList>
                </p>
            </td>
            <td style="width: 156px; height: 14px" align="center" bgcolor="#738a9c">
                <asp:TextBox ID="txtPolitica" CssClass="TextoCajaNormal" runat="server"></asp:TextBox>
            </td>
            <td style="width: 46px; height: 14px" bgcolor="#738a9c">
                <asp:ImageButton ID="ibtnAgregar" runat="server" ImageUrl="~/images/Aceptar.gif"
                    OnClick="ibtnAgregar_Click"></asp:ImageButton>&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/images/Cancelar.gif">
                </asp:ImageButton>
            </td>
        </tr>
    </table>
</fieldset>
