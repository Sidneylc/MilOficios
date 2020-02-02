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
    public class ServiciosRepository : Repository<Servicio>, IServiciosRepository
    {
        public ServiciosRepository(string connectionString) : base(connectionString)
        {

        }

        public new Lugar GetById(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.GetAll<Lugar>().Where(lugar => lugar.Codigo.Equals(id)).First();
            }
        }

        public new int Insert(Servicio servicio)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = connection.Execute("insert Servicio (Descripcion, Precio, CodContratista, CodLugar) " +
                                                "values (@descripcion, @precio, @codContratista, @codLugar)",
                                            new
                                            {
                                                descripcion = servicio.Descripcion,
                                                precio = servicio.Precio,
                                                codContratista = servicio.CodContratista,
                                                codLugar = servicio.CodLugar
                                            });
                return result;
            }
        }

        public new bool Update(Servicio servicio)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = connection.Execute("update Lugar " +
                        "set Descripcion = @descripcion, Precio = @precio, CodContratista = @codContratista, CodLugar = @codLugar" +
                                            "where Codigo = @codigo",
                                            new
                                            {
                                                descripcion = servicio.Descripcion,
                                                precio = servicio.Precio,
                                                codContratista = servicio.CodContratista,
                                                codLugar = servicio.CodLugar
                                            });
                return Convert.ToBoolean(result);
            }
        }

        public bool Delete(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = connection.Execute("delete from servicio " +
                    "where Codigo = @myid ", new { myid = id });
                return Convert.ToBoolean(result);
                //if (result==1) return true; else return false;   
            }
        }

        public IEnumerable<Servicio> PagedList(int startRow, int endRow)
        {
            if (startRow >= endRow) return new List<Servicio>();
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@startRow", startRow);
                parameters.Add("@endRow", endRow);
                return connection.Query<Servicio>("dbo.uspServicioPagedList", parameters,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public int Count()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.ExecuteScalar<int>("Select Count(Codigo) from dbo.Servicio");
            }
        }
    }
}