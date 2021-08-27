using IotProject.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IotProject.DataAccess
{
    public class IotProjectDbContext:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Server=localhost; Database=TeamcityDb; uid=admin81; pwd=1234;");
        }

        public DbSet<Teamcity> Teamcities{ get; set; }
    }
}
