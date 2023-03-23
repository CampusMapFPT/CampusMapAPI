using Domain.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infracstructures.FluentAPI
{
    public class LocationRouteConfiguration : IEntityTypeConfiguration<LocationRoute>
    {
        public void Configure(EntityTypeBuilder<LocationRoute> builder)
        {
            builder.ToTable("LocationRoute");

            builder.HasKey(x => x.Id);

            builder.HasOne(x => x.FirstLocation)
                .WithMany()
                .HasForeignKey(x => x.FirstLocationId)
                .OnDelete(DeleteBehavior.Restrict); 
            builder.HasOne(x => x.SecondLocation)
                .WithMany()
                .HasForeignKey(x => x.SecondLocationId)
                .OnDelete(DeleteBehavior.Restrict); 
        }
    }
}
