<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResumenWorkflow.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.ResumenWorkflow" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<fieldset>
    <legend class="EtiquetaNormal">Rutas</legend>
    <table id="Table1" cellpadding="5" width="504" class="TextoNormal" style="width: 504px;
        height: 162px">
        <tr>
            <td>
                Agregue los niveles de aprobación en la política escogida.
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblNodo" runat="server"></asp:Label>
                <table id="Table2" class="TextoNormal" style="width: 488px; height: 94px">
                    <tr>
                        <td>
                            Todos los Niveles
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Niveles Escogidos
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ListBox ID="lstNiveles" runat="Server" Width="250px" CssClass="TextoCajaNormal"
                                Height="90px"></asp:ListBox>
                        </td>
                        <td>
                            <asp:Button ID="btnAdd" Style="font: 9pt Courier" runat="server" Text="->" OnClick="btnAdd_Click">
                            </asp:Button><br/>
                            <asp:Button ID="btnDel" Style="font: 9pt Courier" runat="server" Text="<-" OnClick="btnDel_Click">
                            </asp:Button>
                        </td>
                        <td>
                            <asp:ListBox ID="lstEscogencia" runat="Server" Width="250px" CssClass="TextoCajaNormal"
                                Height="90px"></asp:ListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</fieldset>
