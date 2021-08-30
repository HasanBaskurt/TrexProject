using System;
using System.Device.Gpio;
using System.Threading;

namespace raspberryProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello Raspberry!");
            int pin = 4;
            string islem ;
            bool durum = true;
            GpioController controller = new GpioController();
            controller.OpenPin(pin, PinMode.Output);
            while(durum)
                {
                Console.WriteLine("islem seciniz :(ac / kapat / cikis))");
                islem = Console.ReadLine();
                
                if(islem=="ac")
                {
                    controller.Write(pin, PinValue.High);
                }
                else if(islem=="kapat")
                {
                    controller.Write(pin, PinValue.Low);
                }
                else if(islem=="cikis")
                {
                    durum = false;
                }
                
             }

        }
    }
}
