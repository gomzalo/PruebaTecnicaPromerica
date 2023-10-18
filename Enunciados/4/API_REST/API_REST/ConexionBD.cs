using System.Data;
using Microsoft.Data.SqlClient;

namespace API_REST
{
    public class ConexionBD
    {
        private readonly string _cadenaConexion;
        public ConexionBD()
        {
            _cadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BDPrueba;Integrated Security=True;Connect Timeout=60;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False";
        }

        public DataSet EjecutarSelect(string query)
        {
            using (SqlConnection connection = new SqlConnection(_cadenaConexion))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                return dataSet;
            }
        }

        public int EjecutarInsertUpdateDelete(string query)
        {
            using (SqlConnection connection = new SqlConnection(_cadenaConexion))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                int affectedRows = command.ExecuteNonQuery();
                return affectedRows;
            }
        }

        public int ObtenerNumeroRegistros(string query)
        {
            using (SqlConnection connection = new SqlConnection(_cadenaConexion))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                int rowCount = (int)command.ExecuteScalar();
                return rowCount;
            }
        }
    }

}
