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
    public class EventConfiguration : IEntityTypeConfiguration<Event>
    {
        public void Configure(EntityTypeBuilder<Event> builder)
        {
            builder.ToTable("Event");

            //Id
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Content)
                .IsRequired();
            builder.Property(x => x.CreateDate)
                .IsRequired();
            builder.Property(x => x.EndDate)
                .IsRequired();
            builder.Property(x => x.Header)
                .IsRequired();
            builder.Property(x => x.ImageUrl)
                .IsRequired();
            builder.Property(x => x.Location)
                .IsRequired();
            builder.Property(x => x.Sapo)
                .IsRequired();
            builder.Property(x => x.Slug)
                .IsRequired();
            builder.Property(x => x.StartDate)
                .IsRequired();
            builder.Property(x => x.Time)
                .IsRequired();
            builder.Property(x => x.Title)
                .IsRequired();
            builder.Property(x => x.Unit)
                .IsRequired();

        }
    }
}
