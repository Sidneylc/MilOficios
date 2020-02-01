using MilOficios.Models;
using System.Collections.Generic;

namespace MilOficios.Repositories.MilOficios
{
    public interface IClientesRepository : IRepository<Cliente>
    {
        new Cliente GetById(int id);
        new int Insert(Cliente cliente);
        new bool Update(Cliente cliente);
        bool Delete(int id);
        IEnumerable<Cliente> PagedList(int startRow, int endRow);
        int Count();
    }
}