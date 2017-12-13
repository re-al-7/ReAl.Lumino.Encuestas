using System.Security.Claims;
using System.Security.Principal;
using Microsoft.AspNetCore.Http;

namespace ReAl.Lumino.Encuestas.Helpers
{
    public static class IdentityExtensions
    {
        public static string GetGivenName(this IIdentity identity)
        {
            if (identity == null)
                return null;

            return (identity as ClaimsIdentity).FirstOrNull(ClaimTypes.GivenName);
        }

        
        public static string GetRole(this IIdentity identity)
        {
            if (identity == null)
                return null;

            return (identity as ClaimsIdentity).FirstOrNull(ClaimTypes.Role);
        }
        
        public static string GetGroupSid(this IIdentity identity)
        {
            if (identity == null)
                return null;

            return (identity as ClaimsIdentity).FirstOrNull(ClaimTypes.GroupSid);
        }

        internal static string FirstOrNull(this ClaimsIdentity identity, string claimType)
        {
            var val = identity.FindFirst(claimType);

            return val == null ? null : val.Value;
        }
    }
}
