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
using Joagraphic.App_Code.Security;

namespace Joagraphic.DesktopModules.Security
{
    public partial class Roles : System.Web.UI.UserControl //ESSEP003A
    {
        //protected System.Web.UI.WebControls.Label lblTitulo;
        //protected System.Web.UI.WebControls.ValidationSummary vsmErrores;
        //protected System.Web.UI.WebControls.Label lblError;
        //protected System.Web.UI.WebControls.Label lblCantidad;
        //protected System.Web.UI.WebControls.DataGrid dgdRoles;
        //protected JLovell.WebControls.StaticPostBackPosition StaticPostBackPosition1;
        //protected System.Web.UI.WebControls.ImageButton ibtnCancelar;
        //protected System.Web.UI.WebControls.ImageButton ibtnAgregar;
        //protected System.Web.UI.WebControls.TextBox txtRolInsertar;
        //protected System.Web.UI.WebControls.TextBox txtDescripcionInsertar;
        //protected System.Web.UI.WebControls.Button btnCancelar;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvRolInsertar;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvDescripcionInsertar;

        private ArrayList arrAyuda
        {
            get { return (ArrayList)ViewState["arrAyuda"]; }
            set { ViewState["arrAyuda"] = value; }
        }

        private ArrayList arrErrores
        {
            get { return (ArrayList)ViewState["arrAyuda"]; }
            set { ViewState["arrAyuda"] = value; }
        }

        private int intEmpleado
        {
            get { return (int)ViewState["intEmpleado"]; }
            set { ViewState["intEmpleado"] = value; }
        }

        private int intRoles
        {
            get { return (int)ViewState["intRoles"]; }
            set { ViewState["intRoles"] = value; }
        }

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Carga el código de empleado activo en el sistema
                ESUsuario Empleado = new ESUsuario();
                Empleado.ObtenerUsuario((int)Session["IDUsuario"]);
                intEmpleado = Empleado.intCodStaff;

                arrAyuda = new ArrayList();
                arrErrores = new ArrayList();

                CargarAyuda();
                CargarErrores();

                EnlazarGridRoles();
            }

            if (!ESSeguridad.VerificarAcceso(intEmpleado, "ESSEP003A", 0))
            {
                Response.Redirect("../Principal/Error.aspx");
            }
        }

        private void CargarAyuda()
        {
            ibtnAgregar.ToolTip = ESAyuda.ObtenerAyudaCampo(1307);
            ibtnCancelar.ToolTip = ESAyuda.ObtenerAyudaCampo(1308);

            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1309));	// Actualizar
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1310));	// Asignar transacciones
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1311));	// Guardar
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1312));	// Cancelar
        }

        private void CargarErrores()
        {
            rfvRolInsertar.ErrorMessage = ESMensajes.ObtenerMensaje(524);
            rfvDescripcionInsertar.ErrorMessage = ESMensajes.ObtenerMensaje(525);
        }

        private void EnlazarGridRoles()
        {
            ESColeccionRol arrRoles = new ESColeccionRol();
            dgdRoles.DataSource = arrRoles = ESRol.ListarRoles();
            dgdRoles.DataBind();

            if (strOrdenar != "")
                OrdenarGridRoles(arrRoles);

            lblCantidad.Text = arrRoles.Count.ToString() + " Roles";
            intRoles = arrRoles.Count;
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgdRoles.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgdRoles_ItemCreated);
            this.dgdRoles.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgdRoles_ItemCommand);
            this.dgdRoles.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dgdRoles_PageIndexChanged);
            this.dgdRoles.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgdRoles_CancelCommand);
            this.dgdRoles.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgdRoles_EditCommand);
            this.dgdRoles.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgdRoles_UpdateCommand);
            this.ibtnAgregar.Click += new System.Web.UI.ImageClickEventHandler(this.ibtnAgregar_Click);
            this.ibtnCancelar.Click += new System.Web.UI.ImageClickEventHandler(this.ibtnCancelar_Click);
            this.btnCancelar.Click += new System.EventHandler(this.btnCrear_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void dgdRoles_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgdRoles.CurrentPageIndex = e.NewPageIndex;
            EnlazarGridRoles();
        }

        private void btnCrear_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("ESSEP004A.aspx");
        }

        private void ibtnAgregar_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            dgdRoles.EditItemIndex = -1;
            EnlazarGridRoles();

            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            ESRol Rol = new ESRol(txtRolInsertar.Text, txtDescripcionInsertar.Text);
            if (Rol.Guardar() > 0)
            {
                if (intRoles % dgdRoles.PageSize == 0)
                    dgdRoles.CurrentPageIndex = dgdRoles.PageCount;
                else
                    dgdRoles.CurrentPageIndex = dgdRoles.PageCount - 1;

                ESLog.Log(intEmpleado, Session["Host"].ToString(), ESLog.TipoLog.Informativo, ESLog.TipoTransaccion.Insertar, "ESSEP003A", 8, "", txtRolInsertar.Text);

                strOrdenar = "";
                EnlazarGridRoles();
            }
            else
            {
                lblError.Text = "Error";
                return;
            }

            LimpiarInsertar();
        }

        private void ibtnCancelar_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            LimpiarInsertar();
        }

        private void LimpiarInsertar()
        {
            txtRolInsertar.Text = string.Empty;
            txtDescripcionInsertar.Text = string.Empty;
        }

        private void dgdRoles_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Asignar")
            {
                Context.Items.Add("shtRol", ((Label)e.Item.FindControl("lblNumero")).Text);
                Context.Items.Add("strRol", ((Label)e.Item.FindControl("lblRol")).Text);

                Server.Transfer("ESSEP004A.aspx", true);
            }

            if ((string)e.CommandArgument == "Ordenar")
            {
                strOrdenar = e.CommandName;
                ESColeccionRol arrRoles = ESRol.ListarRoles();
                OrdenarGridRoles(arrRoles);
            }
        }

        private void dgdRoles_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.EditItem)
            {
                ((ImageButton)e.Item.FindControl("ibtnActualizar")).ToolTip = arrAyuda[2].ToString();
                ((ImageButton)e.Item.FindControl("ibtnCancel")).ToolTip = arrAyuda[3].ToString();

                ((RequiredFieldValidator)e.Item.FindControl("rfvRol")).ErrorMessage = ESMensajes.ObtenerMensaje(524);
                ((RequiredFieldValidator)e.Item.FindControl("rfvDescripcion")).ErrorMessage = ESMensajes.ObtenerMensaje(525);

            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ((ImageButton)e.Item.FindControl("ibtnEditar")).ToolTip = arrAyuda[0].ToString();
                ((ImageButton)e.Item.FindControl("ibtnAsignar")).ToolTip = arrAyuda[1].ToString();
            }

            //Altera el Pager del Grid. Coloca la palabra "Página"
            if (e.Item.ItemType == ListItemType.Pager)
            {
                TableCell Celda = e.Item.Cells[0];

                Label lblPagina = new Label();
                lblPagina.Width = 40;
                lblPagina.CssClass = "EtiquetaNormal";
                lblPagina.Text = "Página";

                Celda.Controls.AddAt(0, lblPagina);
            }
        }

        private void dgdRoles_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgdRoles.EditItemIndex = e.Item.ItemIndex;
            EnlazarGridRoles();
        }

        private void dgdRoles_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            rfvRolInsertar.Enabled = false;
            rfvDescripcionInsertar.Enabled = false;

            Page.Validate();

            if (!Page.IsValid)
            {
                rfvRolInsertar.Enabled = true;
                rfvDescripcionInsertar.Enabled = true;
                return;
            }

            rfvRolInsertar.Enabled = true;
            rfvDescripcionInsertar.Enabled = true;

            ESRol Rol = new ESRol(Convert.ToInt16(((Label)e.Item.FindControl("lblNumeroEdit")).Text), ((TextBox)e.Item.FindControl("txtRol")).Text, ((TextBox)e.Item.FindControl("txtDescripcion")).Text);
            if (Rol.Guardar() < 1)
            {
                lblError.Text = ESMensajes.ObtenerMensaje(526);
                return;
            }

            dgdRoles.EditItemIndex = -1;
            EnlazarGridRoles();

        }

        /// <summary>
        /// Ordenar una columna determinada del Grid.
        /// </summary>
        private void OrdenarGridRoles(ESColeccionRol arrRoles)
        {
            ESColeccionRol.RolCampos Columna = ESColeccionRol.RolCampos.Numero;

            switch (strOrdenar)
            {
                case "Numero":
                    Columna = ESColeccionRol.RolCampos.Numero;
                    break;
                case "Rol":
                    Columna = ESColeccionRol.RolCampos.Rol;
                    break;
                case "Descripcion":
                    Columna = ESColeccionRol.RolCampos.Descripcion;
                    break;
            }

            arrRoles.Ordenar(Columna, blnAscendiente);
            dgdRoles.DataSource = arrRoles;
            dgdRoles.DataBind();
        }

        private void dgdRoles_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dgdRoles.EditItemIndex = -1;
            EnlazarGridRoles();
        }

        /// <summary>
        /// Declaración de la propiedad strOrdenar.
        /// Guarda el nombre de la última columna ordenada en el ViewState de la página.
        /// </summary>
        string strOrdenar
        {
            get
            {
                object objOrdenar = ViewState["strOrdenar"];
                if (objOrdenar == null) return String.Empty;
                return (string)objOrdenar;
            }

            set
            {
                if (value == strOrdenar) blnAscendiente = !blnAscendiente;
                ViewState["strOrdenar"] = value;
            }
        }

        /// <summary>
        /// Declaración de la propiedad boolAscendiente
        /// Guarda la última forma de ordenación del Grid en el ViewState de la página.
        /// true: Orden ascendente.
        /// false: Orden descendente.
        /// </summary>
        bool blnAscendiente
        {
            get
            {
                object objAscendiente = ViewState["blnAscendiente"];
                if (objAscendiente == null) return true;
                return (bool)objAscendiente;
            }

            set
            {
                ViewState["blnAscendiente"] = value;
            }
        }
    }
}