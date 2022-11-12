using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class Menu
    {
        public string Nombre { get; set; }
        public string Icono { get; set; }
        public List<Submenu> ListaSubmenu { get; set; }
    }
}
