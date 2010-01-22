using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Castle.MicroKernel.Lifestyle;
using System.Web;
using Castle.MicroKernel;

namespace StuartClode.Mvc.IoC
{
    /// <summary>
    /// Implements a lifestyle manager for web apps that
    /// creates at most one component instance per http application instance.
    /// </summary>
    [Serializable]
    public class PerHttpApplicationLifestyleManager : AbstractLifestyleManager
    {
        private readonly string PerAppObjectID = "PerAppObjectID_" + Guid.NewGuid();

        public override object Resolve( CreationContext context )
        {
            var current = HttpContext.Current;
            if (current == null)
                throw new InvalidOperationException( "HttpContext.Current is null. PerHttpApplicationLifestyle can only be used in ASP.NET" );

            var app = current.ApplicationInstance;
            var lifestyleModule = app.Modules
                .Cast<string>()
                .Select( k => app.Modules[k] )
                .OfType<PerHttpApplicationLifestyleModule>()
                .FirstOrDefault();

            if (lifestyleModule == null)
            {
                var message = string.Format( "Looks like you forgot to register the http module {0}" +
                                               "\r\nAdd '<add name=\"PerHttpApplicationLifestyle\" type=\"{1}\" />' " +
                                               "to the <httpModules> section on your web.config",
                                               typeof( PerWebRequestLifestyleModule ).FullName,
                                               typeof( PerWebRequestLifestyleModule ).AssemblyQualifiedName );
                throw new Exception( message );
            }

            if (!lifestyleModule.HasComponent( PerAppObjectID ))
            {
                var instance = base.Resolve( context );
                lifestyleModule[PerAppObjectID] = instance;
                app.Disposed += ( sender, args ) => base.Release( instance );
            }

            return lifestyleModule[PerAppObjectID];
        }

        public override bool Release( object instance )
        {
            return false;
        }

        public override void Dispose() { }
    }
}
