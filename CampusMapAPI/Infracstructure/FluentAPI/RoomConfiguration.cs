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
    public class RoomConfiguration : IEntityTypeConfiguration<Room>
    {
        public void Configure(EntityTypeBuilder<Room> builder)
        {
            builder.ToTable(nameof(Room));

            builder.HasKey(x => x.Id);

            builder.Property(x => x.Name)
                .IsRequired();
            builder.HasOne(x => x.Location)
                .WithMany(x => x.Rooms)
                .HasForeignKey(x => x.LocationId);
        }
    }
}
