using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infracstructures.Migrations
{
    /// <inheritdoc />
    public partial class AddLocationRoute : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "LocationRoutes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstLocationId = table.Column<int>(type: "int", nullable: false),
                    SecondLocationId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LocationRoutes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_LocationRoutes_Locations_FirstLocationId",
                        column: x => x.FirstLocationId,
                        principalTable: "Locations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_LocationRoutes_Locations_SecondLocationId",
                        column: x => x.SecondLocationId,
                        principalTable: "Locations",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateIndex(
                name: "IX_LocationRoutes_FirstLocationId",
                table: "LocationRoutes",
                column: "FirstLocationId");

            migrationBuilder.CreateIndex(
                name: "IX_LocationRoutes_SecondLocationId",
                table: "LocationRoutes",
                column: "SecondLocationId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "LocationRoutes");
        }
    }
}
