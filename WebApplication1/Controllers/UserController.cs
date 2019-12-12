using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebApplication1.Models;
//khanh
//khanh1
//ngan
namespace WebApplication1.Controllers
{
    public class UserController : Controller
    {
        dbemarketingEntities2 db = new dbemarketingEntities2();
        // GET: User
        public ActionResult Index(int? page)
        {
            int pagesize = 9, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.tbl_category.Where(x => x.cat_status == 1).OrderByDescending(x => x.cat_id).ToList();
            IPagedList<tbl_category> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);
        }


        public ActionResult SignUp()
        {

            return View();
        }

        [HttpPost]
        public ActionResult SignUp(tbl_user uvm, HttpPostedFileBase imgfile)
        {
            string path = uploadimgfile(imgfile);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Image could not be uploaded....";
            }
            else
            {
                tbl_user u = new tbl_user();
                u.u_name = uvm.u_name;
                u.u_email = uvm.u_email;
                u.u_password = uvm.u_password;
                u.u_image = path;
                u.u_contact = uvm.u_contact;
                db.tbl_user.Add(u);
                db.SaveChanges();
                return RedirectToAction("Login");

            }

            return View();
        } //method...............


        public ActionResult login()
        {
            return View();
        }


        [HttpPost]
        public ActionResult login(tbl_user avm)
        {
            tbl_user ad = db.tbl_user.Where(x => x.u_email == avm.u_email && x.u_password == avm.u_password).SingleOrDefault();
            if (ad != null)
            {

                Session["u_id"] = ad.u_id.ToString();
                return RedirectToAction("Index");

            }
            else
            {
                ViewBag.error = "Invalid username or password";

            }

            return View();
        }

        [HttpGet]
        public ActionResult CreateAd()
        {
            List<tbl_category> li = db.tbl_category.ToList();
            ViewBag.categorylist = new SelectList(li, "cat_id", "cat_name");

            return View();
        }

        [HttpPost]
        public ActionResult CreateAd(tbl_product pvm, HttpPostedFileBase imgfile)
        {
            List<tbl_category> li = db.tbl_category.ToList();
            ViewBag.categorylist = new SelectList(li, "cat_id", "cat_name");


            string path = uploadimgfile(imgfile);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Image could not be uploaded....";
            }
            else
            {
                tbl_product p = new tbl_product();
                p.pro_name = pvm.pro_name;
                p.pro_price = pvm.pro_price;
                p.pro_image = path;
                p.pro_fk_cat = pvm.pro_fk_cat;
                p.pro_des = pvm.pro_des;
                p.pro_fk_user = Convert.ToInt32(Session["u_id"].ToString());
                db.tbl_product.Add(p);
                db.SaveChanges();
                Response.Redirect("index");

            }

            return View();
        }

        [HttpGet]
        public ActionResult CreateComment()
        {
            List<tbl_product> li = db.tbl_product.ToList();
            ViewBag.categorylist = new SelectList(li, "pro_id", "pro_name");

            return View();
        }

        [HttpPost]
        public ActionResult CreateComment(tbl_comment pvm)
        {
            List<tbl_product> li = db.tbl_product.ToList();
            ViewBag.categorylist = new SelectList(li, "pro_id", "pro_name");
            tbl_comment p = new tbl_comment();
            p.comment_content = pvm.comment_content;
            p.comment_fk_pro = pvm.comment_fk_pro;
            p.comment_fk_user = Convert.ToInt32(Session["u_id"].ToString());
            db.tbl_comment.Add(p);
            db.SaveChanges();
            Response.Redirect("index");
          
            return View();
        }


        public ActionResult ViewComment()
        {
            List<tbl_comment> commentlist = db.tbl_comment.ToList();
            Commentviewmodel commentVM = new Commentviewmodel();

            List<Commentviewmodel> commentVMList = commentlist.Select(x => new Commentviewmodel
            {
                u_name = x.tbl_user.u_name,
                comment_content = x.comment_content
            }).ToList();
            return View(commentVMList);
        }


        [HttpGet]
        public ActionResult CreateRate()
        {
            List<tbl_product> li = db.tbl_product.ToList();
            ViewBag.categorylist = new SelectList(li, "pro_id", "pro_name");

            return View();
        }

        [HttpPost]
        public ActionResult CreateRate(tbl_rate pvm)
        {
            List<tbl_product> li = db.tbl_product.ToList();
            ViewBag.categorylist = new SelectList(li, "pro_id", "pro_name");
            tbl_rate p = new tbl_rate();
            p.rate_content = pvm.rate_content;
            p.rate_fk_pro = pvm.rate_fk_pro;
            p.rate_fk_user = Convert.ToInt32(Session["u_id"].ToString());
            db.tbl_rate.Add(p);
            db.SaveChanges();
            Response.Redirect("index");
           
            return View();
        }

        public ActionResult ViewRate()
        {
            List<tbl_rate> ratelist = db.tbl_rate.ToList();
            Rateviewmodel rateVM = new Rateviewmodel();

            List<Rateviewmodel> rateVMList = ratelist.Select(x => new Rateviewmodel
            {
                u_name = x.tbl_user.u_name,
                rate_content = x.rate_content
            }).ToList();
            return View(rateVMList);
        }

        public ActionResult Ads(int? id, int? page)
        {
            int pagesize = 9, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.tbl_product.Where(x => x.pro_fk_cat == id).OrderByDescending(x => x.pro_id).ToList();
            IPagedList<tbl_product> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);


        }

        [HttpPost]
        public ActionResult Ads(int? id, int? page, string search)
        {
            int pagesize = 9, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.tbl_product.Where(x => x.pro_name.Contains(search)).OrderByDescending(x => x.pro_id).ToList();
            IPagedList<tbl_product> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);


        }
        public ActionResult ViewAd(int? id)
        {
            Adviewmodel ad = new Adviewmodel();
            tbl_product p = db.tbl_product.Where(x => x.pro_id == id).SingleOrDefault();
            ad.pro_id = p.pro_id;
            ad.pro_name = p.pro_name;
            ad.pro_image = p.pro_image;
            ad.pro_price = p.pro_price;
            ad.pro_des = p.pro_des;
            tbl_category cat = db.tbl_category.Where(x => x.cat_id == p.pro_fk_cat).SingleOrDefault();
            ad.cat_name = cat.cat_name;
            tbl_user u = db.tbl_user.Where(x => x.u_id == p.pro_fk_user).SingleOrDefault();
            ad.u_name = u.u_name;
            ad.u_image = u.u_image;
            ad.u_contact = u.u_contact;
            ad.pro_fk_user = u.u_id;
            //tbl_comment com = db.tbl_comment.Where(x => x.comment_id == p.pro_fk_comment).SingleOrDefault();
            //ad.comment_content = com.comment_content;
            //tbl_rate ra = db.tbl_rate.Where(x => x.rate_id == p.pro_fk_rate).SingleOrDefault();
            //ad.rate_content = ra.rate_content;
            return View(ad);
        }

        public ActionResult DeleteAd(int? id)
        {

            tbl_product p = db.tbl_product.Where(x => x.pro_id == id).SingleOrDefault();
            db.tbl_product.Remove(p);
            db.SaveChanges();

            return RedirectToAction("Index");
        }




        public string uploadimgfile(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {

                        path = Path.Combine(Server.MapPath("~/Content/upload"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "~/Content/upload/" + random + Path.GetFileName(file.FileName);

                        //    ViewBag.Message = "File uploaded successfully";
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Only jpg ,jpeg or png formats are acceptable....'); </script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Please select a file'); </script>");
                path = "-1";
            }



            return path;
        }
        public ActionResult Signout()
        {
            Session.RemoveAll();
            Session.Abandon();

            return RedirectToAction("Index");
        }


    }


}