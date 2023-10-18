namespace API_REST.Consultas
{
    using API_REST.Modelos;
    
    using Newtonsoft.Json;
    using System.Data;

    public class ConsultaProyecto : IConsultaProyecto
    {
        private readonly ConexionBD conexionBD = new ConexionBD();

        public List<Proyecto> GetProyectos()
        {
            List<Proyecto> listaProyectos = new List<Proyecto>();
            DataSet dsResultado = conexionBD.EjecutarSelect("SELECT * FROM PROYECTO;");
            string json = JsonConvert.SerializeObject(dsResultado.Tables[0]);
            listaProyectos = JsonConvert.DeserializeObject<List<Proyecto>>(json);
            return listaProyectos;
        }

        public int InsertarProyecto(Proyecto proyecto)
        {
            string query = $"INSERT INTO PROYECTO (NOMBRE) VALUES ('{proyecto.NOMBRE}');";
            int affectedRows = conexionBD.EjecutarInsertUpdateDelete(query);
            return affectedRows;
        }

        public int ActualizarProyecto(Proyecto proyecto)
        {
            string query = $"UPDATE PROYECTO SET NOMBRE = '{proyecto.NOMBRE}' WHERE PROYECTO = {proyecto.PROYECTO};";
            int affectedRows = conexionBD.EjecutarInsertUpdateDelete(query);
            return affectedRows;
        }

        public int EliminarProyecto(int idProyecto)
        {
            string query = $"DELETE FROM PROYECTO WHERE PROYECTO = {idProyecto};";
            int affectedRows = conexionBD.EjecutarInsertUpdateDelete(query);
            return affectedRows;
        }

        public int ObtenerNumeroRegistros()
        {
            string query = "SELECT COUNT(*) FROM PROYECTO;";
            int rowCount = conexionBD.ObtenerNumeroRegistros(query);
            return rowCount;
        }
    }
}
