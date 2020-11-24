using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using Joagraphic.App_Code.DataAccess;
using Joagraphic.App_Code.Security;

namespace Joagraphic.App_Code.Workflow
{
	/// <summary>
	/// Summary description for LapsoDeTiempo.
	/// </summary>
	public class WFLapsoDeTiempo
	{
		private int _intCodLapsoDeTiempo;
		private string _strNbrLapsoDeTiempo;

		public int intCodLapsoDeTiempo
		{
			get
			{
				return _intCodLapsoDeTiempo;
			}
			set
			{
				_intCodLapsoDeTiempo = value;
			}
		}

		public string strNbrLapsoDeTiempo
		{
			get
			{
				return _strNbrLapsoDeTiempo;
			}
			set
			{
				_strNbrLapsoDeTiempo = value;
			}
		}

		public WFLapsoDeTiempo()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static ArrayList ListarLapsosDeTiempo()
		{
			ArrayList arrLapsos = new ArrayList();

			SqlDataReader dr = SqlHelper.ExecuteReader(ESSeguridad.FormarStringConexion(),Queries.WF_ListarLapsosDeTiempo);

			while(dr.Read())
			{
				WFLapsoDeTiempo objLapso = new WFLapsoDeTiempo();
				objLapso.intCodLapsoDeTiempo = dr.GetInt32(0);
				objLapso.strNbrLapsoDeTiempo = dr.GetString(1);
				arrLapsos.Add(objLapso);
			}

			return arrLapsos;
		}
	}
}
