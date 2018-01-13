using System.Security.Claims;
using System.Security.Principal;

namespace ReAl.Lumino.Encuestas.Helpers
{
    public static class IdentityExtensions
    {
        public static string GetGivenName(this IIdentity identity)
        {
            return (identity as ClaimsIdentity)?.FirstOrNull(ClaimTypes.GivenName);
        }

        
        public static string GetRole(this IIdentity identity)
        {
            return (identity as ClaimsIdentity)?.FirstOrNull(ClaimTypes.Role);
        }
        
        public static string GetGroupSid(this IIdentity identity)
        {
            return (identity as ClaimsIdentity)?.FirstOrNull(ClaimTypes.GroupSid);
        }
        
        public static string GetPrimarySid(this IIdentity identity)
        {
            return (identity as ClaimsIdentity)?.FirstOrNull(ClaimTypes.PrimarySid);
        }

        internal static string FirstOrNull(this ClaimsIdentity identity, string claimType)
        {
            var val = identity.FindFirst(claimType);
            return val?.Value;
        }
    }
}
