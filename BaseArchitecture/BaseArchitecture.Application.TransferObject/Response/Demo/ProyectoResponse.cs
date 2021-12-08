using System.Collections.Generic;

namespace BaseArchitecture.Application.TransferObject.Response.Demo
{
    public class ProyectoResponse
    {
		public int IdProyecto { set; get; }
		public string Codigo { set; get; }
		public string Nombre { set; get; }
		public string Transferencia { set; get; }
		public int IdTipoInversion { set; get; }
		public string InversionDescripcion { set; get; }
		public int IdCicloInversion { set; get; }
		public string CicloDescripcion { set; get; }
		public int IdNaturaleza { set; get; }
		public string NaturalezaDescripcion { set; get; }
		public int IdDepartamento { set; get; }
		public string Departamento { set; get; }
		public int IdProvincia { set; get; }
		public string Provincia { set; get; }
		public int IdDistrito { set; get; }
		public string Distrito { set; get; }
		public string Programa { set; get; }
		public string Costo { get; set; }
		public int IdModalidad { get; set; }
		public string Modalidad { set; get; }
		public string IdZona { set; get; }
		public int Asignado { set; get; }
		public string FechaVisita { set; get; }
		public string NombresCompleto { set; get; }
		public string IdTipoProyecto { set; get; }
		public string Poblacion { set; get; }
		public string FechaDesde { set; get; }
		public string FechaHasta { set; get; }
		public List<ProyectoActividadesResponse> ProyectoActividadesResponse { set; get; }
		public List<InsumosResponse> ListInsumosResponse { set; get; }
		public List<CronogramaResponse> ListCronogramaResponse { set; get; }

	}
}
