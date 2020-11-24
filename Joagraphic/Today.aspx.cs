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

public partial class Today : System.Web.UI.Page
{
    private static int intEmpleado;
    private const short shtNumeroDiasVigencia = 60;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Carga el código de empleado activo en el sistema
            ESUsuario Empleado = new ESUsuario();
            Empleado.ObtenerUsuario((int)Session["IDUsuario"]);
            intEmpleado = Empleado.intCodStaff;
        }
        Response.Redirect("Inbox.aspx");
    }
}
