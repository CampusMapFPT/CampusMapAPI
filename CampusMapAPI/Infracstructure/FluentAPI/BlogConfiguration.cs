using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infracstructures.FluentAPI
{
    public class BlogConfiguration : IEntityTypeConfiguration<Blog>
    {
        public void Configure(EntityTypeBuilder<Blog> builder)
        {
            builder.ToTable("Blog");

            //Id
            builder.HasKey(x => x.Id);

            builder.Property(x => x.Title).IsRequired()
                .HasMaxLength(100);
            builder.Property(x => x.Content)
                .IsRequired();
            builder.Property(x => x.CreateDate)
                .IsRequired();
        }
    }
}
