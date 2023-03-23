using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infracstructures.Migrations
{
    /// <inheritdoc />
    public partial class FixSchema : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Description",
                table: "Room");

            migrationBuilder.DropColumn(
                name: "IconUrl",
                table: "Room");

            migrationBuilder.RenameColumn(
                name: "Code",
                table: "Room",
                newName: "SecondName");

            migrationBuilder.AlterColumn<string>(
                name: "Type",
                table: "Room",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "ActiveTime",
                table: "Room",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<int>(
                name: "Floor",
                table: "Locations",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "XRenderValue",
                table: "Locations",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "YRenderValue",
                table: "Locations",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CustomDistance",
                table: "LocationRoutes",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "XRenderValue",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "YRenderValue",
                table: "Locations");

            migrationBuilder.DropColumn(
                name: "CustomDistance",
                table: "LocationRoutes");

            migrationBuilder.RenameColumn(
                name: "SecondName",
                table: "Room",
                newName: "Code");

            migrationBuilder.AlterColumn<string>(
                name: "Type",
                table: "Room",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "ActiveTime",
                table: "Room",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "Room",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "IconUrl",
                table: "Room",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<int>(
                name: "Floor",
                table: "Locations",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);
        }
    }
}
