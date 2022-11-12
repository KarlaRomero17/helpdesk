using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using helpdesk.model;

namespace helpdesk.datos
{
    public class D_Prioridad
    {
        public static List<Prioridad> Listar()
        {
            List<Prioridad> lista_prioridad = new List<Prioridad>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                SqlCommand cmd = new SqlCommand("proc_lista_prioridad", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lista_prioridad.Add(new Prioridad()
                        {
                            id_prioridad = Convert.ToInt32(dr["id_prioridad"].ToString()),
                            prioridad = dr["prioridad"].ToString(),
                            fecha_registro = Convert.ToDateTime(dr["fecha_registro"].ToString()),
                            activo = Convert.ToBoolean(dr["activo"])

                        });
                    }
                    dr.Close();

                    return lista_prioridad;

                }
                catch (Exception)
                {
                    lista_prioridad = null;
                    return lista_prioridad;
                }
            }
        }
        public static bool Registrar(Prioridad oPrioridad)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_registrar_prioridad", oConexion);
                    cmd.Parameters.AddWithValue("prioridad", oPrioridad.prioridad);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception )
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }

        public static bool Editar(Prioridad oPrioridad)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_editar_prioridad", oConexion);
                    cmd.Parameters.AddWithValue("id_prioridad", oPrioridad.id_prioridad);
                    cmd.Parameters.AddWithValue("prioridad", oPrioridad.prioridad);
                    cmd.Parameters.AddWithValue("activo", oPrioridad.activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    oConexion.Open();

                    cmd.ExecuteNonQuery();

                    respuesta = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                }
                catch (Exception)
                {
                    respuesta = false;
                }

            }

            return respuesta;

        }
        public static bool Eliminar(int id_prioridad)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_eliminar_prioridad", oConexion);
                    cmd.Parameters.AddWithValue("id_prioridad", id_prioridad);
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



    }
}
