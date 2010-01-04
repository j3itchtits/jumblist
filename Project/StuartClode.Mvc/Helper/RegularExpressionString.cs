﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Helper
{
    public static class RegularExpressionString
    {
        public const string Url = @"((https?|ftp|gopher|telnet|file|notes|ms-help):((//)|(\\\\))+[\w\d:#@%/;$()~_?\+-=\\\.&]*)";
        public const string UKPostcode = @"^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$";
    }
}
