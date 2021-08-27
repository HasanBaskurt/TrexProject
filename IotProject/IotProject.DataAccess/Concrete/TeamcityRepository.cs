using IotProject.DataAccess.Abstract;
using IotProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IotProject.DataAccess.Concrete
{
    public class TeamcityRepository : ITeamcityRepository
    {
        public Teamcity CreateTeamcity(Teamcity teamcity)
        {
            using (var IotProjectDbContext = new IotProjectDbContext())
            {
                IotProjectDbContext.Teamcities.Add(teamcity);
                IotProjectDbContext.SaveChanges();
                return teamcity;

            }
        }

        public List<Teamcity> GetAllTeamcities()
        {
            using (var IotProjectDbContext=new IotProjectDbContext())
            {
                return IotProjectDbContext.Teamcities.ToList();
            }
        }
    }
}
