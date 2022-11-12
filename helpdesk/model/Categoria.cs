using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class Categoria
    {
        public int id_categoria { get; set; }
        public string categoria { get; set; }
        public bool activo { get; set; }
        public DateTime fecha_registro { get; set; }
    }
}
