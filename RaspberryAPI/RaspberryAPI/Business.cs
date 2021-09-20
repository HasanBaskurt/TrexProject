using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Device.Gpio;
using System.Threading;

using System.Net.Http;
namespace RaspberryAPI
{
    public class Business
    {
        int pin1 = 2;
        int pin2 = 3;
        int pin3 = 4;
        int pin21 = 21;
        GpioController controller = new GpioController();


        public Business()
        {
            Console.WriteLine("Hello Raspberry!");
            controller.OpenPin(pin1, PinMode.Output);
            controller.OpenPin(pin2, PinMode.Output);
            controller.OpenPin(pin3, PinMode.Output);
            controller.OpenPin(pin21, PinMode.Output);
        }
        
        public void LedGreen()
        {
            controller.Write(pin1, PinValue.High);
            controller.Write(pin2, PinValue.Low);
            controller.Write(pin3, PinValue.High);
        }
        public void LedRed()
        {
            controller.Write(pin1, PinValue.High);
            controller.Write(pin2, PinValue.High);
            controller.Write(pin3, PinValue.Low);
        }

        public void LedBlue()
        {
            controller.Write(pin1, PinValue.Low);
            controller.Write(pin2, PinValue.High);
            controller.Write(pin3, PinValue.High);
        }

        public void LedRun()
        {
            controller.Write(pin2, PinValue.High);
            controller.Write(pin3, PinValue.High);
            for (int i = 0; i < 5;i++) 
            {
                controller.Write(pin1, PinValue.Low);
                Thread.Sleep(1000);
                controller.Write(pin1, PinValue.High);
                Thread.Sleep(1000);
            }
        }

        public void LedClose()
        {
            controller.Write(pin1, PinValue.High);
            controller.Write(pin2, PinValue.High);
            controller.Write(pin3, PinValue.High);
        }

        public void SocketOpen()
        {
            controller.Write(pin21, true);

        }

        public void SocketClose()
        {
            controller.Write(pin21, false);
        }
    }
}
