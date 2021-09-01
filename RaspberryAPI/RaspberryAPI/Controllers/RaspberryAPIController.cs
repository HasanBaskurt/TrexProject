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
        [Route("yesil")]
        public void LedYesilPost()
        {
            business.LedYesil();
        }

        
        [HttpPost]
        [Route("kirmizi")]
        public void LedKirmiziPost()
        {
            business.LedKirmizi();
        }

        [HttpPost]
        [Route("mavi")]
        public void LedMaviPost()
        {
            business.LedMavi();
        }
        [HttpPost]
        [Route("run")]
        public void LedRunPost()
        {
            business.LedRun();
        }
        [HttpPost]
        [Route("kapat")]
        public void LedKapatPost()
        {
            business.LedKapat();
        }
    }
}
