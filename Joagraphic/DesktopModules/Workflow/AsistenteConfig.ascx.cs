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
using Joagraphic.App_Code.Workflow;
//using DotNetNuke.Entities.Modules;

namespace Joagraphic.DesktopModules.Workflow
{
    public partial class AsistenteConfig : System.Web.UI.UserControl
    {
        //protected System.Web.UI.WebControls.Label lblTitulo;
        //protected System.Web.UI.WebControls.ValidationSummary vsmErrores;
        //protected System.Web.UI.WebControls.Label lblError;
        //protected Microsoft.Web.UI.WebControls.TreeView tvWorkflow;
        //protected JLovell.WebControls.StaticPostBackPosition StaticPostBackPosition1;

        private const int NIVELES_EXPANDIDOS = 10;
        //protected System.Web.UI.WebControls.Button btnSalir;
        //protected System.Web.UI.WebControls.Label lblTituloArbol;
        private int _WorkflowId = -1;

        public int WorkflowId
        {
            get { return _WorkflowId; }
            set { _WorkflowId = value; }
        }

        private bool blnConsultar
        {
            get { return (bool)ViewState["blnConsultar"]; }
            set { ViewState["blnConsultar"] = (bool)value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            WorkflowId = Convert.ToInt32(Context.Items["intWorkflowId"]);
            //WorkflowId = Convert.ToInt32(Request.Params["intWorkflowId"]);
            lblTituloArbol.Text = "'" + Convert.ToString(Context.Items["strNombre"]) + "'";
            blnConsultar = Convert.ToBoolean(Context.Items["blnConsultar"]);
            //tvWorkflow.Visible = true;
            //tvWorkflow.ExpandLevel = NIVELES_EXPANDIDOS;

            wfTreeView.Visible = true;
            wfTreeView.ExpandAll();

            if (WorkflowId != -1)
            {
                //tvWorkflow.TreeNodeSrc = WFPolitica.ObtenerRepresentacionXmlConRoles(WorkflowId);
                //tvWorkflow.DataBind();

                wfTreeView.DataSource = WFPolitica.ObtenerRepresentacionXmlDataSourceConRoles(WorkflowId);

                TreeNodeBinding Binding = new TreeNodeBinding();
                Binding.TextField = "FullName";
                Binding.ValueField = "ID";
                wfTreeView.DataBindings.Add(Binding);

                wfTreeView.DataBind();

                if (blnConsultar)
                {
                    lblTitulo.Text = "Workflow > Consultar rutas de aprobación";
                    btnSalir.Text = "Regresar";
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            //Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(), true);
            Context.Items.Add("intWorkflowId", WorkflowId);
            Context.Items.Add("strNombre", lblTituloArbol.Text);
            Context.Items.Add("intStepIndex", 0);
            Server.Transfer("Workflow.aspx", false);
        }
}// fin de la clase
}// fin del namespace