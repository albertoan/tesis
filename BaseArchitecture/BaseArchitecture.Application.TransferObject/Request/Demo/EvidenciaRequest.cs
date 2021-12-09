using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class EvidenciaRequest
    {
        public string IdEvidencia { set; get; }
        public string Codigo { set; get; }
        public string IdProyecto { set; get; }
        public string Evidencia { set; get; }
        public List<AttachedFile> AttachedFile { set; get; }
    }
}
