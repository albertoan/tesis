using System.Collections.Generic;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class ProyectoRequest
    {
        public int IdProyecto { set; get; }
        public string Codigo { set; get; }
        public string Nombre { set; get; }
        public string Transferencia { set; get; }
        public int IdTipoInversion { set; get; }
        public int IdCicloInversion { set; get; }
        public int IdNaturaleza { set; get; }
        public int IdDepartamento { set; get; }
        public int IdProvincia { set; get; }
        public int IdDistrito { set; get; }
        public string Programa { set; get; }
        public int IdModalidad { set; get; }
        public string Costo { set; get; }
        public int Estado { set; get; }
        public int IdZona { set; get; }
        public int Asignado { set; get; }
        public int IdTipoProyecto { set; get; }
        public string FechaDesde { set; get; }
        public string FechaHasta { set; get; }
        public InsumosRequest Insumos { set; get; }
        public List<ProyectoActividadesRequest> ProyectoActividadesRequest { set; get; }
    }
}
