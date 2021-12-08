using System;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class PersonalRequest
    {
        public int IdCoordinador { get; set; }
        public string Nombre { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public int Estado { get; set; }
        public int IdZona { get; set; }
        public int Asignado { get; set; }
        public string Cargo { get; set; }
    }
}
