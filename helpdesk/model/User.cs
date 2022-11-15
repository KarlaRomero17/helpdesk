using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.model
{
    public class User
    {
        public int id_user { get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public int idRol { get; set; }
        public Rol oRol { get; set; }
        public string nombre_completo { get; set; }
        public string soporte_nombre { get; set; }
        public int id_soporte { get; set; }
    }
}
