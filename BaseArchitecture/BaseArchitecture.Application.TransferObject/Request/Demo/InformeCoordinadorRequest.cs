using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class InformeCoordinadorRequest
    {
		public string IdInsumoObra { set; get; }
		public string IdProyecto { set; get; }
		public string MaderaTipoA { set; get; }
		public string MaderaTipoB { set; get; }
		public string Concreto { set; get; }
		public string Aluminio { set; get; }
		public string PIN3 { set; get; }
		public string PIN4 { set; get; }
		public string Suspencion { set; get; }
		public string PAT1 { set; get; }
		public string PAT2 { set; get; }
		public string Pernos { set; get; }
		public string Abrazaderas { set; get; }
		public string Aisladores { set; get; }
		public string Monofasicos { set; get; }
		public string Bifasicos { set; get; }
		public string Trifasicos { set; get; }
		public string Transformadores { set; get; }
		public string Interruptores { set; get; }
		public string Contactores { set; get; }
		public string Medidores { set; get; }
		public string Fusibles { set; get; }
		public string Pararrayos { set; get; }
		public string Lotes { set; get; }
		public string MaderaSecundarioTipoA { set; get; }
		public string ConcretoSecundarioTipoA { set; get; }
		public string ConcretoSecundarioTipoB { set; get; }
		public string AluminioSecundario { set; get; }
		public string Alumbrado { set; get; }
		public string Retenidas { set; get; }
		public string PuestaTierra { set; get; }
		public string GrapaSuspencion { set; get; }
		public string GrapaAnclaje { set; get; }
		public string PernosSecundarios { set; get; }
		public string Conexiones { set; get; }
		public string PanelesSolares { set; get; }
		public string Celdas { set; get; }
		public string Inversor { set; get; }
		public string Soporte { set; get; }
		public string Estructura { set; get; }
		public string Cableado { set; get; }
		public string TipoRegistro { set; get; }
		public string TipoObra { set; get; }
		public List<ProyectoActividadesRequest> Actividades { set; get; }
		public EvidenciaRequest Evidencia { set; get; }
	}
}
