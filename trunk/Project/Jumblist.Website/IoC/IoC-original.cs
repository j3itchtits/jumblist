using System;
using System.Collections.Generic;
using System.Collections;
using Castle.Windsor;

namespace JumblistTest.Website.IoC
{
    public static class IoC
    {
        private static IWindsorContainer container;
        private static readonly object LocalContainerKey = new object();

        public static void Initialize( IWindsorContainer windsorContainer )
        {
            GlobalContainer = windsorContainer;
        }

        public static object Resolve( Type serviceType )
        {
            return Container.Resolve( serviceType );
        }

        public static object Resolve( string serviceName )
        {
            return Container.Resolve( serviceName );
        }

        public static object Resolve( Type serviceType, string serviceName )
        {
            return Container.Resolve( serviceName, serviceType );
        }

        /// <summary>
        /// Tries to resolve the component, but return null
        /// instead of throwing if it is not there.
        /// Useful for optional dependencies.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static T TryResolve<T>()
        {
            return TryResolve( default( T ) );
        }

        /// <summary>
        /// Tries to resolve the compoennt, but return the default 
        /// value if could not find it, instead of throwing.
        /// Useful for optional dependencies.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="defaultValue">The default value.</param>
        /// <returns></returns>
        public static T TryResolve<T>( T defaultValue )
        {
            if ( Container.Kernel.HasComponent( typeof( T ) ) == false )
                return defaultValue;
            return Container.Resolve<T>();
        }

        public static T Resolve<T>()
        {
            return Container.Resolve<T>();
        }

        public static T Resolve<T>( string name )
        {
            return Container.Resolve<T>( name );
        }

        public static T Resolve<T>( object argumentsAsAnonymousType )
        {
            return Container.Resolve<T>( argumentsAsAnonymousType );
        }


        public static T Resolve<T>( IDictionary parameters )
        {
            return Container.Resolve<T>( parameters );
        }

        public static IWindsorContainer Container
        {
            get
            {
                IWindsorContainer result = LocalContainer ?? GlobalContainer;
                if ( result == null )
                    throw new InvalidOperationException( "The container has not been initialized! Please call IoC.Initialize(container) before using it." );
                return result;
            }
        }

        private static IWindsorContainer LocalContainer
        {
            get
            {
                if ( LocalContainerStack.Count == 0 )
                    return null;
                return LocalContainerStack.Peek();
            }
        }

        private static Stack<IWindsorContainer> LocalContainerStack
        {
            get
            {
                Stack<IWindsorContainer> stack = Local.Data[LocalContainerKey] as Stack<IWindsorContainer>;
                if ( stack == null )
                {
                    Local.Data[LocalContainerKey] = stack = new Stack<IWindsorContainer>();
                }
                return stack;
            }
        }

        public static bool IsInitialized
        {
            get { return GlobalContainer != null; }
        }

        internal static IWindsorContainer GlobalContainer
        {
            get
            {
                return container;
            }
            set
            {
                container = value;
            }
        }

        /// <summary>
        /// This allows you to override the global container locally
        /// Useful for scenarios where you are replacing the global container
        /// but needs to do some initializing that relies on it.
        /// </summary>
        /// <param name="localContainer"></param>
        /// <returns></returns>
        public static IDisposable UseLocalContainer( IWindsorContainer localContainer )
        {
            LocalContainerStack.Push( localContainer );
            return new DisposableAction( delegate
            {
                Reset( localContainer );
            } );
        }

        public static void Reset( IWindsorContainer containerToReset )
        {
            if ( containerToReset == null )
                return;
            if ( ReferenceEquals( LocalContainer, containerToReset ) )
            {
                LocalContainerStack.Pop();
                if ( LocalContainerStack.Count == 0 )
                    Local.Data[LocalContainerKey] = null;
                return;
            }
            if ( ReferenceEquals( GlobalContainer, containerToReset ) )
            {
                GlobalContainer = null;
            }
        }

        public static void Reset()
        {
            IWindsorContainer windsorContainer = LocalContainer ?? GlobalContainer;
            Reset( windsorContainer );
        }

        public static Array ResolveAll( Type service )
        {
            return Container.ResolveAll( service );
        }

        public static T[] ResolveAll<T>()
        {
            return Container.ResolveAll<T>();
        }
    }
}
