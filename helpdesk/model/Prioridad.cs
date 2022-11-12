using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class Prioridad
    {
        public int id_prioridad { get; set; }
        public string prioridad { get; set; }
        public bool activo { get; set; }
        public DateTime fecha_registro { get; set; }
    }
}
