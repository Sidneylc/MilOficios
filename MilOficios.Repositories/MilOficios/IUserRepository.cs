using MilOficios.Models;

namespace MilOficios.Repositories.MilOficios
{
    public interface IUserRepository
    {
        User ValidateUser(string email, string password);
        User CreateUser(User user);
    }
}
