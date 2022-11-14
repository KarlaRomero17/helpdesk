using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class Ticket
    {
        public int id_ticket { get; set; }
        public int id_prioridad { get; set; }
        public int id_estado { get; set; }
        public int id_categoria { get; set; }
        public int id_user { get; set; }   
        public Prioridad oPrioridada { get; set; }
        public Estado oEstado { get; set; }
        public Categoria oCategoria { get; set; }
        public string titulo  {get; set;}
        public string descripcion {get; set;}




    }
}
