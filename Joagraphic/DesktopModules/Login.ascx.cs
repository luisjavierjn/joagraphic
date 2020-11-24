//Desarrollado por: Yonny Florez.
//Fecha de Creación: 20/01/2005

using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using Joagraphic.App_Code.Security;

namespace Joagraphic.DesktopModules
{
	/// <summary>
	/// Control de acceso al sistema, requiere un nombre de usuario y una contraseña
	/// </summary> 
	public partial class Login : System.Web.UI.UserControl
	{
        //protected System.Web.UI.WebControls.Label lblMensaje;
        //protected System.Web.UI.WebControls.Button btnIngresar;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvPassword;
        //protected System.Web.UI.WebControls.TextBox txtPassword;
        //protected System.Web.UI.WebControls.RequiredFieldValidator rfvUsuario;
        //protected System.Web.UI.WebControls.TextBox txtUsuario;
		private static short shtCaducidad = 45;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
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
			this.btnIngresar.Click += new System.EventHandler(this.btnIngresar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnIngresar_Click(object sender, System.EventArgs e)
		{
			int intUsuError = 0;
			if(txtUsuario.Text == "")
			{
				lblMensaje.Height = 24;
				lblMensaje.Text = ESMensajes.ObtenerMensaje(384);
				return;
			}

			if(txtPassword.Text == "")
			{
				lblMensaje.Height = 24;
				lblMensaje.Text = ESMensajes.ObtenerMensaje(385);
				return;
			}
			
			ESUsuario Usuario = new ESUsuario();
			int intUsuario = Usuario.Login(txtUsuario.Text, ESSeguridad.Encriptar(txtPassword.Text));

			try
			{ Session["Host"] = System.Net.Dns.GetHostByAddress(Request.ServerVariables["REMOTE_ADDR"]).HostName; }
			catch
			{ Session["Host"] = "N/A"; }

			if (intUsuario > 0)
			{
				ESLog.Log(intUsuario,Session["Host"].ToString(),ESLog.TipoLog.Informativo,ESLog.TipoTransaccion.Desconocida,"",8,"","Acceso al sistema");
				ESUsuario.VerificarCaducidad(intUsuario, shtCaducidad);
			
				FormsAuthentication.SetAuthCookie(txtUsuario.Text, false);
				Session["IDUsuario"] = intUsuario;
				Response.Redirect("Default.aspx");
			}
			else
			{	
				switch(intUsuario)
				{						
					case  0: // La contraseña es incorrecta
						lblMensaje.Height = 24;
						lblMensaje.Text = ESMensajes.ObtenerMensaje(383); 
						intUsuError = Usuario.Login(txtUsuario.Text);
						ESLog.Log(intUsuError,Session["Host"].ToString(),ESLog.TipoLog.Informativo,ESLog.TipoTransaccion.Desconocida,"Principal",8,Convert.ToString(intUsuError),"La contraseña del usuario es incorrecta");
						return;
					case -1: 
						lblMensaje.Height = 24;
						lblMensaje.Text = ESMensajes.ObtenerMensaje(593);
						intUsuError = Usuario.Login(txtUsuario.Text);
						string strUsuError = "El usuario " + txtUsuario.Text + " ha sido desactivado";
						ESLog.Log(intUsuError,Session["Host"].ToString(),ESLog.TipoLog.Informativo,ESLog.TipoTransaccion.Desconocida,"Principal",8,Convert.ToString(intUsuError), strUsuError);
						return;
					case -2: // El usuario no existe en el sistema
						lblMensaje.Height = 24;
						lblMensaje.Text = ESMensajes.ObtenerMensaje(594);  
						intUsuError = Usuario.Login(txtUsuario.Text);
						ESLog.Log(intUsuError,Session["Host"].ToString(),ESLog.TipoLog.Informativo,ESLog.TipoTransaccion.Desconocida,"Principal",8,"","El usuario no existe en el sistema");
						return;
//===< By Ramón
					case -3:	// Cierre de Sistema
						lblMensaje.Text = ESMensajes.ObtenerMensaje(688);  
						return;
					case -4:	// Publicación de SPIN
						lblMensaje.Text = ESMensajes.ObtenerMensaje(691);  
						return;
					case -5:	// Labores de mantenimiento
						lblMensaje.Text = ESMensajes.ObtenerMensaje(692);  
						return;
//===>
				}
			}
		}
	}
}
