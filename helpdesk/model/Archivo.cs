using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class Archivo
    {
        public int id_archivo { get; set; }
        public string nombre {get; set; }
        public string direccion { get; set; }
        public int id_ticket { get; set; }
        public Ticket file_Ticket { get; set; }
    }
}
