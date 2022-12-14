using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TercerExamen
{
    public class ClsUsuarios
    {
        public static string Usuario { get; set; }
        public static string Clave { get; set; }
        public static string Nombre { get; set; }
        public static string Apellido { get; set; }

        public static int ValidarLogin(string Usuario, string Clave)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DboConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ValidarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Usuario", Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave", Clave));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            ClsUsuarios.Nombre = rdr["Nombre"].ToString();
                            ClsUsuarios.Apellido = rdr["Apellido"].ToString();
                            retorno = 1;
                        }

                    }


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;

        }


        public static int Agregar(string Usuario, string Clave, string Nombre, string Apellido)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DboConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("IngresarUsuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Usuario", Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave", Clave));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellido", Apellido));

                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }




        public static int Eliminar(string Usuario)
        {
            int retorno = 0;
            int tipo = 0;
            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DboConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarUsuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Usuario", Usuario));


                    retorno = cmd.ExecuteNonQuery();
                    string jscript = "<script>alert('YOUR BUTTON HAS BEEN CLICKED')</script>";

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }
            return retorno;
        }



        public static int Modificar(string Usuario, string Clave, string Nombre, string Apellido)
        {
            int retorno = 0;
            int tipo = 1;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DboConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarUsuarios", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Email", Usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave", Clave));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Tipo", Apellido));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }





    }
}