//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_product
    {
        public tbl_product()
        {
            this.tbl_comment = new HashSet<tbl_comment>();
            this.tbl_rate = new HashSet<tbl_rate>();
        }
    
        public int pro_id { get; set; }
        public string pro_name { get; set; }
        public string pro_image { get; set; }
        public string pro_des { get; set; }
        public Nullable<int> pro_price { get; set; }
        public Nullable<int> pro_fk_cat { get; set; }
        public Nullable<int> pro_fk_admin { get; set; }
    
        public virtual tbl_admin tbl_admin { get; set; }
        public virtual tbl_category tbl_category { get; set; }
        public virtual ICollection<tbl_comment> tbl_comment { get; set; }
        public virtual ICollection<tbl_rate> tbl_rate { get; set; }
    }
}
