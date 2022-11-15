using helpdesk.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Common;

namespace helpdesk.datos
{
    public class D_Ticket
    {
        public static string RegistrarTicket(Ticket oTicket)
        {
            string id;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_crear_ticket", oConexion);
                    cmd.Parameters.AddWithValue("id_prioridad", oTicket.id_prioridad);
                    cmd.Parameters.AddWithValue("id_estado", oTicket.id_estado);
                    cmd.Parameters.AddWithValue("id_categoria", oTicket.id_categoria);
                    cmd.Parameters.AddWithValue("id_user", oTicket.id_user);
                    cmd.Parameters.AddWithValue("titulo", oTicket.titulo);
                    cmd.Parameters.AddWithValue("descripcion", oTicket.descripcion);
                    cmd.Parameters.Add("id", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    id = cmd.Parameters["id"].Value.ToString();
                    //MessageBox.Show(""+id);
                }
                catch (Exception)
                {
                    id = "";
                    //MessageBox.Show(""+ex);
                }
            }
            return id;

        }
        public static bool RegistrarArchivo(Archivo oArchivo)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                oConexion.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_registrar_archivo", oConexion);
                    cmd.Parameters.AddWithValue("nombre", oArchivo.nombre);
                    cmd.Parameters.AddWithValue("direccion", oArchivo.direccion);
                    cmd.Parameters.AddWithValue("id_ticket", oArchivo.id_ticket);
                    cmd.Parameters.Add("resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["resultado"].Value);
                }
                catch(Exception)
                {
                    respuesta=false;
                    //MessageBox.Show(""+ex);
                }

                oConexion.Close();

            }
            return respuesta;
        }
        public static List<Ticket> Listar()
        {

            List<Ticket> lista_ticket= new List<Ticket>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                SqlCommand cmd = new SqlCommand("proc_lista_ticket", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lista_ticket.Add(new Ticket()
                        {
                            id_ticket = Convert.ToInt32(dr["id_ticket"].ToString()),
                            id_prioridad= Convert.ToInt32(dr["id_prioridad"].ToString()),
                            oPrioridad= new Prioridad() { prioridad = dr["prioridad"].ToString() },
                            id_estado= Convert.ToInt32(dr["id_estado"].ToString()),
                            oEstado= new Estado() { nombre = dr["estado"].ToString() },
                            id_categoria= Convert.ToInt32(dr["id_categoria"].ToString()),
                            oCategoria= new Categoria() { categoria = dr["categoria"].ToString() },
                            //id_user= Convert.ToInt32(dr["id_user"].ToString()),
                            //id_soporte= Convert.ToInt32(dr["id_soporte"].ToString()),
                            oUsuario= new User() { nombre_completo = dr["usuario"].ToString(),
                                                   soporte_nombre = dr["soporte"].ToString()
                            },
                            //id_prioridad = Convert.ToInt32(dr["id_prioridad"].ToString()),
                            //id_estado = Convert.ToInt32(dr["id_estado"].ToString()),
                            //id_categoria= Convert.ToInt32(dr["id_categoria"].ToString()),
                            titulo = dr["titulo"].ToString(),
                            descripcion = dr["descripcion"].ToString(),
                            id_soporte= Convert.ToInt32(dr["id_user"].ToString()),
                            fecha_ingreso =  Convert.ToDateTime(dr["fecha_ingreso"].ToString())
                        });
                    }
                    dr.Close();
                    return lista_ticket;
                }
                catch (Exception)
                {
                    lista_ticket = new List<Ticket>();
                    return lista_ticket;
                }
            }
        }
        public static bool Asignar(int id_ticket)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_asignarme_ticket", oConexion);
                    cmd.Parameters.AddWithValue("id_ticket", id_ticket);
                    cmd.Parameters.AddWithValue("id_soporte", Conf.oUsuario.id_user);
                    cmd.Parameters.Add("resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public static bool Eliminar(int id_ticket)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_eliminar_ticket", oConexion);
                    cmd.Parameters.AddWithValue("id_ticket", id_ticket);
                    cmd.Parameters.Add("resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }
        public static bool ModificarTicket(Ticket oTicket)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_modificar_ticket", oConexion);
                    cmd.Parameters.AddWithValue("id_ticket", oTicket.id_ticket);
                    cmd.Parameters.AddWithValue("id_prioridad", oTicket.id_prioridad);
                    cmd.Parameters.AddWithValue("id_estado", oTicket.id_estado);
                    cmd.Parameters.AddWithValue("id_categoria", oTicket.id_categoria);
                    cmd.Parameters.Add("resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                    MessageBox.Show(""+ex);
                }
            }

            return respuesta;

        }
        public static bool Reasignar_Ticket(Ticket oTicket)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_reasignar_ticket", oConexion);
                    cmd.Parameters.AddWithValue("id_ticket", oTicket.id_ticket);
                    /*cmd.Parameters.AddWithValue("id_prioridad", oTicket.id_prioridad);
                    cmd.Parameters.AddWithValue("id_estado", oTicket.id_estado);
                    cmd.Parameters.AddWithValue("id_categoria", oTicket.id_categoria);*/
                    cmd.Parameters.AddWithValue("id_soporte", oTicket.id_soporte);
                    cmd.Parameters.Add("resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["resultado"].Value);

                }
                catch (Exception ex)
                {
                    respuesta = false;
                    MessageBox.Show(""+ex);
                }
            }

            return respuesta;

        }
        //end

    }
}
