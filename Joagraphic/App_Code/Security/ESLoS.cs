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

namespace Joagraphic.App_Code.Security
{
    /// <summary>
    /// Clase que representa las líneas de servicio y los métodos utilizados para su consulta en la BD.
    /// </summary>

    [Serializable]
    public class ESLoS
    {
        private short _shtCodLoS;
        private string _strDescLoS = string.Empty;

        //Constructores
        public ESLoS()
        {
        }

        public ESLoS(short codLoS, string strDescLoS)
        {
            _shtCodLoS = codLoS;
            _strDescLoS = strDescLoS;
        }

        public short shtCodLoS
        {
            get { return _shtCodLoS; }
            set { _shtCodLoS = value; }
        }

        public string strDescLoS
        {
            get { return _strDescLoS; }
            set { _strDescLoS = value; }
        }

        /// <summary>
        /// Método que se encarga de obtener la lista actual de Líneas de servicio de la Firma.
        /// </summary>
        /// <returns>Arreglo de objetos ESLoS con las Líneas de Servicio actuales</returns>
        public static ArrayList ListarLoS()
        {
            ArrayList arrArregloLoS = new ArrayList();
            DataSet dstLoS = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                 Queries.WF_ListaLoS);

            ESLoS objInicial = new ESLoS();
            objInicial.shtCodLoS = 0;
            objInicial.strDescLoS = "[Seleccione]";
            arrArregloLoS.Add(objInicial);

            foreach (DataRow drwLoS in dstLoS.Tables[0].Rows)
            {
                ESLoS LoS = new ESLoS();
                LoS.shtCodLoS = Convert.ToInt16(drwLoS["lin_cod_linea"]);
                LoS.strDescLoS = drwLoS["lin_desc_linea"].ToString();
                arrArregloLoS.Add(LoS);
            }
            return arrArregloLoS;
        }

        public static ArrayList ListarLoSDeProyecto(string strInicio, int intParCodEmp)
        {
            ArrayList arrArregloLoS = new ArrayList();
            DataSet dstLoS = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ListaLoSDeProyecto, intParCodEmp);

            ESLoS objInicial = new ESLoS();
            objInicial.shtCodLoS = 0;
            objInicial.strDescLoS = strInicio;
            arrArregloLoS.Add(objInicial);

            foreach (DataRow drwLoS in dstLoS.Tables[0].Rows)
            {
                ESLoS LoS = new ESLoS();
                LoS.shtCodLoS = Convert.ToInt16(drwLoS["lin_cod_linea"]);
                LoS.strDescLoS = drwLoS["lin_desc_linea"].ToString();
                arrArregloLoS.Add(LoS);
            }
            return arrArregloLoS;
        }

        public static ArrayList ListarLoSTodas()
        {
            ArrayList arrArregloLoS = new ArrayList();
            DataSet dstLoS = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ListaLoSTodas);

            ESLoS objInicial = new ESLoS();
            objInicial.shtCodLoS = 0;
            objInicial.strDescLoS = "[Seleccione]";
            arrArregloLoS.Add(objInicial);

            foreach (DataRow drwLoS in dstLoS.Tables[0].Rows)
            {
                ESLoS LoS = new ESLoS();
                LoS.shtCodLoS = Convert.ToInt16(drwLoS["lin_cod_linea"]);
                LoS.strDescLoS = drwLoS["lin_desc_linea"].ToString();
                arrArregloLoS.Add(LoS);
            }
            return arrArregloLoS;
        }



        public static ArrayList ListarLoS(string strOpcion)
        {
            ArrayList arrArregloLoS = new ArrayList();
            DataSet dstLoS = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.WF_ListaLoS);

            ESLoS objInicial = new ESLoS();
            objInicial.shtCodLoS = 0;
            objInicial.strDescLoS = strOpcion;
            arrArregloLoS.Add(objInicial);

            foreach (DataRow drwLoS in dstLoS.Tables[0].Rows)
            {
                ESLoS LoS = new ESLoS();
                LoS.shtCodLoS = Convert.ToInt16(drwLoS["lin_cod_linea"]);
                LoS.strDescLoS = drwLoS["lin_desc_linea"].ToString();
                arrArregloLoS.Add(LoS);
            }
            return arrArregloLoS;
        }

        public static ArrayList ListarLoSTodas(string strOpcion)
        {
            ArrayList arrArregloLoS = new ArrayList();
            DataSet dstLoS = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ListaLoSTodas);

            ESLoS objInicial = new ESLoS();
            objInicial.shtCodLoS = 0;
            objInicial.strDescLoS = strOpcion;
            arrArregloLoS.Add(objInicial);

            foreach (DataRow drwLoS in dstLoS.Tables[0].Rows)
            {
                ESLoS LoS = new ESLoS();
                LoS.shtCodLoS = Convert.ToInt16(drwLoS["lin_cod_linea"]);
                LoS.strDescLoS = drwLoS["lin_desc_linea"].ToString();
                arrArregloLoS.Add(LoS);
            }
            return arrArregloLoS;
        }

        /// <summary>
        /// Consulta el código y descripción de una Línea de Servicio específica.
        /// </summary>
        /// <param name="intParLoS">Código de la LoS</param>
        /// <returns></returns>
        public bool ConsultarLoS(int intParLoS)
        {
            DataSet dstLoS = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ConsultaLoS, intParLoS);

            if (dstLoS.Tables[0].Rows.Count < 1)
                return false;

            DataRow drwLoS = dstLoS.Tables[0].Rows[0];
            shtCodLoS = Convert.ToInt16(drwLoS["lin_cod_linea"]);
            strDescLoS = drwLoS["lin_desc_linea"].ToString();
            return true;
        }
    }

    public class ESEspecializacion : ESLoS
    {
        private short _shtCodEsp;
        private string _strDescEsp = string.Empty;
        private string _strAbreviacion = string.Empty;

        //Constructores
        public ESEspecializacion()
        {
        }
        public ESEspecializacion(short Id, string Opcion)
        {
            _shtCodEsp = Id;
            _strDescEsp = Opcion;
        }

        public short shtCodEsp
        {
            get { return _shtCodEsp; }
            set { _shtCodEsp = value; }
        }

        public string strDescEsp
        {
            get { return _strDescEsp; }
            set { _strDescEsp = value; }
        }

        public string strAbreviacion
        {
            get { return _strAbreviacion; }
            set { _strAbreviacion = value; }
        }

        /// <summary>
        /// Método que retorna la lista de especializaciones de una Línea de Servicio
        /// </summary>
        /// <param name="shtPLoS">Código de la Línea de Servicio</param>
        /// <returns></returns>
        public static ArrayList ListarEsp(short shtPLoS)
        {
            ArrayList ArregloEsp = new ArrayList();
            DataSet ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ListaEspecializacion, shtPLoS);

            ESEspecializacion objInicial = new ESEspecializacion();
            objInicial.shtCodEsp = 0;
            objInicial.strDescEsp = "[Seleccione]";
            ArregloEsp.Add(objInicial);

            foreach (DataRow r in ds.Tables[0].Rows)
            {
                ESEspecializacion Esp = new ESEspecializacion();
                Esp.shtCodLoS = Convert.ToInt16(r["esp_cod_linea"]);
                Esp.strDescLoS = r["lin_desc_linea"].ToString();
                Esp.shtCodEsp = Convert.ToInt16(r["esp_cod_esp"]);
                Esp.strAbreviacion = r["esp_abr_especializacion"].ToString();
                Esp.strDescEsp = r["esp_desc_especializacion"].ToString();
                ArregloEsp.Add(Esp);
            }
            return ArregloEsp;
        }

        public static ArrayList ListarEsp(short shtPLoS, string strOpcion)
        {
            ArrayList ArregloEsp = new ArrayList();
            DataSet ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(),
                Queries.ES_ListaEspecializacion, shtPLoS);

            ESEspecializacion objInicial = new ESEspecializacion();
            objInicial.shtCodEsp = 0;
            objInicial.strDescEsp = strOpcion;
            ArregloEsp.Add(objInicial);

            foreach (DataRow r in ds.Tables[0].Rows)
            {
                ESEspecializacion Esp = new ESEspecializacion();
                Esp.shtCodLoS = Convert.ToInt16(r["esp_cod_linea"]);
                Esp.strDescLoS = r["lin_desc_linea"].ToString();
                Esp.shtCodEsp = Convert.ToInt16(r["esp_cod_esp"]);
                Esp.strAbreviacion = r["esp_abr_especializacion"].ToString();
                Esp.strDescEsp = r["esp_desc_especializacion"].ToString();
                ArregloEsp.Add(Esp);
            }
            return ArregloEsp;
        }

    }
}
