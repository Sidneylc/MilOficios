using MilOficios.UnitOfWork;
using System.Collections.Generic;
using MilOficios.Models;
using System.Web.Mvc;
using log4net;

namespace MilOficios.Web.Controllers
{
    public class ClienteController : BaseController
    {
        public ClienteController(ILog log, IUnitOfWork unit) : base(log, unit)
        {
            //_unit = unit;
        }

        // GET: Cliente
        public ActionResult Index()
        {
            _log.Info("Ejecución de Cliente Controller Ok");
            return View(_unit.Clientes.GetList());
        }

        //CREATE: Customer
        //public ActionResult Create()
        public PartialViewResult Create()
        {
            //return View();
            return PartialView("_Create", new Cliente());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                _unit.Clientes.Insert(cliente);
                return RedirectToAction("Index");
            }
            //return View(customer);
            return PartialView("_Create", cliente);
        }

        //public ActionResult Update(string id)
        public PartialViewResult Update(int id)
        {
            //return View(_unit.Customers.GetById(id));
            return PartialView("_Update", _unit.Clientes.GetById(id));
        }

        [HttpPost]
        public ActionResult Update(Cliente cliente)
        {
            var val = _unit.Clientes.Update(cliente);

            if (val)
            {
                return RedirectToAction("Index");
            }
            //return View(customer);
            return PartialView("_Update", cliente);
        }

        //public ActionResult Delete(String id)
        public PartialViewResult Delete(int id)
        {
            //return View(_unit.Customers.GetById(id));
            return PartialView("_Delete", _unit.Clientes.GetById(id));
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeletePost(int id)
        {
            var val = _unit.Clientes.Delete(id);

            if (val) return RedirectToAction("Index");
            //return View();
            return PartialView("_Delete", _unit.Clientes.GetById(id));
        }

        [Route("List/{page:int}/{rows:int}")]
        public PartialViewResult List(int page, int rows)
        {
            if (page <= 0 || rows <= 0) return PartialView(new List<Cliente>());
            var startRecord = ((page - 1) * rows) + 1;
            var endRecord = page * rows;
            return PartialView("_List", _unit.Clientes.PagedList(startRecord, endRecord));
        }
        [Route("Count/{rows:int}")]
        public int Count(int rows)
        {
            var totalRecords = _unit.Clientes.Count();
            return totalRecords % rows != 0 ? (totalRecords / rows) + 1 : totalRecords / rows;
        }
    }
}