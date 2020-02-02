using MilOficios.UnitOfWork;
using System.Web.Mvc;
using log4net;

namespace MilOficios.Web.Controllers
{
    public class BaseController: Controller
    {
        protected readonly IUnitOfWork _unit;
        protected readonly ILog _log;

        public BaseController(ILog log, IUnitOfWork unit)
        {
            _log = log;
            _unit = unit;
        }
    }
}