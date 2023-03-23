using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infracstructures.Migrations
{
    /// <inheritdoc />
    public partial class AddRoomcode : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Code",
                table: "Room",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Code",
                table: "Room");
        }
    }
}
