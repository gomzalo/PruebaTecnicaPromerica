using API_REST.Modelos;
using API_REST.Consultas;
using Microsoft.AspNetCore.Mvc;

namespace API_REST.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProyectoController : ControllerBase
    {
        public ConsultaProyecto consultasProyecto = new ConsultaProyecto();
        private readonly ILogger<ProyectoController> _logger;

        public ProyectoController(ILogger<ProyectoController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "ObtenerProyectos")]
        public IEnumerable<Proyecto> Get()
        {
            return consultasProyecto.GetProyectos();
        }

        [HttpPost(Name = "InsertarProyecto")]
        public int Post([FromBody] Proyecto proyecto)
        {
            return consultasProyecto.InsertarProyecto(proyecto);
        }

        [HttpPut(Name = "ActualizarProyecto")]
        public int Put([FromBody] Proyecto proyecto)
        {
            return consultasProyecto.ActualizarProyecto(proyecto);
        }

        [HttpDelete("{idProyecto}", Name = "EliminarProyecto")]
        public int Delete(int idProyecto)
        {
            return consultasProyecto.EliminarProyecto(idProyecto);
        }

        [HttpGet("RowCount", Name = "ObtenerNumeroRegistros")]
        public int ObtenerNumeroRegistros()
        {
            return consultasProyecto.ObtenerNumeroRegistros();
        }
    }
}
