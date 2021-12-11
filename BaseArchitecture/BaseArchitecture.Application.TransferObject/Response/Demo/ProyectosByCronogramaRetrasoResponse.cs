using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Response.Demo
{
    public class ProyectosByCronogramaRetrasoResponse
    {
        public string IdProyecto { set; get; }
        public string Codigo { set; get; }
        public string Nombre { set; get; }
        public string Asignado { set; get; }
        public string Estado { set; get; }
        public string FechaDesde { set; get; }
        public string FechaHasta { set; get; }
        public string FechaUltimoRegistro { set; get; }
        
    }
}




