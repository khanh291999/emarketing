﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbemarketingEntities2 : DbContext
    {
        public dbemarketingEntities2()
            : base("name=dbemarketingEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<tbl_admin> tbl_admin { get; set; }
        public DbSet<tbl_category> tbl_category { get; set; }
        public DbSet<tbl_comment> tbl_comment { get; set; }
        public DbSet<tbl_product> tbl_product { get; set; }
        public DbSet<tbl_rate> tbl_rate { get; set; }
        public DbSet<tbl_user> tbl_user { get; set; }
    }
}
