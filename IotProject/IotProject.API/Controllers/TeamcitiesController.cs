using IotProject.Business.Abstract;
using IotProject.Business.Concrete;
using IotProject.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace IotProject.API.Controllers
{
    [Route("api")]
    [ApiController]
    public class TeamcitiesController : ControllerBase
    {
        private ITeamcityService _teamcityService;
        HttpClient httpClient; //yeni
        StringContent content; //yeni
        public TeamcitiesController(ITeamcityService teamcityService)
        {
            _teamcityService = teamcityService;
            httpClient = new HttpClient(); //yeni
            content = new StringContent(JsonConvert.SerializeObject(""), Encoding.UTF8, "application/json");
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
                httpClient.PostAsync("http://192.168.1.125:8080/api/close", content);
                httpClient.PostAsync("http://192.168.1.125:8080/api/red", content);
            }
            else if (teamcity.build_result == "success")
            {
                httpClient.PostAsync("http://192.168.1.125:8080/api/close", content);
                httpClient.PostAsync("http://192.168.1.125:8080/api/green", content);

            }
            else if (teamcity.build_result == "running")
            {
                httpClient.PostAsync("http://192.168.1.125:8080/api/close", content);
                httpClient.PostAsync("http://192.168.1.125:8080/api/run", content);
            }

            return _teamcityService.CreateTeamcity(teamcity);
        }

        [HttpPost]
        [Route("green")]
        public void PostGreen()
        {
                httpClient.PostAsync("http://192.168.1.125:8080/api/green", content);
        }

        [HttpPost]
        [Route("red")]
        public void PostRed()
        {
              httpClient.PostAsync("http://192.168.1.125:8080/api/red", content);
        }

        [HttpPost]
        [Route("blue")]
        public void PostBlue()
        {
                httpClient.PostAsync("http://192.168.1.125:8080/api/blue", content);
        }

        [HttpPost]
        [Route("close")]
        public void PostClose()
        {
            httpClient.PostAsync("http://192.168.1.125:8080/api/close", content);
        }

       

        [HttpPost]
        [Route("socketOpen")]
        public void PostSocketOpen()
        {
            httpClient.PostAsync("http://192.168.1.125:8080/api/socketOpen", content);
        }

        [HttpPost]
        [Route("socketClose")]
        public void PostSocketClose()
        {
            httpClient.PostAsync("http://192.168.1.125:8080/api/socketClose", content);
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
