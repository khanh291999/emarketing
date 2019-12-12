using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Commentviewmodel
    {
        public int comment_id { get; set; }
        public string comment_content { get; set; }

        public Nullable<int> comment_fk_user { get; set; }

        public int u_id { get; set; }
        public string u_name { get; set; }
    }
}