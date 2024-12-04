using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ShoppingCartMVC.Models;

namespace ShoppingCartMVC.Controllers
{
    public class AccountController : Controller
    {

        dbOnlineStoreEntities2 db = new dbOnlineStoreEntities2();

        #region user registration 

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(tblUser t)
        {
            tblUser u = new tblUser();
            if (ModelState.IsValid)
            {
                u.Name = t.Name;
                u.Email = t.Email;
                u.Password = t.Password;
                u.RoleType = 2;
                db.tblUsers.Add(u);
                db.SaveChanges();

                return RedirectToAction("Login", "Account");
            }
            else
            {
                TempData["msg"] = "Not Register!!";
            }
            return View();
        }

        #endregion

        #region user login

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(tblUser t)
        {
            var query = db.tblUsers.SingleOrDefault(m => m.Email == t.Email && m.Password == t.Password);
            if (query != null)
            {
                if (query.RoleType == 1)
                {
                    Session["uid"] = query.UserId;
                    FormsAuthentication.SetAuthCookie(query.Email, false);
                    Session["User"] = query.Name;
                    return RedirectToAction("Index", "Home");
                }
                else if (query.RoleType == 2)
                {
                    Session["uid"] = query.UserId;
                    FormsAuthentication.SetAuthCookie(query.Email, false);
                    Session["User"] = query.Name;
                    return RedirectToAction("Index", "Home");
                }

            }
            else
            {
                TempData["msg"] = "Invalid Username or Password";
            }

            return View();
        }

#endregion

        #region logout 

        public ActionResult Signout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

        #endregion
    }
}
