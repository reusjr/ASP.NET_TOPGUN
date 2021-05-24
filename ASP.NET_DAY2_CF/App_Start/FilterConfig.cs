using System.Web;
using System.Web.Mvc;

namespace ASP.NET_DAY2_CF
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
