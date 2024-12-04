using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingCartMVC.Models;
using System.Data;

namespace ShoppingCartMVC.Controllers
{
    public class CategoryController : Controller
    {
        dbOnlineStoreEntities2 db = new dbOnlineStoreEntities2();

        #region showing categories for admin

        public ActionResult Index()
        {
            var query = db.tblCategories.ToList();

            return View(query);
        }

        #endregion


        #region add categories

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(tblCategory c)
        {
            if (ModelState.IsValid)
            {
                tblCategory cat = new tblCategory();
                cat.Name = c.Name;
                db.tblCategories.Add(cat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                TempData["msg"] = "Not Inserted Category";
            }
            return View();
        }

        #endregion


        #region edit category

        public ActionResult Edit(int id)
        {
            var query = db.tblCategories.SingleOrDefault(m => m.CatId == id);
            return View(query);
        }

        [HttpPost]
        public ActionResult Edit(tblCategory c)
        {
            try
            {
               
                db.Entry(c).State = EntityState.Modified;
                db.SaveChanges();
               
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                TempData["msg"] = ex;
            }
            return RedirectToAction("Index");
        }

        #endregion

        #region delete category

        public ActionResult Delete(int id)
        {
            var query = db.tblCategories.SingleOrDefault(m => m.CatId == id);
            db.tblCategories.Remove(query);
            db.SaveChanges();
           return RedirectToAction("Index");
        }

      

        #endregion


    }
}