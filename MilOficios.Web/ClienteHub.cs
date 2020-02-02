using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace MilOficios.Web
{
    public class ClienteHub : Hub
    {
        static List<string> clienteIds = new List<string>();

        public void AddClienteId(string id)
        {
            if (!clienteIds.Contains(id)) clienteIds.Add(id);
            Clients.All.clienteStatus(clienteIds);
        }

        public void RemoveClienteId(string id)
        {
            if (clienteIds.Contains(id)) clienteIds.Remove(id);
            Clients.All.clienteStatus(clienteIds);
        }

        public override Task OnConnected()
        {
            return Clients.All.clienteStatus(clienteIds);
        }

        public void Message(string message)
        {
            Clients.All.getMessage(message);
        }
    }
}