using MilOficios.Repositories.MilOficios;

namespace MilOficios.UnitOfWork
{
    public interface IUnitOfWork
    {
        IClientesRepository Clientes { get; }
        IContratistasRepository Contratistas { get; }
        IContratosRepository Contratos { get; }
        ILugaresRepository Lugares { get; }
        IServiciosRepository Servicios { get; }
    }
}