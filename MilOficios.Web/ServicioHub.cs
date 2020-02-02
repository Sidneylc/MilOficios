using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace MilOficios.Web
{
    public class ServicioHub : Hub
    {
        static List<string> servicioIds = new List<string>();

        public void AddServicioId(string id)
        {
            if (!servicioIds.Contains(id)) servicioIds.Add(id);
            Clients.All.servicioStatus(servicioIds);
        }

        public void RemoveServicioId(string id)
        {
            if (servicioIds.Contains(id)) servicioIds.Remove(id);
            Clients.All.servicioStatus(servicioIds);
        }

        public override Task OnConnected()
        {
            return Clients.All.servicioStatus(servicioIds);
        }

        public void Message(string message)
        {
            Clients.All.getMessage(message);
        }
    }
}