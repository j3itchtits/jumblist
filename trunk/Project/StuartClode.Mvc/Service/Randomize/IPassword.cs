using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Service.Randomize
{
    public interface IPassword
    {
        int MinUpperCaseChars { get; set; }
        int MinLowerCaseChars { get; set; }
        int MinNumericChars { get; set; }
        int MinSpecialChars { get; set; }
        CharType FillRest { get; set; }
        string GeneratePassword( int length );
    }
}
