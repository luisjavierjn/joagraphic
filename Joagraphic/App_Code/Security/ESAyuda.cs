
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using Joagraphic.App_Code.DataAccess;

namespace Joagraphic.App_Code.Security
{
	/// <summary>
	/// Clase utilizada para la ayuda en línea
	/// </summary>
	public class ESAyuda
	{
		//Constructores
		public ESAyuda()
		{
		}

		/// <summary>
		/// Método que Obtiene el mensaje de  ayuda asociado con el código de campo especificado
		/// </summary>
		/// <param name="CodMensaje">El código del campo</param>
		/// <returns></returns>
		public static string ObtenerAyudaCampo(int intCodCampo)
		{
			string strMensaje;
			
			DataSet ds = SqlHelper.ExecuteDataset(ESSeguridad.FormarStringConexion(), 
				Queries.WF_ObtenerAyuda, intCodCampo); 
			
			strMensaje = ds.Tables[0].Rows[0]["mensaje"].ToString();
			return strMensaje;
		}
	}
}
