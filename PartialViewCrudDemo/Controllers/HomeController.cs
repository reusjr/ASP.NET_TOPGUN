using PartialViewCrudDemo.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PartialViewCrudDemo.Controllers
{
    public class HomeController : Controller
    {
        private DBStudentEntities _context = new DBStudentEntities();
        public ActionResult Index()
        {
            return View(_context.tblStudents.ToList());
        }
        [HttpGet]
        public ActionResult MyCreatePartial()

        {
            return PartialView("CreatePartial");
        }
        [HttpPost]
        public ActionResult MyCreatePartial(tblStudent stud)
        {
            if (ModelState.IsValid)
            {
                _context.tblStudents.Add(stud);
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            return PartialView("CreatePartial");
        }
        [HttpGet]
        public ActionResult GetByID(int ID)
        {
            tblStudent stuTable = _context.tblStudents.Find(ID);
            if (stuTable == null)
            {
                return HttpNotFound();
            }
            return PartialView("EditPartial", stuTable);
        }
        [HttpPost]
        public ActionResult MyEditPartial(tblStudent stuTable)
        {
            if (ModelState.IsValid)
            {
                _context.Entry(stuTable).State = EntityState.Modified;
                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            return PartialView("EditPartial");
        }
        public ActionResult GetByDeleteID(int ID)
        {
            tblStudent stuTable = _context.tblStudents.Find(ID);
            if (stuTable == null)
            {
                return HttpNotFound();
            }
            return PartialView("DeletePartial", stuTable);
        }
        [HttpPost]
        public ActionResult MyDeletePartial(int ID)
        {
            tblStudent tblStu = _context.tblStudents.Find(ID);
  
            _context.tblStudents.Remove(tblStu);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _context.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}