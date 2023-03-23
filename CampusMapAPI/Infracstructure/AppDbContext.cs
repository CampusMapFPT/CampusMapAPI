using Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Infracstructures
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Event> Events { get; set; }
        public DbSet<Feedback> Feedbacks { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<LocationRoute> LocationRoutes { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.EnableSensitiveDataLogging();
        }
    }
}
