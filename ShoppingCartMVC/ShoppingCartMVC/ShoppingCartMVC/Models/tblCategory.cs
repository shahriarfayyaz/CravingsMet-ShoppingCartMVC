//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShoppingCartMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblCategory
    {
        public tblCategory()
        {
            this.tblProducts = new HashSet<tblProduct>();
        }
    
        public int CatId { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<tblProduct> tblProducts { get; set; }
    }
}