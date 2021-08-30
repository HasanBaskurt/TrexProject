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
            if(teamcity.build_result== "failure")
            {
                // sürekli failure rengini yak
            }
            else if (teamcity.build_result == "success")
            {
                // sürekli success rengini yak
            }
            else if (teamcity.build_result == "running")
            {
                // sürekli aç kapa rgb success rengini 1 sn aralıkla
            }

            return _teamcityService.CreateTeamcity(teamcity);
        }

        /*
        class Color
        {
            public string name { get; set; }
        }


        [HttpPost]
        [Route("led")]
        public Color Post([FromBody] Color color)
        {
            if(color.name == "green")
            {
                ledyak("green");
            }
            else
            {
                ledyak("red");
            }

            // color : red || green
            return color;
        }

        public void ledyak(String color)
        {
            // raspide kaldırılan api ' a istek atılacak
        }
        */

    }
}
