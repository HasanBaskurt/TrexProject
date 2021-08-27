using IotProject.Business.Abstract;
using IotProject.DataAccess.Abstract;
using IotProject.DataAccess.Concrete;
using IotProject.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IotProject.Business.Concrete
{
    public class TeamcityManager:ITeamcityService
    {
        private ITeamcityRepository _teamcityRepository;
        public TeamcityManager(ITeamcityRepository teamcityRepository)
        {
            _teamcityRepository = teamcityRepository;
        }

        public Teamcity CreateTeamcity(Teamcity teamcity)
        {
            return _teamcityRepository.CreateTeamcity(teamcity);
        }

        public List<Teamcity> GetAllTeamcity()
        {
            return _teamcityRepository.GetAllTeamcities();
        }
    }
}
