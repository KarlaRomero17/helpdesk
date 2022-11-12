using helpdesk.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk.datos
{
    public class D_Estado
    {
        public static List<Estado> Listar()
        {
            List<Estado> lista_estado = new List<Estado>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                SqlCommand cmd = new SqlCommand("proc_lista_estado", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lista_estado.Add(new Estado()
                        {
                            id_estado = Convert.ToInt32(dr["id_estado"].ToString()),
                            nombre = dr["nombre"].ToString(),
                            fecha_registro = Convert.ToDateTime(dr["fecha_registro"].ToString()),
                            activo = Convert.ToBoolean(dr["activo"])

                        });
                    }
                    dr.Close();

                    return lista_estado;

                }
                catch (Exception)
                {
                    lista_estado = null;
                    return lista_estado;
                }
            }
        }
        public static bool Registrar(Estado oEstado)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_registrar_estado", oConexion);
                    cmd.Parameters.AddWithValue("nombre", oEstado.nombre);
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

        public static bool Editar(Estado oEstado)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_editar_estado", oConexion);
                    cmd.Parameters.AddWithValue("id_estado", oEstado.id_estado);
                    cmd.Parameters.AddWithValue("nombre", oEstado.nombre);
                    cmd.Parameters.AddWithValue("activo", oEstado.activo);
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
        public static bool Eliminar(int id_estado)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_eliminar_estado", oConexion);
                    cmd.Parameters.AddWithValue("id_estado", id_estado);
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
