using Dapper;
using Dapper.Contrib.Extensions;
using MilOficios.Models;
using MilOficios.Repositories.MilOficios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace MilOficios.Repositories.Dapper.MilOficios
{
    public class LugaresRepository : Repository<Lugar>, ILugaresRepository
    {
        public LugaresRepository(string connectionString) : base(connectionString)
        {

        }

        public new Lugar GetById(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.GetAll<Lugar>().Where(lugar => lugar.Codigo.Equals(id)).First();
            }
        }

        public new int Insert(Lugar lugar)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = connection.Execute("insert Lugar (Ciudad) values (@ciudad)",
                                            new
                                            {
                                                ciudad = lugar.Ciudad
                                            });
                return result;
            }
        }

        public new bool Update(Lugar lugar)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = connection.Execute("update Lugar " +
                                            "set Ciudad = @ciudad " +
                                            "where Codigo = @myId",
                                            new
                                            {
                                                ciudad = lugar.Ciudad,
                                                myId = lugar.Codigo
                                            });
                return Convert.ToBoolean(result);
            }
        }

        public bool Delete(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = connection.Execute("delete from Lugar " +
                    "where Codigo = @myid ", new { myid = id });
                return Convert.ToBoolean(result);
                //if (result==1) return true; else return false;   
            }
        }

        public IEnumerable<Lugar> PagedList(int startRow, int endRow)
        {
            if (startRow >= endRow) return new List<Lugar>();
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@startRow", startRow);
                parameters.Add("@endRow", endRow);
                return connection.Query<Lugar>("dbo.uspLugarPagedList", parameters,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public int Count()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.ExecuteScalar<int>("Select Count(Codigo) from dbo.Lugar");
            }
        }
    }
}