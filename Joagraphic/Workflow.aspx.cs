using System;
using System.Collections;
using System.Collections.Generic;
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
using System.Web.SessionState;
using Joagraphic.App_Code.Workflow;
using System.ComponentModel;

public partial class Workflow : System.Web.UI.Page
{
    List<string> _workflowConfig;
    Control ctlConfigStep;
    //{
    //    get { return (Control)ViewState["ctlConfigStep"]; }
    //    set { ViewState["ctlConfigStep"] = value; }
    //}

    public int Index
    {
        get
        {
            object obj = ViewState["IndexWorkflow"];
            return (obj == null) ? 0 : (int)obj;
        }
        set
        {
            ViewState["IndexWorkflow"] = value;
        }
    }

    //protected void Page_Init(object sender, EventArgs e)
    //{
    //    //if (ctlConfigStep != null)
    //    //    plhWorkflowConfig.Controls.Add(ctlConfigStep);
    //}

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        if (Context.Items["intStepIndex"] != null)
            Index = Convert.ToInt32(Context.Items["intStepIndex"]);
        //lblTituloArbol.Text = "'" + Convert.ToString(Context.Items["strNombre"]) + "'";

        //_index = 0;
        _workflowConfig = new List<string>();
        _workflowConfig.Add("DesktopModules/Workflow/WizardWorkflow.ascx");
        _workflowConfig.Add("DesktopModules/Workflow/AsistenteConfig.ascx");
        //LoadConfigStep();
        ctlConfigStep = Page.LoadControl((string)_workflowConfig[Index]);
        ctlConfigStep.ID = ctlConfigStep.ToString();
        plhWorkflowConfig.Controls.Clear();
        plhWorkflowConfig.Controls.Add(ctlConfigStep);
        //}
    }

    void LoadConfigStep()
    {
        ctlConfigStep = Page.LoadControl((string)_workflowConfig[Index]);
        ctlConfigStep.ID = "ctlConfigStep";
        //plhWorkflowConfig.Controls.Clear();
        plhWorkflowConfig.Controls.Add(ctlConfigStep);
    }
}
