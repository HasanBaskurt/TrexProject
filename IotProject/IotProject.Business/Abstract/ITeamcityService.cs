using IotProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IotProject.Business.Abstract
{
    public interface ITeamcityService
    {
        List<Teamcity> GetAllTeamcity();
        Teamcity CreateTeamcity(Teamcity teamcity);
    }

    public static class TeamcityList {
        public static List<Teamcity> teamcityList = new List<Teamcity>();
        public static List<Teamcity> teamcityList2 = new List<Teamcity>();
    }

}
