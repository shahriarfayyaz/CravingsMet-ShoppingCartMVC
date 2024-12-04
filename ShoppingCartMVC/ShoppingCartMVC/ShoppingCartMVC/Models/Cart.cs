using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoppingCartMVC.Models
{
    public class Cart
    {
        public int proid { get; set; }

        public string proname { get; set; }

        public int qty { get; set; }

        public int price { get; set; }

        public int bill { get; set; }
    }
}