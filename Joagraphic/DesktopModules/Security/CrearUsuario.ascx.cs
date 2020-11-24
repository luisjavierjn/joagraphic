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
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using Joagraphic.App_Code.Security;

namespace Joagraphic.DesktopModules.Security
{
	/// <summary>
	/// Summary description for ESSEP002A.
	/// </summary>
    public partial class CrearUsuario : System.Web.UI.UserControl //ESSEP002A
	{
        //protected System.Web.UI.WebControls.Label lblTitulo;
        //protected System.Web.UI.WebControls.ValidationSummary vsmErrores;
        //protected System.Web.UI.WebControls.Label lblError;
        //protected System.Web.UI.WebControls.Button btnAceptar;
        //protected System.Web.UI.WebControls.Button btnCancelar;
        //protected System.Web.UI.WebControls.TextBox txtCategoria;
        //protected System.Web.UI.WebControls.Label lblCategoria;
        //protected System.Web.UI.WebControls.TextBox txtNombre;
        //protected System.Web.UI.WebControls.Label lblNombre;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvCodigo;
        //protected System.Web.UI.WebControls.ImageButton ibtnBuscar;
        //protected System.Web.UI.WebControls.TextBox txtCodigo;
        //protected System.Web.UI.WebControls.Label lblCodigo;
        //protected System.Web.UI.WebControls.Label lblUsuario;
        //protected System.Web.UI.WebControls.TextBox txtUsuario;
        //protected System.Web.UI.WebControls.Label lblPassword;
        //protected System.Web.UI.WebControls.Label lblRepetir;
        //protected System.Web.UI.WebControls.TextBox txtRepetir;
        //protected JLovell.WebControls.StaticPostBackPosition StaticPostBackPosition1;
        //protected System.Web.UI.WebControls.CheckBox chkActivo;
        //protected System.Web.UI.WebControls.TextBox txtPassword;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvUsuario;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvPassword;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvRepetir;
        //protected System.Web.UI.WebControls.CompareValidator cmvPassword;
        //protected System.Web.UI.WebControls.Panel pnlPassword;
        //protected System.Web.UI.WebControls.Label Label1;
        //protected System.Web.UI.WebControls.TextBox txtComentarios;
        //protected System.Web.UI.WebControls.Label lblComentarios;
        //protected System.Web.UI.WebControls.Button btnCambiar;
        //protected System.Web.UI.WebControls.Panel pnlComentarios;
        //protected System.Web.UI.WebControls.CheckBox chkCambiar;

		private int intEmpleado 
		{
			get { return (int)ViewState["intEmpleado"]; }
			set { ViewState["intEmpleado"] = value; }			
		}

		private int intEmpleadoUsuario 
		{
			get { return (int)ViewState["intEmpleadoUsuario"]; }
			set { ViewState["intEmpleadoUsuario"] = value; }			
		}

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Carga el código de empleado activo en el sistema
                ESUsuario Empleado = new ESUsuario();
                Empleado.ObtenerUsuario((int)Session["IDUsuario"]);
                intEmpleado = Empleado.intCodStaff;

                intEmpleadoUsuario = Convert.ToInt32(Context.Items["intEmpleado"]);

                CargarAyuda();
                CargarErrores();

                if (intEmpleadoUsuario != 0)
                {
                    CargarUsuario();
                    pnlPassword.Visible = false;
                    ibtnBuscar.Visible = false;
                }

                btnCambiar.Visible = ESSeguridad.VerificarAcceso(intEmpleado, "ESSEP009A", 1);
            }
            btnCambiar.Attributes.Add("onclick", "javascript: CambiarPassword(' " + intEmpleadoUsuario.ToString() + "',false,'','true'); return false;");
            ibtnBuscar.Attributes.Add("onclick", "javascript: AbrirBusquedaEmpleadoUsuario(document.Form1.txtCodigo,document.Form1.txtNombre,document.Form1.txtCategoria,document.Form1.txtUsuario); return false;");

            if (!ESSeguridad.VerificarAcceso(intEmpleado, "ESSEP001A", 0))
            {
                //Response.Redirect("../Principal/Error.aspx");
            }
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
        //    this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
        //    this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
        //    this.Load += new System.EventHandler(this.Page_Load);

        //}
        //#endregion

		private void CargarUsuario()
		{
			ESUsuario Usuario = new ESUsuario(intEmpleadoUsuario);
			Usuario.CargarUsuario();

			txtCodigo.Text = Usuario.intCodStaff.ToString();
			txtNombre.Text = Usuario.strNombreLargo;
			txtCategoria.Text = Usuario.strCategoria;
			txtUsuario.Text = Usuario.strUsuario;
			chkActivo.Checked = Usuario.blnActivo;
			chkCambiar.Checked = Usuario.blnCambiarPassword;
			txtComentarios.Text = Usuario.strComentarios;

			txtUsuario.ReadOnly = true;
			txtUsuario.CssClass = "TextoBloqueado";
		}

		private void CargarAyuda()
		{
			lblCodigo.ToolTip = ESAyuda.ObtenerAyudaCampo(1043);
			lblNombre.ToolTip = ESAyuda.ObtenerAyudaCampo(1044);
			lblCategoria.ToolTip = ESAyuda.ObtenerAyudaCampo(1045);
			ibtnBuscar.ToolTip = ESAyuda.ObtenerAyudaCampo(725);
			
			lblUsuario.ToolTip = ESAyuda.ObtenerAyudaCampo(1039);
			lblPassword.ToolTip = ESAyuda.ObtenerAyudaCampo(1040);
			lblRepetir.ToolTip = ESAyuda.ObtenerAyudaCampo(1041);
			chkActivo.ToolTip = ESAyuda.ObtenerAyudaCampo(1042);	
		}

		private void CargarErrores()
		{
			rfvCodigo.ErrorMessage = ESMensajes.ObtenerMensaje(411);
			rfvUsuario.ErrorMessage = ESMensajes.ObtenerMensaje(412);
			rfvPassword.ErrorMessage = ESMensajes.ObtenerMensaje(413);
			rfvRepetir.ErrorMessage = ESMensajes.ObtenerMensaje(414);
			cmvPassword.ErrorMessage = ESMensajes.ObtenerMensaje(415);
		}

		protected void btnCancelar_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("ESSEP001A.aspx");
		}

		protected void btnAceptar_Click(object sender, System.EventArgs e)
		{
			ESUsuario Usuario = new ESUsuario();
		
			if(intEmpleadoUsuario == 0)
			{
				Usuario.VerificarUsuario(Convert.ToInt32(txtCodigo.Text), txtUsuario.Text);

				if(Convert.ToInt32(txtCodigo.Text) == Usuario.intCodStaff)
				{
					lblError.Text = ESMensajes.ObtenerMensaje(416);
					return;
				}

				if(txtUsuario.Text == Usuario.strUsuario)
				{
					lblError.Text = ESMensajes.ObtenerMensaje(417);;
					return;
				}
			}
			else
			{
				Usuario.intIDUsuario = 1;
			}

			Usuario.intCodStaff = Convert.ToInt32(txtCodigo.Text);
			Usuario.strUsuario = txtUsuario.Text;
			Usuario.strPassword = ESSeguridad.Encriptar(txtPassword.Text);
			Usuario.blnActivo = chkActivo.Checked;
			Usuario.blnCambiarPassword = chkCambiar.Checked;
			Usuario.strComentarios = txtComentarios.Text;

			if(Usuario.Guardar() > 0)
			{
				if(intEmpleadoUsuario == 0)
					ESLog.Log(intEmpleado,Session["Host"].ToString(),ESLog.TipoLog.Informativo,ESLog.TipoTransaccion.Insertar,"ESSEP002A",8, Usuario.intCodStaff.ToString(),"Usuario creado: " + Usuario.strUsuario);
				else
					ESLog.Log(intEmpleado,Session["Host"].ToString(),ESLog.TipoLog.Informativo,ESLog.TipoTransaccion.Actualizar,"ESSEP002A",8,intEmpleadoUsuario.ToString(),"Usuario actualizado: " + intEmpleadoUsuario.ToString());

				Response.Redirect("ESSEP001A.aspx");
			}
			else
			{
				lblError.Text = ESMensajes.ObtenerMensaje(418);;
				return;
			}
		}
	}
}
