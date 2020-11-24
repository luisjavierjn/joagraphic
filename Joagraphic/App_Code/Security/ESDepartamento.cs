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
	/// Clase que contiene las propiedades, métodos reponsable de la manipulación de los departamentos
	/// </summary>
	[Serializable]
	public class ESDepartamento : ESLoS
	{
		private short _shtCodDepartamento = 0; 
		private string _strDescDepartamento = string.Empty;
		private byte _btyLoSDep = 0;
//		private short _shtCodOficina = 0;

		public ESDepartamento()
		{
		}

		public ESDepartamento(short ID, string Desc)
		{
			_shtCodDepartamento = ID;
			_strDescDepartamento = Desc;
		}

		//Propiedades
		public short shtCodDepartamento
		{
			get { return _shtCodDepartamento; }
			set { _shtCodDepartamento = value; }
		}
		
		public string strDescDepartamento
		{
			get { return _strDescDepartamento; }
			set { _strDescDepartamento = value; }
		}

		public byte btyLoSDep
		{
			get { return _btyLoSDep; }
			set { _btyLoSDep = value; }
		}

//		public short shtCodOficina
//		{
//			get { return _shtCodOficina; }
//			set { _shtCodOficina = value; }
//		}

		//Metodos

		/// <summary>
		/// Lista los departamentos que se encuentren activos en la Firma.
		/// </summary>
		/// <returns>Arreglo de departamentos</returns>
		public static ArrayList ListarDepartamentos()
		{
			ArrayList arrDepartamento = new ArrayList();
			DataSet dstDepartamento = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(), 
				Queries.WF_ListarDepartamentos); 
			
			ESDepartamento objInicial = new ESDepartamento(0,"Todos");
			arrDepartamento.Add(objInicial);

			foreach(DataRow drwDepartamento in dstDepartamento.Tables[0].Rows)
			{
				ESDepartamento objDepartamento = new ESDepartamento();
				objDepartamento.shtCodDepartamento = Convert.ToInt16(drwDepartamento["dep_cod_departamento"]);
				objDepartamento.strDescDepartamento = drwDepartamento["dep_desc_departamento"].ToString();
//				objDepartamento.btyLinea = Convert.ToByte(drwDepartamento["dep_bln_linea_servicio"]);
//				objDepartamento.shtCodOficina = Convert.ToInt16(drwDepartamento["dep_cod_oficina"]);
				arrDepartamento.Add(objDepartamento);
			}
			return arrDepartamento;
		}

		/// <summary>
		/// Lista los departamentos y las líneas de servicio activas de la Firma
		/// </summary>
		/// <returns>Arreglo con las líneas de servicio y departamentos</returns>
		public static ArrayList ListarLoSDepartamento()
		{
			ArrayList arrDepartamento = new ArrayList();
			DataSet dstDepartamento = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(), 
				Queries.WF_ListarLoSDepartamentos); 
			
			ESDepartamento objInicial = new ESDepartamento(0,"[Seleccione]");
			arrDepartamento.Add(objInicial);

			foreach(DataRow drwDepartamento in dstDepartamento.Tables[0].Rows)
			{
				ESDepartamento objDepartamento = new ESDepartamento();
				objDepartamento.shtCodDepartamento = Convert.ToInt16(drwDepartamento["lin_cod_linea"]);
				objDepartamento.strDescDepartamento = drwDepartamento["lin_desc_linea"].ToString();
				objDepartamento.btyLoSDep = 0; //Código que identifica una LoS
				//				objDepartamento.shtCodOficina = Convert.ToInt16(drwDepartamento["dep_cod_oficina"]);
				arrDepartamento.Add(objDepartamento);
			}

			foreach(DataRow drwDepartamento in dstDepartamento.Tables[1].Rows)
			{
				ESDepartamento objDepartamento = new ESDepartamento();
				objDepartamento.shtCodDepartamento = Convert.ToInt16(drwDepartamento["dep_cod_departamento"]);
				objDepartamento.strDescDepartamento = drwDepartamento["dep_desc_departamento"].ToString();
				objDepartamento.btyLoSDep = 1; //Código que identifica un departamento.
//				objDepartamento.shtCodOficina = Convert.ToInt16(drwDepartamento["dep_cod_oficina"]);
				arrDepartamento.Add(objDepartamento);
			}
			return arrDepartamento;
		}


		public static ArrayList ListarLoSDepartamento(string strOpcion)
		{
			ArrayList arrDepartamento = new ArrayList();
			DataSet dstDepartamento = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(), 
				Queries.WF_ListarLoSDepartamentos); 
			
			ESDepartamento objInicial = new ESDepartamento(0,strOpcion);
			arrDepartamento.Add(objInicial);

			foreach(DataRow drwDepartamento in dstDepartamento.Tables[0].Rows)
			{
				ESDepartamento objDepartamento = new ESDepartamento();
				objDepartamento.shtCodDepartamento = Convert.ToInt16(drwDepartamento["lin_cod_linea"]);
				objDepartamento.strDescDepartamento = drwDepartamento["lin_desc_linea"].ToString();
				objDepartamento.btyLoSDep = 0; //Código que identifica una LoS
				//				objDepartamento.shtCodOficina = Convert.ToInt16(drwDepartamento["dep_cod_oficina"]);
				arrDepartamento.Add(objDepartamento);
			}

			foreach(DataRow drwDepartamento in dstDepartamento.Tables[1].Rows)
			{
				ESDepartamento objDepartamento = new ESDepartamento();
				objDepartamento.shtCodDepartamento = Convert.ToInt16(drwDepartamento["dep_cod_departamento"]);
				objDepartamento.strDescDepartamento = drwDepartamento["dep_desc_departamento"].ToString();
				objDepartamento.btyLoSDep = 1; //Código que identifica un departamento.
				//				objDepartamento.shtCodOficina = Convert.ToInt16(drwDepartamento["dep_cod_oficina"]);
				arrDepartamento.Add(objDepartamento);
			}
			return arrDepartamento;
		}

		/// <summary>
		/// Lista los departamentos de la Firma por oficina
		/// </summary>
		/// <param name="shtParCodOficina">Código de la oficina</param>
		/// <returns>Arreglo de los departamentos</returns>
		public static ArrayList ListarDepartamentosXOficina(short shtParCodOficina)
		{
			ArrayList arrDepartamento = new ArrayList();
			DataSet dstDepartamento = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(), 
				Queries.ES_ListarDepartamentosXOficina, shtParCodOficina); 
			
			ESDepartamento objInicial = new ESDepartamento(0,"Todos");
			arrDepartamento.Add(objInicial);

			foreach(DataRow drwDepartamento in dstDepartamento.Tables[0].Rows)
			{
				ESDepartamento objDepartamento = new ESDepartamento();
				objDepartamento.shtCodDepartamento = Convert.ToInt16(drwDepartamento["dep_cod_departamento"]);
				objDepartamento.strDescDepartamento = drwDepartamento["dep_desc_departamento"].ToString();
//				objDepartamento.btyLinea = Convert.ToByte(drwDepartamento["dep_bln_linea_servicio"]);
				arrDepartamento.Add(objDepartamento);
			}
			return arrDepartamento;
		}
	}
}
