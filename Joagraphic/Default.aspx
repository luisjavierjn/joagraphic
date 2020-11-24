<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register TagPrefix="jlc" Namespace="JLovell.WebControls" Assembly="StaticPostBackPosition" %>
<%@ Register Src="DesktopModules/Login.ascx" TagName="Login" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head >
    <title>J::O::A::G::R::A::P::H::I::C</title>
    <link href="Estilos.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel id="Panel2" runat="server">
            <uc1:Login ID="Login1" runat="server" />
        </asp:Panel>
    </div>
    <jlc:staticpostbackposition id="StaticPostBackPosition1" runat="server"></jlc:staticpostbackposition>
    </form>
</body>
</html>
