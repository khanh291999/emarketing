using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class AdminviewuserViewmodel
    {
        public int ad_id { get; set; }
        public string ad_username { get; set; }


        public int u_id { get; set; }
        public string u_name { get; set; }
        public string u_email { get; set; }
        public string u_password { get; set; }
        public string u_image { get; set; }
        public string u_contact { get; set; }
        public Nullable<int> u_fk_admin { get; set; }
        public virtual tbl_admin tbl_admin { get; set; }
    }
}