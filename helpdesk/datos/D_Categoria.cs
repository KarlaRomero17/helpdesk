using helpdesk.datos;
using helpdesk.model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace helpdesk
{
    public class D_Categoria
    {

        public static List<Categoria> Listar()
        {
            List<Categoria> lista_categoria= new List<Categoria>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                SqlCommand cmd = new SqlCommand("proc_lista_categoria", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lista_categoria.Add(new Categoria()
                        {
                            id_categoria= Convert.ToInt32(dr["id_categoria"].ToString()),
                            categoria = dr["categoria"].ToString(),
                            fecha_registro = Convert.ToDateTime(dr["fecha_registro"].ToString()),
                            activo = Convert.ToBoolean(dr["activo"])

                        });
                    }
                    dr.Close();

                    return lista_categoria;

                }
                catch (Exception)
                {
                    lista_categoria = null;
                    return lista_categoria;
                }
            }
        }
        public static bool Registrar(Categoria oCategoria)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_registrar_categoria", oConexion);
                    cmd.Parameters.AddWithValue("categoria", oCategoria.categoria);
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

        public static bool Editar(Categoria oCategoria)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_editar_categoria", oConexion);
                    cmd.Parameters.AddWithValue("id_categoria", oCategoria.id_categoria);
                    cmd.Parameters.AddWithValue("categoria", oCategoria.categoria);
                    cmd.Parameters.AddWithValue("activo", oCategoria.activo);
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
        public static bool Eliminar(int id_categoria)
        {
            bool respuesta = true;
            using (SqlConnection oConexion = new SqlConnection(Conexion.conn))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_eliminar_categoria", oConexion);
                    cmd.Parameters.AddWithValue("id_categoria", id_categoria);
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
