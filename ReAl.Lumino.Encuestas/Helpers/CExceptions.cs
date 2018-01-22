// // <copyright file="CExceptions.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2018-01-22 19:14</date>

using System;
using System.Collections;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using System.Threading;
using Octokit;

namespace ReAl.Lumino.Encuestas.Helpers
{
    public static class CExceptions
    {
        private const string GITHUB_ACCESS_TOKEN = "f67cc42cfec27fb43f3dd0ddb24ffc16ef05af4f";
        private const string GITHUB_OWNER = "re-al-7";
        private const string GITHUB_REPOSITORY = "ReAl.Lumino.Encuestas";

        /// <summary>
        /// Metodo para crear un Issue en GitHub
        /// </summary>
        /// <param name="ex">Excepcion desde la que se crea el Issue</param>
        public static void CreateIssueGithub(Exception ex)
        {
            try
            {
                var client = new GitHubClient(new ProductHeaderValue(GITHUB_REPOSITORY));
                var basicAuth = new Credentials(GITHUB_ACCESS_TOKEN); // NOTE: not real credentials
                client.Credentials = basicAuth;

                var createIssue = new NewIssue(ex.Message) {Body = CrearIssueBody(ex)};
                var newIssue = client.Issue.Create(GITHUB_OWNER, GITHUB_REPOSITORY, createIssue);

                if (newIssue != null)
                {
                    Console.WriteLine("Issue creado: " + newIssue.Id + " ("+ newIssue.Result.HtmlUrl +")");
                }
            }
            catch (Exception e)
            {
                // ignored
            }
        }

        private static string CrearIssueBody(Exception exp)
        {
            var trace = new StackTrace(exp, true);
            var stackFrame = trace.GetFrame(trace.FrameCount - 1);

            var strIssue = new StringBuilder();

            strIssue.AppendLine("**Nombre Equipo:** " + Environment.MachineName );
            strIssue.AppendLine("**Nombre Dominio:** " + Environment.UserDomainName );
            strIssue.AppendLine("**Nombre Usuario SO:** " + Environment.UserName );
            strIssue.AppendLine("**Nombre Usuario Aplicacion:** --" );
            strIssue.AppendLine("-------------------------------------------------------------" );
            var strBuildTime =
                new DateTime(2000, 1, 1).AddDays(
                    Assembly.GetExecutingAssembly().GetName().Version.Build).ToShortDateString();
            var timeSpanProcTime = Process.GetCurrentProcess().TotalProcessorTime;

            strIssue.AppendLine("**Fecha y Hora del Error:** " + DateTime.Now );
            strIssue.AppendLine("**Fecha y Hora de Ejecucion:** " + Process.GetCurrentProcess().StartTime +
                                Environment.NewLine);
            strIssue.AppendLine("**Fecha del Build:** " + strBuildTime );
            strIssue.AppendLine("**Sistema Operativo:** " + Environment.OSVersion.VersionString );
            strIssue.AppendLine("**Plataforma:** " + Environment.OSVersion.Platform );
            strIssue.AppendLine("**Tiempo de Ejecucion de la Aplicacion:** " +
                                $"{timeSpanProcTime.TotalHours:0} hours {timeSpanProcTime.TotalMinutes:0} mins {timeSpanProcTime.TotalSeconds:0} secs" +
                                Environment.NewLine);
            strIssue.AppendLine("**PID:** " + Process.GetCurrentProcess().Id );
            strIssue.AppendLine("**Thread Count:** " + Process.GetCurrentProcess().Threads.Count );
            strIssue.AppendLine("**Thread Id:** " + Thread.CurrentThread.ManagedThreadId +
                                Environment.NewLine);
            strIssue.AppendLine("**Nombre del Proceso:** " + Process.GetCurrentProcess().ProcessName +
                                Environment.NewLine);
            strIssue.AppendLine("**CLR Version:** " + Environment.Version );
            strIssue.AppendLine("-------------------------------------------------------------" );

            var ex = exp;
            for (var j = 0; ex != null; ex = ex.InnerException, j++)
            {
                strIssue.AppendLine("**Tipo #" + j + ":** " + ex.GetType() );
                if (!string.IsNullOrEmpty(ex.Message))
                {
                    strIssue.AppendLine("**Mensaje #" + j + ":** " + ex.Message );
                }

                if (!string.IsNullOrEmpty(ex.Source))
                {
                    strIssue.AppendLine("**Origen #" + j + ":** " + ex.Source );
                }

                if (!string.IsNullOrEmpty(ex.HelpLink))
                {
                    strIssue.AppendLine("**Enlace de ayuda #" + j + ":** " + ex.HelpLink );
                }

                if (ex.TargetSite != null)
                {
                    strIssue.AppendLine("**Target Site #" + j + ":** " + ex.TargetSite );
                }

                foreach (DictionaryEntry de in ex.Data)
                {
                    strIssue.AppendLine("**" + de.Key + ":** " + de.Value );
                }
                strIssue.AppendLine("-------------------------------------------------------------");
            }

            strIssue.AppendLine("**StackTrace:**" );
            strIssue.AppendLine(exp.StackTrace );

            strIssue.AppendLine("-------------------------------------------------------------" );
            strIssue.AppendLine("**Source:**" );
            strIssue.AppendLine(exp.Source );

            strIssue.AppendLine("-------------------------------------------------------------" );

            if (stackFrame == null)
            {
                return strIssue.ToString();
            }
            strIssue.AppendLine("**File Name:** " + stackFrame.GetFileName() );
            strIssue.AppendLine("**Class Name:** " + stackFrame.GetMethod().DeclaringType );
            strIssue.AppendLine("**Method Name:** " + stackFrame.GetMethod().Name );
            strIssue.AppendLine("**Line Number:** " + stackFrame.GetFileLineNumber() );
            strIssue.AppendLine("**Column Number:** " + stackFrame.GetFileColumnNumber() );

            return strIssue.ToString();
        }
    }
}