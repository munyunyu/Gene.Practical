using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Gene.Practical.Data.Migrations
{
    public partial class initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "tblBranch",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(nullable: true),
                    Code = table.Column<string>(nullable: true),
                    Created = table.Column<DateTime>(nullable: false),
                    User_FK = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tblBranch", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "tblInfo",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Certificate = table.Column<string>(nullable: true),
                    Created = table.Column<DateTime>(nullable: false),
                    Branch_FK = table.Column<string>(nullable: true),
                    User_FK = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_tblInfo", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "tblBranch");

            migrationBuilder.DropTable(
                name: "tblInfo");
        }
    }
}
