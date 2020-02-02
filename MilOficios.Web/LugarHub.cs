using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace MilOficios.Web
{
    public class LugarHub : Hub
    {
        static List<string> lugarIds = new List<string>();

        public void AddLugarId(string id)
        {
            if (!lugarIds.Contains(id)) lugarIds.Add(id);
            Clients.All.lugarStatus(lugarIds);
        }

        public void RemoveLugarId(string id)
        {
            if (lugarIds.Contains(id)) lugarIds.Remove(id);
            Clients.All.lugarStatus(lugarIds);
        }

        public override Task OnConnected()
        {
            return Clients.All.lugarStatus(lugarIds);
        }

        public void Message(string message)
        {
            Clients.All.getMessage(message);
        }
    }
}