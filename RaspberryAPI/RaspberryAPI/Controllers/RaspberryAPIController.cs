using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Device.Gpio;
namespace RaspberryAPI.Controllers
{
    [Route("api")]
    [ApiController]
    public class RaspberryAPIController
    {
        Business business=new Business();

        [HttpGet]
        public string Get()
        {
            return "Hello World";
        }
        
        [HttpPost]
        [Route("green")]
        public void LedGreenPost()
        {
            business.LedGreen();
        }

        
        [HttpPost]
        [Route("red")]
        public void LedRedPost()
        {
            business.LedRed();
        }

        [HttpPost]
        [Route("blue")]
        public void LedBluePost()
        {
            business.LedBlue();
        }
        [HttpPost]
        [Route("run")]
        public void LedRunPost()
        {
            business.LedRun();
        }
        [HttpPost]
        [Route("close")]
        public void LedClosePost()
        {
            business.LedClose();
        }
    }
}
