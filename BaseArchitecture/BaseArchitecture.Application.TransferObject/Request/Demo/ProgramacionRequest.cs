using System;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class ProgramacionRequest
    {
        public string IdProyecto { set; get; }
        public string IdCoordinador { set; get; }
        public DateTime? FechaRegistro { set; get; }
        public string FechaInicio { set; get; }
        public string FechaFin { set; get; }
        public string Estado { set; get; }
    }
}
