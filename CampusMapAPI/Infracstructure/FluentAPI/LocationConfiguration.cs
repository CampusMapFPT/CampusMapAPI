using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infracstructures.FluentAPI
{
    public class LocationConfiguration : IEntityTypeConfiguration<Location>
    {
        public void Configure(EntityTypeBuilder<Location> builder)
        {
            builder.ToTable(nameof(Location));

            builder.HasKey(x => x.Id);

            builder.Property(x => x.XCoordinate)
                .IsRequired();
            builder.Property(x => x.YCoordinate)
                .IsRequired();
            builder.Property(x => x.Floor)
                .IsRequired();

            builder.HasMany(x => x.Rooms)
                .WithOne(x => x.Location)
                .HasForeignKey(x => x.LocationId);

        }
    }
}
