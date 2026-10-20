using Covora_Tech_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Covora_Tech_Store
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            // Code that runs at the beginning of each request
            //Good for checking cookies and session variables
            //myCookie = Request.Cookies["UserID"];
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            //Good for initializing session variables
            //Session["UserID"] = null;
            Session["Cart"] = new List<CartItem>();
            Session["CartCount"] = 0;
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            HttpContext ctx = HttpContext.Current;

            if (ex is HttpException httpEx && httpEx.GetHttpCode() == 404)
            {
                string missingUrl = ctx.Request.RawUrl; // capture the original requested path
                ctx.Server.ClearError();
                ctx.Items["MissingUrl"] = missingUrl;
                ctx.Server.Transfer("~/NotFound.aspx", preserveForm: true);

            }
            else
            {
                // handle other errors
                ctx.Server.ClearError();
                ctx.Items["ErrorException"] = ex;
                ctx.Server.Transfer("~/InternalErrors.aspx", preserveForm: true);
            }
        }


    }
}