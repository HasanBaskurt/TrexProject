using IotProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IotProject.DataAccess.Abstract
{
    public interface ITeamcityRepository
    {
        List<Teamcity> GetAllTeamcities();
         
        Teamcity CreateTeamcity(Teamcity teamcity);
    }
}
