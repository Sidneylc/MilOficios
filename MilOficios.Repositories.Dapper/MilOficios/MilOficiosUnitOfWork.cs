using MilOficios.Repositories.MilOficios;
using MilOficios.UnitOfWork;

namespace MilOficios.Repositories.Dapper.MilOficios
{
    public class MilOficiosUnitOfWork : IUnitOfWork
    {
        public MilOficiosUnitOfWork(string connectionString)
        {
            Clientes = new ClientesRepository(connectionString);
            Contratistas = new ContratistasRepository(connectionString);
            Contratos = new ContratosRepository(connectionString);
            Lugares = new LugaresRepository(connectionString);
            Servicios = new ServiciosRepository(connectionString);
            Users = new UserRepository(connectionString);
        }

        public IClientesRepository Clientes { get; private set; }
        public IContratistasRepository Contratistas { get; private set; }
        public IContratosRepository Contratos { get; private set; }
        public ILugaresRepository Lugares { get; private set; }
        public IServiciosRepository Servicios { get; private set; }
        public IUserRepository Users { get; private set; }
    }
}