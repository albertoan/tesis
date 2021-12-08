using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Response.Demo
{
    public class OffLineInformeResponse
    {
        public OffLineInformeResponse()
        {
            ListInformeInsumos = new List<InsumosResponse>();
            ListInformeCronograma = new List<ProyectoActividadesResponse>();
        }
        public IEnumerable<InsumosResponse> ListInformeInsumos { get; set; }
        public IEnumerable<ProyectoActividadesResponse> ListInformeCronograma { get; set; }

    }
}
