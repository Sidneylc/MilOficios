using System;

namespace MilOficios.Models
{
    public class Servicio
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int CodContratista { get; set; }
        public int CodLugar { get; set; }
    }
}