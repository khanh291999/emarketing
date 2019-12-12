using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Rateviewmodel
    {
        public int rate_id { get; set; }
        public string rate_content { get; set; }

        public Nullable<int> rate_fk_user { get; set; }

        public int u_id { get; set; }
        public string u_name { get; set; }
    }
}