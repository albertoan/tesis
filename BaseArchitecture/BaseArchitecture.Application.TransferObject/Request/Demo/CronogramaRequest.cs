using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class CronogramaRequest
    {
        public string IdProyecto { set; get; }
        public List<ProyectoActividadesRequest> ProyectoActividadesRequest { set; get; }
    }
}
