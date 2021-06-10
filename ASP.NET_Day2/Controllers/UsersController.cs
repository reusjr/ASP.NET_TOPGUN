using ASP.NET_Day2.Models;
using ASP.NET_Day2.Models.DAL;
using System;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;

namespace ASP.NET_Day2.Controllers
{
    public class UsersController : Controller
    {
        // GET: Login
        private SchoolContext db = new SchoolContext();
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User userData)
        {
            User user = db.Users.SingleOrDefault(u => u.Username == userData.Username);
            if (user == null)
            {
                @ViewBag.LoginStatus = "User is not exist";
            }
            else
            {
                var provider = new SHA256CryptoServiceProvider();
                var encoding = new UnicodeEncoding();
                userData.Password = Convert.ToBase64String(provider.ComputeHash(encoding.GetBytes(userData.Password)));
                if (user.Password == userData.Password)
                {
                    FormsAuthentication.SetAuthCookie(user.ID.ToString(), false);
                    return RedirectToAction("Index", "Students");
                }
                else
                {
                    @ViewBag.LoginStatus = "Password is incorrected";
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
        //[HttpGet]
        public ActionResult CreateUser()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateUser([Bind(Include = "Username,Password,FullName")] User user)
        {
            if (user.Username != null)
            {
                User usercheck = db.Users.SingleOrDefault(u => u.Username == user.Username);
                if (usercheck != null)
                {
                    @ViewBag.CreateUserStatus = "Username is exist";
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        var provider = new SHA256CryptoServiceProvider();
                        var encoding = new UnicodeEncoding();
                        user.Password = Convert.ToBase64String(provider.ComputeHash(encoding.GetBytes(user.Password)));
                        db.Users.Add(user);
                        db.SaveChanges();
                        @ViewBag.CreateUserStatus = "Create successed";
                    }
                }
            }
            return View(user);
        }
        [Authorize]
        public ActionResult EditUser()
        {
            int id = int.Parse(User.Identity.Name);
            var user = db.Users.Find(id);
            return View(user);
        }
        [HttpPost]
        public ActionResult EditUser([Bind(Include = "ID,Username,Password,FullName")] User user)
        {
            if (ModelState.IsValid)
            {
                var provider = new SHA256CryptoServiceProvider();
                var encoding = new UnicodeEncoding();
                user.Password = Convert.ToBase64String(provider.ComputeHash(encoding.GetBytes(user.Password)));
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                @ViewBag.EditUserStatus = "Edit Successed";
            }
            return View(user);
        }
    }
}