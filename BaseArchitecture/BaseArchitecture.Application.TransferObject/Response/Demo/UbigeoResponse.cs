using System.Collections.Generic;

namespace BaseArchitecture.Application.TransferObject.Response.Demo
{
    public class UbigeoResponse
    {
        public UbigeoResponse()
        {
            ListDepartamentoResponse = new List<DepartamentoResponse>();
            ListProvinciaResponse = new List<ProvinciaResponse>();
            ListDistritoResponse = new List<DistritoResponse>();
            ListProyectoResponse = new List<ProyectoResponse>();
            ListPersonalResponse = new List<PersonalResponse>();
            ListZonasResponse = new List<ZonasResponse>();
            ListMasterResponse = new List<MasterResponse>();
        }
        public IEnumerable<DepartamentoResponse> ListDepartamentoResponse { get; set; }
        public IEnumerable<ProvinciaResponse> ListProvinciaResponse { get; set; }
        public IEnumerable<DistritoResponse> ListDistritoResponse { get; set; }
        public IEnumerable<ProyectoResponse> ListProyectoResponse { get; set; }
        public IEnumerable<PersonalResponse> ListPersonalResponse { get; set; }
        public IEnumerable<ZonasResponse> ListZonasResponse { get; set; }
        public IEnumerable<MasterResponse> ListMasterResponse { get; set; }
    }
}
