using MilOficios.Repositories.MilOficios;
using MilOficios.Models;

namespace MilOficios.Repositories.Dapper.MilOficios
{
    public class ContratistasRepository : Repository<Contratista>, IContratistasRepository
    {
        public ContratistasRepository(string connectionString) : base(connectionString)
        {

        }
    }
}