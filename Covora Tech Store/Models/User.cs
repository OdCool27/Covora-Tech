using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Covora_Tech_Store.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public String Address { get; set; }
        public Cart ShoppingCart { get; set; }



    }
}