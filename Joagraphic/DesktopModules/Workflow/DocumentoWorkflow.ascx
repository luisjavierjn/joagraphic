<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DocumentoWorkflow.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.DocumentoWorkflow" %>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<asp:HiddenField ID="hfddlDocmt" runat="server" />    
<asp:HiddenField ID="hfDocumento" runat="server" />

<script type="text/javascript">
    function DocumentoWF() {
        //debugger
        var hfDocumento = document.getElementById('<%= this.hfDocumento.ClientID %>');
        var hfddlDocmt = document.getElementById('<%= this.ddlDocumento.ClientID %>');
        hfDocumento.value = hfddlDocmt.selectedIndex;
    }
</script>

<fieldset>
    <legend class="EtiquetaNormal">Flujo de Trabajo</legend>
    <table class="TextoNormal" id="Table1" style="width: 368px; height: 168px" cellpadding="5"
        width="368">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" CssClass="EtiquetaNormal" ToolTip="Lista los módulos de SPIN que requieren de un Flujo de Trabajo">Modulo de Trabajo</asp:Label>
            </td>
        </tr>
        <tr>
            <td style="height: 23px">
                <asp:DropDownList ID="ddlModulo" AutoPostBack="True" runat="server" CssClass="ComboNormal"
                    Width="250px" OnSelectedIndexChanged="ddlModulo_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" CssClass="EtiquetaNormal" ToolTip="Lista los distintos documentos que son manejados por un determinado Módulo de Trabajo">Tipo de Documento</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlDocumento" AutoPostBack="True" runat="server" CssClass="ComboNormal"
                    Width="250px" OnSelectedIndexChanged="ddlDocumento_SelectedIndexChanged" onchange="javascript:DocumentoWF()">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" ToolTip="Muestra las principales características del Flujo de Trabajo relacionadas con el documento">Descripcion del Workflow</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtDescription" runat="Server" CssClass="TextoCajaNormal" Width="352px"
                    TextMode="MultiLine" Rows="3" Columns="40" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
    </table>
</fieldset>
