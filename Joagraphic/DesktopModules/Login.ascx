<%@ Control language="c#" CodeFile="Login.ascx.cs" AutoEventWireup="false" Inherits="Joagraphic.DesktopModules.Login" %>

<link href="../Estilos.css" type="text/css" rel="stylesheet" />

<table class="TablaNormal" id="Table1" style="z-index: 102" cellspacing="0" cellpadding="0"
    width="312" border="0">
    <tr height="24">
        <td width="221" height="10">
        </td>
        <td width="244" height="10">
        </td>
    </tr>
    <tr>
        <td width="221" height="25">
            &nbsp;&nbsp; Usuario:
        </td>
        <td align="left" width="244" height="25">
            <asp:TextBox ID="txtUsuario" runat="server" Width="216px" CssClass="TextoCajaNormal"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                ErrorMessage="*" Enabled="False"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td width="221" height="28">
            &nbsp;&nbsp; Contraseña:
        </td>
        <td align="left" width="244" height="25">
            <asp:TextBox ID="txtPassword" runat="server" Width="216px" CssClass="TextoCajaNormal"
                TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"
                Enabled="False"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td width="221" height="17">
        </td>
        <td align="right" width="244" height="17" valign="middle">
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="BotonNormal"
                Height="23px" CausesValidation="False"></asp:Button>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td width="221" height="8">
        </td>
        <td align="left" width="325" height="8">
        </td>
    </tr>
    <tr>
        <td width="221" colspan="2">
            &nbsp;<asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Visible="True" Width="304px"
                CssClass="EtiquetaNormal" Height="10px"></asp:Label>
        </td>
    </tr>
</table>
