<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DescripcionWorkflow.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.DescripcionWorkflow" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<fieldset>
    <legend class="EtiquetaNormal">Reglas</legend>
    <p class="TextoNormal" style="width: 280px; height: 28px">
        &nbsp; Configuracion de reglas&nbsp;para el Worflow.</p>
    <table class="TextoNormal" style="width: 504px; height: 159px" cellpadding="5" width="504">
        <tr>
            <td style="width: 324px">
                Intervalo de&nbsp;espera para la recepcion de una nueva notificacion de aprobacion:
            </td>
            <td>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtIntervAprob" CssClass="TextoCajaNormal" runat="Server" Columns="30"
                    Width="50px"></asp:TextBox>&nbsp;<asp:DropDownList ID="ddlNotificacion" CssClass="ComboNormal"
                        runat="server">
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAprobacion" runat="server" ErrorMessage="*" ControlToValidate="txtIntervAprob"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvAprobacion" runat="server" ErrorMessage="*" ControlToValidate="txtIntervAprob"
                    MinimumValue="1" MaximumValue="9999999"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 324px">
                Intervalo de espera para la recepcion de una nueva notificacion de correccion:
            </td>
            <td>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtIntervCorrec" CssClass="TextoCajaNormal" runat="server" Columns="30"
                    Width="50px"></asp:TextBox>&nbsp;<asp:DropDownList ID="ddlCorreccion" CssClass="ComboNormal"
                        runat="server">
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCorreccion" runat="server" ErrorMessage="*" ControlToValidate="txtIntervCorrec"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvCorreccion" runat="server" ErrorMessage="*" ControlToValidate="txtIntervCorrec"
                    MinimumValue="1" MaximumValue="9999999"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 324px">
                Numero de recordatorios de notificacion de aprobacion:
            </td>
            <td>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtNumRecor" CssClass="TextoCajaNormal" runat="server" Columns="30"
                    Width="50px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRocordatorios" runat="server" ErrorMessage="*"
                    ControlToValidate="txtNumRecor"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvRecordatorios" runat="server" ErrorMessage="*" ControlToValidate="txtNumRecor"
                    MinimumValue="1" MaximumValue="9999999"></asp:RangeValidator>
            </td>
        </tr>
    </table>
</fieldset>
