using System;

namespace MilOficios.Models
{
    public class Contratista
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Dni { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
    }
}