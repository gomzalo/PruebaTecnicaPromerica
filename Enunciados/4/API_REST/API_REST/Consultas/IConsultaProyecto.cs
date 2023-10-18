using API_REST.Modelos;

namespace API_REST.Consultas
{
    public interface IConsultaProyecto
    {
        int ActualizarProyecto(Proyecto proyecto);
        int EliminarProyecto(int idProyecto);
        List<Proyecto> GetProyectos();
        int ObtenerNumeroRegistros();
        int InsertarProyecto(Proyecto proyecto);
    }
}