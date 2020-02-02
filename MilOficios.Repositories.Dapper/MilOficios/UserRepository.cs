using Dapper;
using MilOficios.Models;
using MilOficios.Repositories.MilOficios;
using System.Data;
using System.Data.SqlClient;

namespace MilOficios.Repositories.Dapper.MilOficios
{
    class UserRepository: Repository<User>, IUserRepository
    {
        public UserRepository(string connectionString) : base(connectionString)
        {
        }

        public User ValidateUser(string email, string password)
        {
            using(var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@email", email);
                parameters.Add("@password", password);

                return connection.QueryFirstOrDefault<User>("dbo.uspValidateUser",
                    parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public User CreateUser(User user)
        {
            using(var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@email", user.Email);
                parameters.Add("@password", user.Password);
                parameters.Add("@firstName", user.FirstName);
                parameters.Add("@lastName", user.LastName);

                return connection.QueryFirstOrDefault<User>("dbo.uspCreateUser",
                    parameters, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
