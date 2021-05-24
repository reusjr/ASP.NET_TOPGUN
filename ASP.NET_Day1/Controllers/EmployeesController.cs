using ASP.NET_Day1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Data.Entity;

namespace ASP.NET_Day1.Controllers
{
    public class EmployeesController : Controller
    {
        private SalesEntities db = new SalesEntities();
        // GET All: Employees
        public ActionResult Index()
        {
            return View(db.Employees.ToList());
        }

        //Get details an employee
        //public ActionResult GetDetailEmployee(int id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    var emp = db.Employees.Find(id);
        //    if (emp == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return PartialView("_getDetailEmployee", emp);

        //}

        //Create a employee
        //[HttpGet]
        //public ActionResult CreateEmployee()
        //{
        //    return PartialView("_createEmployee");
        //}

        [HttpPost]
        public ActionResult CreateEmployee(Employee emp)
        {
            if(String.IsNullOrEmpty(emp.LoginName))
            {
                db.Employees.Add(emp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return PartialView("_createEmployee");

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditEmployee(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var emp = db.Employees.Find(id);
            if (emp == null)
            {
                return HttpNotFound();
            }
            if (ModelState.IsValid)
            {
                db.Entry(emp).State = EntityState.Modified;
                db.SaveChanges();
                RedirectToAction("Index");
            }
            return PartialView("_editEmployee");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteEmployee(int id)
        {
            var emp = db.Employees.Find(id);
            db.Employees.Remove(emp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}