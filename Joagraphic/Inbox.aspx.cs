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

public partial class Inbox : System.Web.UI.Page
{
    List<string> _inboxItems;
    Control ctlConfigStep;

    public int Index
    {
        get
        {
            object obj = ViewState["IndexInbox"];
            return (obj == null) ? 0 : (int)obj;
        }
        set
        {
            ViewState["IndexInbox"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Context.Items["intIndexInbox"] != null)
            Index = Convert.ToInt32(Context.Items["intIndexInbox"]);

        _inboxItems = new List<string>();
        _inboxItems.Add("DesktopModules/Inbox/WizardInbox.ascx");
        ctlConfigStep = Page.LoadControl((string)_inboxItems[Index]);
        ctlConfigStep.ID = ctlConfigStep.ToString();
        plhInboxItems.Controls.Clear();
        plhInboxItems.Controls.Add(ctlConfigStep);
    }
}
