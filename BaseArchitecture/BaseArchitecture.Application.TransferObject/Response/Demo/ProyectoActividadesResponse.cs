using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Response.Demo
{
    public class ProyectoActividadesResponse
    {
		public string IdCronograma { set; get; }
		public string Idproyecto { set; get; }
		public string Orden { set; get; }
		public string Nombre { set; get; }
		public string FechaInicio { set; get; }
		public string FechaFin { set; get; }
		public string Seguimiento { set; get; }
		public string Estado { set; get; }
	}
}
