using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Helper
{
    public static class RegularExpressionString
    {
        public const string Url = @"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)";
    }
}
