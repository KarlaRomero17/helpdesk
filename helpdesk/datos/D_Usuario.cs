using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

using helpdesk.model;
using System.Xml;
using System.Xml.Linq;
using System.Drawing;

namespace helpdesk.datos
{
    public class D_Usuario
    {
        //metodo para iniciar sesion 
        public static int Loguear(string usuario, string clave)
        {
            int id_user = 0;
            using ( SqlConnection conn = new SqlConnection(Conexion.conn) )
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_iniciar_sesion", conn);
                    cmd.Parameters.AddWithValue("usuario", usuario);
                    cmd.Parameters.AddWithValue("clave", clave);
                    cmd.Parameters.Add("id_user", SqlDbType.Int).Direction= ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    id_user = Convert.ToInt32(cmd.Parameters["id_user"].Value);
                }
                catch (Exception)
                {
                    id_user=0;
                }
            }
            return id_user;
        }
        public static List<Menu> ObtenerPermisos(int id_user)
        {
            List<Menu> lista_permisos = new List<Menu>();
            using (SqlConnection conn = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_obtener_permisos", conn);
                    cmd.Parameters.AddWithValue("id_user", id_user);//enviamos parametro
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    //formato xml
                    XmlReader leer_xml = cmd.ExecuteXmlReader();
                    while (leer_xml.Read() )
                    {
                        //desfragmenter formato
                        XDocument doc = XDocument.Load(leer_xml);
                        //formato XML
                       /* 
                        <PERMISOS>
                          <Detalle_menu>
                            <Menu>
                              <nombre>Ticket</nombre>
                              <icono>/icon/ticket.png</icono>
                              <Detalle_submenu>
                                <Submenu>
                                  <nombre>Crear</nombre>
                                  <nombre_form>frmCrearUsuario</nombre_form>
                                </Submenu>
                              </Detalle_submenu>
                            </Menu>
                          </Detalle_menu>
                        </PERMISOS>
                       */
                        if (doc.Element("PERMISOS") != null)
                        {
                            lista_permisos = doc.Element("PERMISOS").Element("DetalleMenu") == null ? new List<Menu>() :
                                (from menu in doc.Element("PERMISOS").Element("DetalleMenu").Elements("Menu")
                                 select new Menu()
                                 {
                                     Nombre = menu.Element("NombreMenu").Value,
                                     Icono = menu.Element("Icono").Value,
                                     ListaSubmenu = menu.Element("DetalleSubMenu") == null ? new List<Submenu>() :
                                     (from submenu in menu.Element("DetalleSubMenu").Elements("SubMenu")
                                      select new Submenu()
                                      {
                                          Nombre = submenu.Element("NombreSubMenu").Value,
                                          NombreFormulario = submenu.Element("NombreFormulario").Value

                                      }).ToList()
                                 }).ToList();
                        }
                    }
                }
                catch (Exception)
                {
                    lista_permisos=new List<Menu>();
                }
            }
            return lista_permisos;
        }
    }
}
