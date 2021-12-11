using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseArchitecture.Application.TransferObject.Request.Demo
{
    public class AttachedFile
    {
        public string IdProyecto { set; get; }
        public Guid IdAttachedFile { set; get; }
        public string Name { set; get; }
        public string PathFile { set; get; }
        public string FileBase64 { set; get; }
        public string FileBuffer { set; get; }
    }
}
