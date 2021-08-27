using Microsoft.EntityFrameworkCore.Migrations;

namespace IotProject.DataAccess.Migrations
{
    public partial class initialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Teamcities",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    branch_name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    branch_display_name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    branch_is_default = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_start_time = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    timestamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_event = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_status_url = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_number = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    triggered_by = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_result = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_result_previous = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    build_result_delta = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Teamcities", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Teamcities");
        }
    }
}
