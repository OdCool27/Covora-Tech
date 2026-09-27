using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Covora_Tech_Store
{
    // All devices use Site.Master; Bootstrap handles the responsive layout.
    public class ResponsiveWebFormsResolver : Microsoft.AspNet.FriendlyUrls.Resolvers.WebFormsFriendlyUrlResolver
    {
        protected override bool TrySetMobileMasterPage(HttpContextBase context, System.Web.UI.Page page, string mobileSuffix)
        {
            return false;
        }
    }

    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings, new ResponsiveWebFormsResolver());
        }
    }
}
