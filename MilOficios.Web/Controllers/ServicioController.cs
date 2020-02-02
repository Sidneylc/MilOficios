using log4net;
using MilOficios.Models;
using MilOficios.UnitOfWork;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MilOficios.Web.Controllers
{
    public class ServicioController : BaseController
    {
        public ServicioController(ILog log, IUnitOfWork unit) : base(log, unit)
        {
            
        }

        public ActionResult Index()
        {
            _log.Info("Ejecución de Servicio Controller Ok");
            return View(_unit.Servicios.GetList());
        }

        //CREATE: Customer
        //public ActionResult Create()
        public PartialViewResult Create()
        {
            //return View();
            return PartialView("_Create", new Servicio());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Servicio servicio)
        {
            if (ModelState.IsValid)
            {
                _unit.Servicios.Insert(servicio);
                return RedirectToAction("Index");
            }
            //return View(customer);
            return PartialView("_Create", servicio);
        }

        //public ActionResult Update(string id)
        public PartialViewResult Update(int id)
        {
            //return View(_unit.Customers.GetById(id));
            return PartialView("_Update", _unit.Servicios.GetById(id));
        }

        [HttpPost]
        public ActionResult Update(Servicio servicio)
        {
            var val = _unit.Servicios.Update(servicio);

            if (val)
            {
                return RedirectToAction("Index");
            }
            //return View(customer);
            return PartialView("_Update", servicio);
        }

        //public ActionResult Delete(String id)
        public PartialViewResult Delete(int id)
        {
            //return View(_unit.Customers.GetById(id));
            return PartialView("_Delete", _unit.Servicios.GetById(id));
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeletePost(int id)
        {
            var val = _unit.Servicios.Delete(id);

            if (val) return RedirectToAction("Index");
            //return View();
            return PartialView("_Delete", _unit.Servicios.GetById(id));
        }

        [Route("List/{page:int}/{rows:int}")]
        public PartialViewResult List(int page, int rows)
        {
            if (page <= 0 || rows <= 0) return PartialView(new List<Servicio>());
            var startRecord = ((page - 1) * rows) + 1;
            var endRecord = page * rows;
            return PartialView("_List", _unit.Servicios.PagedList(startRecord, endRecord));
        }
        [Route("Count/{rows:int}")]
        public int Count(int rows)
        {
            var totalRecords = _unit.Servicios.Count();
            return totalRecords % rows != 0 ? (totalRecords / rows) + 1 : totalRecords / rows;
        }
    }
}