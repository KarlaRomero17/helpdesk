using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class Estado
    {
        public int id_estado{ get; set; }
        public string nombre { get; set; }
        public bool activo { get; set; }
        public DateTime fecha_registro { get; set; }
    }
}
