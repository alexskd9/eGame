using eGameLibrary.Contracts;
using eGameLibrary.Helpers;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace eGameLibrary.UnityConf
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();

            container.RegisterType<IGameRepository, GameRepository>();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}