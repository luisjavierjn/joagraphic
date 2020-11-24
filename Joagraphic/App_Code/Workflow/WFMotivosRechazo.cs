using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using Joagraphic.App_Code.DataAccess;
using Joagraphic.App_Code.Security;

namespace Joagraphic.App_Code.Workflow
{
    /// <summary>
    /// Descripción breve de ESMotivosRechazo
    /// </summary>
    public class WFMotivosRechazo
    {
        private int _intMotivoRechazo = 0;
        private string _strMotivoRechazo = string.Empty;


        public int intMotivoRechazo
        {
            get { return _intMotivoRechazo; }
            set { _intMotivoRechazo = value; }
        }

        public string strMotivoRechazo
        {
            get { return _strMotivoRechazo; }
            set { _strMotivoRechazo = value; }
        }


        public WFMotivosRechazo()
        {
        }

        public WFMotivosRechazo(int ID, string Descripcion)
        {
            _intMotivoRechazo = ID;
            _strMotivoRechazo = Descripcion;
        }

        public static ArrayList ListarMotivosRechazo()
        {
            ArrayList MotivosRechazo = new ArrayList();
            DataSet ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(), Queries.WF_ListarMotivosRechazo);

            WFMotivosRechazo objInicial = new WFMotivosRechazo(0, "[Seleccione]");
            MotivosRechazo.Add(objInicial);

            foreach (DataRow r in ds.Tables[0].Rows)
            {
                WFMotivosRechazo objMotivosRechazo = new WFMotivosRechazo();
                objMotivosRechazo.intMotivoRechazo = Convert.ToInt32(r["rcz_cod_rechazo"]);
                objMotivosRechazo.strMotivoRechazo = r["rcz_desc_rechazo"].ToString();

                MotivosRechazo.Add(objMotivosRechazo);
            }
            return MotivosRechazo;
        }
    }
}