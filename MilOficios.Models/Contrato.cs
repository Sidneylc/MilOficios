using System;

namespace MilOficios.Models
{
    public class Contrato
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public DateTime Fecha { get; set; }
        public string Direccion { get; set; }
        public string Indicaciones { get; set; }
        public string Comentarios { get; set; }
        public int CodCliente { get; set; }
        public int CodServicio { get; set; }
        public int CodLugar { get; set; }
    }
}