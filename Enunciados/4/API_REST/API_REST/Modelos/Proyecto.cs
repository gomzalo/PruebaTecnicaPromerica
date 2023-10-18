namespace API_REST.Modelos
{
    public class Proyecto
    {
        /// <summary>
        /// Constructor de la clase.
        /// </summary>
        public Proyecto()
        {
            this.PROYECTO = 0;
            this.NOMBRE = string.Empty;
        }

        /// <summary>
        /// Identificador del proyecto.
        /// </summary>
        public int PROYECTO { get; set; }

        /// <summary>
        /// Nombre del proyecto.
        /// </summary>
        public string? NOMBRE { get; set; }
    }
}
