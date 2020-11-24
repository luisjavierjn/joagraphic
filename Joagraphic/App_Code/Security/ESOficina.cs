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
using System.Text;
using Joagraphic.App_Code.DataAccess;

namespace Joagraphic.App_Code.Security
{
    /// <summary>
    /// Summary description for ESOficina.
    /// </summary>
    [Serializable]
    public class ESOficina
    {
        private short _shtCodOficina = 0;
        private string _strDescripcion = string.Empty;
        private string _strAbreviatura = string.Empty;

        public ESOficina()
        {
        }

        public ESOficina(short ID, string Desc)
        {
            _shtCodOficina = ID;
            _strDescripcion = Desc;
        }

        //Propiedades
        public short shtCodOficina
        {
            get { return _shtCodOficina; }
            set { _shtCodOficina = value; }
        }

        public string strDescripcion
        {
            get { return _strDescripcion; }
            set { _strDescripcion = value; }
        }

        public string strAbreviatura
        {
            get { return _strAbreviatura; }
            set { _strAbreviatura = value; }
        }

        //Metodos

        /// <summary>
        /// Lista las oficinas que se encuentren activas en la Firma.
        /// </summary>
        /// <returns></returns>
        public static ArrayList ListarOficinas()
        {
            ArrayList Oficina = new ArrayList();
            DataSet ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.WF_ListarOficina);

            ESOficina objInicial = new ESOficina(0, "[Seleccione]");
            Oficina.Add(objInicial);

            foreach (DataRow r in ds.Tables[0].Rows)
            {
                ESOficina objOficina = new ESOficina();
                objOficina.shtCodOficina = Convert.ToInt16(r["ofi_cod_oficina"]);
                objOficina.strDescripcion = r["ofi_desc_oficina"].ToString();
                objOficina.strAbreviatura = r["ofi_abr_oficina"].ToString();
                Oficina.Add(objOficina);
            }
            return Oficina;
        }

        public static ArrayList ListarOficinasTodas()
        {
            ArrayList Oficina = new ArrayList();
            DataSet ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.WF_ListarOficina);

            ESOficina objInicial = new ESOficina(0, "[Todas]");
            Oficina.Add(objInicial);

            foreach (DataRow r in ds.Tables[0].Rows)
            {
                ESOficina objOficina = new ESOficina();
                objOficina.shtCodOficina = Convert.ToInt16(r["ofi_cod_oficina"]);
                objOficina.strDescripcion = r["ofi_desc_oficina"].ToString();
                objOficina.strAbreviatura = r["ofi_abr_oficina"].ToString();
                Oficina.Add(objOficina);
            }
            return Oficina;
        }


        public static ArrayList ListarOficinaAbreviatura()
        {
            ArrayList arrArregloOficina = new ArrayList();
            DataSet dstOficina = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.WF_ListarOficina);

            ESOficina objInicial = new ESOficina();
            objInicial.shtCodOficina = 0;
            objInicial.strAbreviatura = "[Seleccione]";
            arrArregloOficina.Add(objInicial);

            foreach (DataRow drwOficina in dstOficina.Tables[0].Rows)
            {
                ESOficina Oficina = new ESOficina();
                Oficina.shtCodOficina = Convert.ToInt16(drwOficina["ofi_cod_oficina"]);
                Oficina.strAbreviatura = drwOficina["ofi_abr_oficina"].ToString();
                arrArregloOficina.Add(Oficina);
            }
            return arrArregloOficina;
        }

        public static string AbreviaturaOficina(short shtOfi)
        {
            ArrayList arr = new ArrayList();
            DataSet Ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ListaAbreviaturaOficina, shtOfi);

            string strAbr = string.Empty;
            foreach (DataRow r in Ds.Tables[0].Rows)
            {
                strAbr = r["ofi_abr_oficina"].ToString();
            }

            return strAbr;
        }
    }
}

