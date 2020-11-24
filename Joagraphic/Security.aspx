<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Security.aspx.cs" Inherits="Security" %>
<%@ Register TagPrefix="jlc" Namespace="JLovell.WebControls" Assembly="StaticPostBackPosition" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
    <title>Configuración de Seguridad</title>
    <link href="Estilos.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:PlaceHolder ID="plhSecurityConfig" runat="server"></asp:PlaceHolder>
    </div>
    <jlc:StaticPostBackPosition ID="StaticPostBackPosition1" runat="server"></jlc:StaticPostBackPosition>
    </form>
</body>
</html>
