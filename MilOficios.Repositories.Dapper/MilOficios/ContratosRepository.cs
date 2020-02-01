using MilOficios.Repositories.MilOficios;
using MilOficios.Models;

namespace MilOficios.Repositories.Dapper.MilOficios
{
    public class ContratosRepository : Repository<Contrato>, IContratosRepository
    {
        public ContratosRepository(string connectionString) : base(connectionString)
        {

        }
    }
}