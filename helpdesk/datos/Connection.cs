using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk
{
    class Connection
    {
        public static SqlConnection openConnection()
        {

            string connectionString = "Server=WF-H3PHF12;Database=helpdesk;integrated security=True;";
            SqlConnection conn = new SqlConnection(connectionString.ToString());
            return conn;
        }
    }

}
