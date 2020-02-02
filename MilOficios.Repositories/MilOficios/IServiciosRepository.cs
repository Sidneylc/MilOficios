using MilOficios.Models;
using System.Collections.Generic;

namespace MilOficios.Repositories.MilOficios
{
    public interface IServiciosRepository : IRepository<Servicio>
    {
        new Servicio GetById(int id);
        new int Insert(Servicio servicio);
        new bool Update(Servicio servicio);
        bool Delete(int id);
        IEnumerable<Servicio> PagedList(int startRow, int endRow);
        int Count();
    }
}