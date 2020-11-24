using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;

public partial class Security : System.Web.UI.Page
{
    List<string> _securityConfig;
    Control ctlConfigStep;

    public int Index
    {
        get
        {
            object obj = ViewState["IndexSecurity"];
            return (obj == null) ? 0 : (int)obj;
        }
        set
        {
            ViewState["IndexSecurity"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.Items["intStepIndex"] != null)
            Index = Convert.ToInt32(Context.Items["intStepIndex"]);
        //lblTituloArbol.Text = "'" + Convert.ToString(Context.Items["strNombre"]) + "'";

        //_index = 0;
        _securityConfig = new List<string>();
        _securityConfig.Add("DesktopModules/Security/Usuarios.ascx");
        _securityConfig.Add("DesktopModules/Security/CrearUsuario.ascx");
        _securityConfig.Add("DesktopModules/Security/Roles.ascx");
        //LoadConfigStep();
        ctlConfigStep = Page.LoadControl((string)_securityConfig[Index]);
        ctlConfigStep.ID = ctlConfigStep.ToString();
        plhSecurityConfig.Controls.Clear();
        plhSecurityConfig.Controls.Add(ctlConfigStep);
    }
}
