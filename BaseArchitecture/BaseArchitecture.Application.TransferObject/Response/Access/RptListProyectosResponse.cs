using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Response.Access
{
    public class RptListProyectosResponse
    {
        public string CODIGO { get; set; }
		public string PROYECTO { get; set; }
		public string TRANSFERENCIA { get; set; }
		public string TIPO_INVERSION { get; set; }
		public string CICLO_INVERSION { get; set; }
		public string NATURALEZA { get; set; }
		public string MODALIDAD { get; set; }
		public string ZONA { get; set; }
		public string COSTO { get; set; }
		public string DEPARTAMENTO { get; set; }
		public string PROVINCIA { get; set; }
		public string DISTRITO { get; set; }
	}
}
