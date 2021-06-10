using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.NET_Day3.Models
{
    public class User
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
    }
}