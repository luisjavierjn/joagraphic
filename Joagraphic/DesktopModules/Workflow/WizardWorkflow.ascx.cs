﻿using System;
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

using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
//using Microsoft.Web.UI.WebControls;
//using DotNetNuke.Entities.Modules;
//using DotNetNuke.Entities.Users;
//using Joagraphic.App_Code.BLL;
using Joagraphic.App_Code.Workflow;

namespace Joagraphic.DesktopModules.Workflow
{
    public partial class WizardWorkflow : System.Web.UI.UserControl
    {
        
        #region Web Form Designer generated code
        //override protected void OnInit(EventArgs e)
        //{
        //    //
        //    // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //    //
        //    InitializeComponent();
        //    base.OnInit(e);
        //}

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            this.btnNext.Click += new System.EventHandler(this.btnNext_Click);
            this.Load += new System.EventHandler(this.Page_Load);
            this.PreRender += new System.EventHandler(this.Page_PreRender);
        }
        #endregion

        protected void wfTreeView_SelectedNodeChanged(object sender, EventArgs e)
        {
            //System.Web.UI.WebControls.TreeView wft = (System.Web.UI.WebControls.TreeView)Componentes.Web.Global.FindMyControl(Page, "wfTreeView");
            //NodeIndex.Value = wft.SelectedNode.ValuePath;
            NodeIndex.Value = wfTreeView.SelectedNode != null ? wfTreeView.SelectedNode.ValuePath : "0";
            LoadWizardStep();
        }

        ArrayList WizardSteps = new ArrayList();
        Control ctlWizardStep;

        int WorkflowId
        {
            get
            {
                if (ViewState["WorkflowId"] == null)
                    return -1;
                else
                    return (int)ViewState["WorkflowId"];
            }

            set { ViewState["WorkflowId"] = value; }
        }

        int StepIndex
        {
            get
            {
                if (ViewState["StepIndex"] == null)
                    return 0;
                else
                    return (int)ViewState["StepIndex"];
            }

            set { ViewState["StepIndex"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //WorkflowId = Request.Form[WorkflowId.UniqueID];
            //txtAddress2.Text = Request.Form[txtAddress2.UniqueID];            

            if (WizardSteps.Count == 0)
            {
                if (Request.Cookies[Web.Global.SkipWorkflowIntro] == null)
                    WizardSteps.Add("DesktopModules/Workflow/IntroNuevoWorkflow.ascx");
                WizardSteps.Add("DesktopModules/Workflow/DocumentoWorkflow.ascx");
                WizardSteps.Add("DesktopModules/Workflow/PoliticasWorkflow.ascx");
                WizardSteps.Add("DesktopModules/Workflow/ResumenWorkflow.ascx");
                WizardSteps.Add("DesktopModules/Workflow/DescripcionWorkflow.ascx");
            }
            LoadWizardStep();
        }

        void Page_PreRender(object sender, System.EventArgs e)
        {
            if (StepIndex == 0)
                btnBack.Visible = false;
            else
                btnBack.Visible = true;

            if (StepIndex == (WizardSteps.Count - 1))
                btnNext.Text = "Fin";
            else
                btnNext.Text = "Siguiente";
        }

        void LoadWizardStep()
        {
            //tvWorkflow.Visible = false;
            //tvWorkflow.AutoPostBack = false;

            //System.Web.UI.WebControls.TreeView wft = (System.Web.UI.WebControls.TreeView)Componentes.Web.Global.FindMyControl(Page, "wfTreeView");
            //NodeIndex.Value = wft.SelectedNode != null ? wft.SelectedNode.ValuePath : "0";

            //NodeIndex.Value = wfTreeView.SelectedNode != null ? wfTreeView.SelectedNode.ValuePath : String.Empty;            
            ctlWizardStep = Page.LoadControl((string)WizardSteps[StepIndex]);
            ctlWizardStep.ID = "ctlWizardStep";
            ((WFIEditarControlWorkflow)ctlWizardStep).WorkflowId = WorkflowId;
            ((WFIEditarControlWorkflow)ctlWizardStep).NodeIndex = NodeIndex.Value;
            plhWizardStep.Controls.Clear();
            plhWizardStep.Controls.Add(ctlWizardStep);
            ((WFIEditarControlWorkflow)ctlWizardStep).Initialize();
            lblStepNumber.Text = String.Format("(Paso {0} de {1})", StepIndex + 1, WizardSteps.Count);
         }

        protected void btnNext_Click(object sender, System.EventArgs e)
        {
            if (((WFIEditarControlWorkflow)ctlWizardStep).Update())
            {
                WorkflowId = ((WFIEditarControlWorkflow)ctlWizardStep).WorkflowId;
                StepIndex++;
                if (StepIndex == WizardSteps.Count)
                {
                    Context.Items.Add("intWorkflowId", WorkflowId);
                    Context.Items.Add("strNombre", lblNombre.Text);
                    Context.Items.Add("intStepIndex", 1);
                    Server.Transfer("Workflow.aspx", false);
                }
                else
                    LoadWizardStep();
            }
        }

        protected void btnBack_Click(object sender, System.EventArgs e)
        {
            StepIndex--;
            LoadWizardStep();
        }

        protected void btnCancel_Click(object sender, System.EventArgs e)
        {
            //Response.Redirect("../Principal/Default.aspx");
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //string pwd = ESSeguridad.EncriptarTexto("qupadl30", null);
        //    //string pwd = ESSeguridad.DesencriptarTexto("fe1WDAN6DvDZbfCPFJ3IRQ==", null);
        //    //string tmp = pwd;
        //}

    }// fin de la clase
}//fin del namespace