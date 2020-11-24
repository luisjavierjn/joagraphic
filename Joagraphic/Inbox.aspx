<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Inbox" %>
<%@ Register TagPrefix="jlc" Namespace="JLovell.WebControls" Assembly="StaticPostBackPosition" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
    <title>Bandeja de Entrada</title>
    <link href="Estilos.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <div id="main">
        <asp:PlaceHolder ID="plhInboxItems" runat="server"></asp:PlaceHolder>
    </div>
    <jlc:StaticPostBackPosition ID="StaticPostBackPosition1" runat="server"></jlc:StaticPostBackPosition>
    </form>
</body>
</html>
