// // <copyright file="ExtensionMethods.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2018-01-04 11:27</date>

using System;
using System.Globalization;
using System.Linq;

namespace ReAl.Lumino.Encuestas.Helpers
{
    public static class ExtensionMethods
    {
        public static string ToUnderscoreCase(this string str)
        {
            return string.Concat(str.Select((x, i) => i > 0 && char.IsUpper(x) ? "_" + x.ToString() : x.ToString())).ToLowerInvariant();
        }

        public static string ToCamelCase(this string str)
        {
            return str.Split(new[] { "_" }, StringSplitOptions.RemoveEmptyEntries).Select(s => char.ToUpperInvariant(s[0]) + s.Substring(1, s.Length - 1)).Aggregate(string.Empty, (s1, s2) => s1 + s2);
        }

        public static string ToPascalCase(this string str)
        {
            var words = str.Split(new[] { '-', '_' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(word => word.Substring(0, 1).ToUpperInvariant() +
                                word.Substring(1).ToLowerInvariant());

            var result = string.Concat(words);
            return result;
        }
    }
}