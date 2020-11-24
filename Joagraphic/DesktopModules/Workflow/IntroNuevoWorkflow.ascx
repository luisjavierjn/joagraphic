<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IntroNuevoWorkflow.ascx.cs" Inherits="Joagraphic.DesktopModules.Workflow.IntroNuevoWorkflow" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<link href="../../Estilos.css" type="text/css" rel="stylesheet" />

<fieldset>
    <legend class="EtiquetaNormal">&nbsp;Introducci&oacute;n</legend>
    <table cellpadding="10" class="EtiquetaNormal">
        <tr>
            <td>
                Esta herramienta le guiar&aacute; a trav&eacute;s de pasos muy sencillos en la creaci&oacute;n
                de una nueva configuraci&oacute;n de Workflow.
                <br />
                <br />
                <asp:CheckBox ID="chkSkip" Text="Saltar la proxima vez" runat="Server" />
            </td>
        </tr>
    </table>
</fieldset>
