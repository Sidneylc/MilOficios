using MilOficios.Models;
using System.Collections.Generic;

namespace MilOficios.Repositories.MilOficios
{
    public interface ILugaresRepository : IRepository<Lugar>
    {
        new Lugar GetById(int id);
        new int Insert(Lugar lugar);
        new bool Update(Lugar lugar);
        bool Delete(int id);
        IEnumerable<Lugar> PagedList(int startRow, int endRow);
        int Count();
    }
}