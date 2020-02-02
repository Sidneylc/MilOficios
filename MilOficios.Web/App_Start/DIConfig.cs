using MilOficios.Repositories.Dapper.MilOficios;
using MilOficios.UnitOfWork;
using log4net;
using log4net.Core;
using SimpleInjector;
using SimpleInjector.Integration.Web;
using SimpleInjector.Integration.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace Cibertec.Mvc.App_Start
{
    public class DIConfig
    {
        public static void ConfigureInjector()
        {
            var container = new Container();
            container.Options.DefaultScopedLifestyle = new WebRequestLifestyle();
            container.Register<IUnitOfWork>(() => new MilOficiosUnitOfWork(
                ConfigurationManager.ConnectionStrings["MilOficiosConnection"].
                ToString()));
            container.RegisterMvcControllers(Assembly.GetExecutingAssembly());

            /*Inyección del log4net*/
            container.RegisterConditional(typeof(ILog),
                c => typeof(Log4NetAdapter<>).MakeGenericType(c.Consumer.ImplementationType),
                Lifestyle.Singleton, c => true);

            // Se desactivo la verificacion porque marca error por los
            // controladores de inicio de sesion de asp net
            container.Verify();

            DependencyResolver.SetResolver(
                new SimpleInjectorDependencyResolver(container)
                );
        }
    }

    public sealed class Log4NetAdapter<T> : LogImpl
    {
        public Log4NetAdapter() : base(LogManager.GetLogger(typeof(T)).Logger) { }
    }
}