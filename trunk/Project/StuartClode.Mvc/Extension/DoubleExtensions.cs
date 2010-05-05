using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Extension
{
    public static class DoubleExtensions
    {
        static Random r = new Random();

        public static double Randomize( this double p )
        {
            double d = r.NextDouble();
            return p + (d / 100);
        }
    }
}
