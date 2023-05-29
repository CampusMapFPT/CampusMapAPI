using Application;
using Application.IRepositories;
using Application.IServices;
using Application.Services;
using Domain.Models;
using Infracstructures.Mappers;
using Infracstructures.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infracstructures
{
    public static class DependencyInjection
    {
        public static IServiceCollection AddInfractstructure(this IServiceCollection services, IConfiguration config)
        {
            services.AddScoped<IUnitOfWork, UnitOfWork>();

            #region Config Repository and Service
            // Blog
            services.AddTransient<IBlogRepository, BlogRepository>();
            services.AddTransient<IBlogService, BlogService>();

            // Event
            services.AddTransient<IEventRepository, EventRepository>();
            services.AddTransient<IEventService, EventService>();

            // Feedback
            services.AddTransient<IFeedbackRepository, FeedbackRepository>();
            services.AddTransient<IFeedbackService, FeedbackService>();

            // Location
            services.AddTransient<ILocationRepository, LocationRepository>();
            services.AddTransient<ILocationService, LocationService>();

            // LocationRoute
            services.AddTransient<ILocationRouteRepository, LocationRouteRepository>();

            // Room
            services.AddTransient<IRoomRepository, RoomRepository>();
            services.AddTransient<IRoomService, RoomService>();
            #endregion

            // Use local DB
            // services.AddDbContext<AppDbContext>(opt => opt.UseSqlServer(config.GetConnectionString("CampusMapDB")));

            // Use azure DB
            services.AddDbContext<AppDbContext>(opt => opt.UseSqlServer(config.GetConnectionString("CampusMapDBSomee")));
            services.AddAutoMapper(typeof(MapperConfigs).Assembly);
            return services;
        }
    }
}
