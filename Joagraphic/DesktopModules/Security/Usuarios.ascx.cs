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
    public partial class Usuarios : System.Web.UI.UserControl
    {
        //protected System.Web.UI.WebControls.Label lblTitulo;
        //protected System.Web.UI.WebControls.ValidationSummary vsmErrores;
        //protected System.Web.UI.WebControls.Label lblError;
        //protected System.Web.UI.WebControls.Button btnCrear;
        //protected System.Web.UI.WebControls.DataGrid dgdUsuarios;
        //protected System.Web.UI.WebControls.Label lblCantidad;
        //protected JLovell.WebControls.StaticPostBackPosition StaticPostBackPosition1;
        //protected System.Web.UI.WebControls.DropDownList ddlLoS;
        //protected System.Web.UI.WebControls.DropDownList ddlOficina;
        //protected System.Web.UI.WebControls.ImageButton ibtnBuscar;
        //protected System.Web.UI.WebControls.Label lblCodigoNombre;
        //protected System.Web.UI.WebControls.Label lblLoSGeneral;
        //protected System.Web.UI.WebControls.Label lblOficinaGeneral;
        //protected System.Web.UI.WebControls.TextBox txtNombreCodigo;
        //protected System.Web.UI.WebControls.Label lblEstatus;
        //protected System.Web.UI.WebControls.DropDownList ddlEstatus;
        //protected System.Web.UI.WebControls.Label Label1;
        //protected System.Web.UI.WebControls.Button btnImprimir;
        //protected System.Web.UI.WebControls.TextBox txtOculto;
        //protected System.Web.UI.WebControls.Button btnImprimirTransacciones;

        private ArrayList arrAyuda
        {
            get { return (ArrayList)ViewState["arrAyuda"]; }
            set { ViewState["arrAyuda"] = value; }
        }

        private int intEmpleado
        {
            get { return (int)ViewState["intEmpleado"]; }
            set { ViewState["intEmpleado"] = value; }
        }

        private int intUsuarios
        {
            get { return (int)ViewState["intUsuarios"]; }
            set { ViewState["intUsuarios"] = value; }
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
                CargarAyuda();

                CargarLoS();
                CargarOficinas();
                EnlazarGridUsuarios();
            }

            if (!ESSeguridad.VerificarAcceso(intEmpleado, "ESSEP001A", 0))
            {
                //------ Response.Redirect("../Principal/Error.aspx");
            }
        }

        private void CrearReporte()
        {
            //ESSER001A Reporte = new ESSER001A();

            //Reporte.SetDatabaseLogon("sa-spin", ESSeguridad.CargarContrasenaConexion());
            //Reporte.SetParameterValue("@strBuscarInicial", txtNombreCodigo.Text);
            //Reporte.SetParameterValue("@shtLoS", Convert.ToInt16(ddlLoS.SelectedValue));
            //Reporte.SetParameterValue("@shtEstatus", Convert.ToInt16(ddlEstatus.SelectedValue));
            //Reporte.SetParameterValue("@shtOficina", Convert.ToInt16(ddlOficina.SelectedValue));
            //Reporte.SetParameterValue("@Usuarios", Convert.ToString(intUsuarios));

            //Session["AtributosSEA"] = Reporte;

            //Response.Write("<script language='javascript' src='../Principal/script.js' type='text/javascript'></script>");
            //Response.Write("<script language='javascript'>");
            //Response.Write("AbrirReporte('ESSER.aspx?intReporte=1', 800, 550);");
            //Response.Write("</script>");
        }

        private void CrearReporteCompleto()
        {
            //ESSER003A ReporteCompleto = new ESSER003A();

            //ReporteCompleto.SetDatabaseLogon("sa-spin", ESSeguridad.CargarContrasenaConexion());
            //ReporteCompleto.SetParameterValue("@strBuscarInicial", txtNombreCodigo.Text);
            //ReporteCompleto.SetParameterValue("@shtLoS", Convert.ToInt16(ddlLoS.SelectedValue));
            //ReporteCompleto.SetParameterValue("@shtEstatus", Convert.ToInt16(ddlEstatus.SelectedValue));
            //ReporteCompleto.SetParameterValue("@shtOficina", Convert.ToInt16(ddlOficina.SelectedValue));

            //Session["AtributosSEB"] = ReporteCompleto;

            //Response.Write("<script language='javascript' src='../Principal/script.js' type='text/javascript'></script>");
            //Response.Write("<script language='javascript'>");
            //Response.Write("AbrirReporte('ESSER.aspx?intReporte=3', 800, 550);");
            //Response.Write("</script>");
        }


        private void CargarAyuda()
        {
            btnCrear.ToolTip = ESAyuda.ObtenerAyudaCampo(1306);
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1298));	// Creación
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1299));	// Código
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1300));	// Usuario
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1301));	// Nombre
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1302));	// LoS o Departamento
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1303));	// Oficina
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1304));	// Estatus

            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(254));	// Editar
            arrAyuda.Add(ESAyuda.ObtenerAyudaCampo(1305));	// Asignar rol

            lblCodigoNombre.ToolTip = ESAyuda.ObtenerAyudaCampo(77);
            lblLoSGeneral.ToolTip = ESAyuda.ObtenerAyudaCampo(714);
            lblOficinaGeneral.ToolTip = ESAyuda.ObtenerAyudaCampo(1038);
            ibtnBuscar.ToolTip = ESAyuda.ObtenerAyudaCampo(73);
        }

        private void EnlazarGridUsuarios()
        {
            ESColeccionUsuario arrUsuarios = new ESColeccionUsuario();

            arrUsuarios = ESUsuario.ListarUsuarios(txtNombreCodigo.Text, Convert.ToInt16(ddlLoS.SelectedValue), Convert.ToInt16(ddlEstatus.SelectedValue), Convert.ToInt16(ddlOficina.SelectedValue));
            dgdUsuarios.DataSource = arrUsuarios;
            dgdUsuarios.DataBind();

            lblCantidad.Text = arrUsuarios.Count.ToString() + " Usuarios";
            intUsuarios = arrUsuarios.Count;

            btnImprimir.Visible = arrUsuarios.Count > 0;
            btnImprimirTransacciones.Visible = arrUsuarios.Count > 0;

            if (strOrdenar != "")
                OrdenarGridUsuarios(arrUsuarios);
        }

        private void CargarLoS()
        {
            ddlLoS.DataSource = ESDepartamento.ListarLoSDepartamento();
            ddlLoS.DataValueField = "shtCodDepartamento";
            ddlLoS.DataTextField = "strDescDepartamento";
            ddlLoS.DataBind();
        }

        private void CargarOficinas()
        {
            ddlOficina.DataSource = ESOficina.ListarOficinas();
            ddlOficina.DataValueField = "shtCodOficina";
            ddlOficina.DataTextField = "strDescripcion";
            ddlOficina.DataBind();
        }

        //#region Web Form Designer generated code
        //override protected void OnInit(EventArgs e)
        //{
        //    //
        //    // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //    //
        //    InitializeComponent();
        //    base.OnInit(e);
        //}

        ///// <summary>
        ///// Required method for Designer support - do not modify
        ///// the contents of this method with the code editor.
        ///// </summary>
        //private void InitializeComponent()
        //{
        //    this.ibtnBuscar.Click += new System.Web.UI.ImageClickEventHandler(this.ibtnBuscar_Click);
        //    this.dgdUsuarios.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dgdUsuarios_ItemCreated);
        //    this.dgdUsuarios.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dgdUsuarios_ItemCommand);
        //    this.dgdUsuarios.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dgdUsuarios_PageIndexChanged);
        //    this.btnCrear.Click += new System.EventHandler(this.btnCrear_Click);
        //    this.btnImprimir.Click += new System.EventHandler(this.btnImprimir_Click);
        //    this.btnImprimirTransacciones.Click += new System.EventHandler(this.btnImprimirTransacciones_Click);
        //    this.Load += new System.EventHandler(this.Page_Load);

        //}
        //#endregion

        protected void btnCrear_Click(object sender, System.EventArgs e)
        {
            Context.Items.Add("intStepIndex", 1);
            Server.Transfer("Security.aspx", false);
            //Response.Redirect("ESSEP002A.aspx");
        }

        protected void dgdUsuarios_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dgdUsuarios.CurrentPageIndex = e.NewPageIndex;
            EnlazarGridUsuarios();
        }

        protected void dgdUsuarios_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                ((LinkButton)e.Item.FindControl("lbtnFecha")).ToolTip = arrAyuda[0].ToString();
                ((LinkButton)e.Item.FindControl("lbtnCodigoTitulo")).ToolTip = arrAyuda[1].ToString();
                ((LinkButton)e.Item.FindControl("lbtnUsuarioTitulo")).ToolTip = arrAyuda[2].ToString();
                ((LinkButton)e.Item.FindControl("lbtnNombreTitulo")).ToolTip = arrAyuda[3].ToString();
                ((LinkButton)e.Item.FindControl("lbtnLinea")).ToolTip = arrAyuda[4].ToString();
                ((LinkButton)e.Item.FindControl("lbtnOficinaTitulo")).ToolTip = arrAyuda[5].ToString();
                ((LinkButton)e.Item.FindControl("lbtnEstatus")).ToolTip = arrAyuda[6].ToString();
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ((ImageButton)e.Item.FindControl("ibtnEditar")).ToolTip = arrAyuda[7].ToString();
                ((ImageButton)e.Item.FindControl("ibtnAsignar")).ToolTip = arrAyuda[8].ToString();
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

        /// <summary>
        /// Ordenar una columna determinada del Grid.
        /// </summary>
        private void OrdenarGridUsuarios(ESColeccionUsuario arrUsuarios)
        {
            ESColeccionUsuario.UsuarioCampos Columna = ESColeccionUsuario.UsuarioCampos.Fecha;

            switch (strOrdenar)
            {
                case "Fecha":
                    Columna = ESColeccionUsuario.UsuarioCampos.Fecha;
                    break;
                case "Codigo":
                    Columna = ESColeccionUsuario.UsuarioCampos.Codigo;
                    break;
                case "Usuario":
                    Columna = ESColeccionUsuario.UsuarioCampos.Usuario;
                    break;
                case "Nombre":
                    Columna = ESColeccionUsuario.UsuarioCampos.Nombre;
                    break;
                case "Linea":
                    Columna = ESColeccionUsuario.UsuarioCampos.Linea;
                    break;
                case "Oficina":
                    Columna = ESColeccionUsuario.UsuarioCampos.Oficina;
                    break;
                case "Estatus":
                    Columna = ESColeccionUsuario.UsuarioCampos.Estatus;
                    break;
                case "Categoria":
                    Columna = ESColeccionUsuario.UsuarioCampos.Categoria;
                    break;

            }

            arrUsuarios.Ordenar(Columna, blnAscendiente);
            dgdUsuarios.DataSource = arrUsuarios;
            dgdUsuarios.DataBind();
        }

        protected void dgdUsuarios_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if ((string)e.CommandArgument == "Ordenar")
            {
                strOrdenar = e.CommandName;
                ESColeccionUsuario arrUsuarios = ESUsuario.ListarUsuarios(txtNombreCodigo.Text, Convert.ToInt16(ddlLoS.SelectedValue), Convert.ToInt16(ddlEstatus.SelectedValue), Convert.ToInt16(ddlOficina.SelectedValue));
                OrdenarGridUsuarios(arrUsuarios);
            }

            if (e.CommandName == "Edit")
            {
                Context.Items.Add("intEmpleado", ((Label)e.Item.FindControl("lblCodigo")).Text);
                Context.Items.Add("intStepIndex", 1);
                Server.Transfer("Security.aspx", false);
                //Server.Transfer("ESSEP002A.aspx", true);
            }

            if (e.CommandName == "Roles")
            {
                Context.Items.Add("intCodigo", ((Label)e.Item.FindControl("lblCodigo")).Text);
                Context.Items.Add("strNombre", ((Label)e.Item.FindControl("lblNombre")).Text);
                Context.Items.Add("strUsuario", ((Label)e.Item.FindControl("lblUsuario")).Text);
                Context.Items.Add("strCategoria", ((Label)e.Item.FindControl("lblCategoria")).Text);

                Server.Transfer("ESSEP006A.aspx", true);
            }
        }

        protected void ibtnBuscar_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            dgdUsuarios.CurrentPageIndex = 0;
            EnlazarGridUsuarios();
        }

        protected void btnImprimir_Click(object sender, System.EventArgs e)
        {
            CrearReporte();
        }

        protected void btnImprimirTransacciones_Click(object sender, System.EventArgs e)
        {
            CrearReporteCompleto();
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