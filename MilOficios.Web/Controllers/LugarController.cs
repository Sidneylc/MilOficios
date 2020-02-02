using MilOficios.UnitOfWork;
using System.Collections.Generic;
using MilOficios.Models;
using System.Web.Mvc;
using log4net;


namespace MilOficios.Web.Controllers
{
    public class LugarController : BaseController
    {
        public LugarController(ILog log, IUnitOfWork unit) : base(log, unit)
        {
            //_unit = unit;
        }

        public ActionResult Index()
        {
            _log.Info("Ejecución de Lugar Controller Ok");
            return View(_unit.Lugares.GetList());
        }


        //CREATE: Customer
        //public ActionResult Create()
        public PartialViewResult Create()
        {
            //return View();
            return PartialView("_Create", new Lugar());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Lugar lugar)
        {
            if (ModelState.IsValid)
            {
                _unit.Lugares.Insert(lugar);
                return RedirectToAction("Index");
            }
            //return View(customer);
            return PartialView("_Create", lugar);
        }

        //public ActionResult Update(string id)
        public PartialViewResult Update(int id)
        {
            //return View(_unit.Customers.GetById(id));
            return PartialView("_Update", _unit.Lugares.GetById(id));
        }

        [HttpPost]
        public ActionResult Update(Lugar lugar)
        {
            var val = _unit.Lugares.Update(lugar);

            if (val)
            {
                return RedirectToAction("Index");
            }
            //return View(customer);
            return PartialView("_Update", lugar);
        }

        //public ActionResult Delete(String id)
        public PartialViewResult Delete(int id)
        {
            //return View(_unit.Customers.GetById(id));
            return PartialView("_Delete", _unit.Lugares.GetById(id));
        }

        [HttpPost]
        [ActionName("Delete")]
        public ActionResult DeletePost(int id)
        {
            var val = _unit.Lugares.Delete(id);

            if (val) return RedirectToAction("Index");
            //return View();
            return PartialView("_Delete", _unit.Lugares.GetById(id));
        }

        [Route("List/{page:int}/{rows:int}")]
        public PartialViewResult List(int page, int rows)
        {
            if (page <= 0 || rows <= 0) return PartialView(new List<Lugar>());
            var startRecord = ((page - 1) * rows) + 1;
            var endRecord = page * rows;
            return PartialView("_List", _unit.Lugares.PagedList(startRecord, endRecord));
        }
        [Route("Count/{rows:int}")]
        public int Count(int rows)
        {
            var totalRecords = _unit.Lugares.Count();
            return totalRecords % rows != 0 ? (totalRecords / rows) + 1 : totalRecords / rows;
        }
    }
}