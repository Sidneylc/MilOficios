using MilOficios.Repositories.MilOficios;
using MilOficios.Models;

namespace MilOficios.Repositories.Dapper.MilOficios
{
    public class ServiciosRepository : Repository<Servicio>, IServiciosRepository
    {
        public ServiciosRepository(string connectionString) : base(connectionString)
        {

        }
    }
}