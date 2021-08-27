using IotProject.Business.Abstract;
using IotProject.Business.Concrete;
using IotProject.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IotProject.API.Controllers
{
    [Route("api")]
    [ApiController]
    public class TeamcitiesController : ControllerBase
    {
        private ITeamcityService _teamcityService;

        public TeamcitiesController(ITeamcityService teamcityService)
        {
            _teamcityService = teamcityService;
        }

        [HttpGet]
        [Route("BuildLog")]
        public List<Teamcity> Get()
        {
            return _teamcityService.GetAllTeamcity();
        }

        
        [HttpPost]
        [Route("BuildLog")]
        public Teamcity Post([FromBody] Teamcity teamcity)
        {
            return _teamcityService.CreateTeamcity(teamcity);
        }
    }
}
