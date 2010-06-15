using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StuartClode.Mvc.Service.Randomize
{
    public class Password : IPassword
    {
        public int MinUpperCaseChars { get; set; }
        public int MinLowerCaseChars { get; set; }
        public int MinNumericChars { get; set; }
        public int MinSpecialChars { get; set; }
        public CharType FillRest { get; set; }

        #region Public Methods

        public string GeneratePassword( int length )
        {
            int sum = this.MinUpperCaseChars + this.MinLowerCaseChars +
                this.MinNumericChars + this.MinSpecialChars;

            if ( length < sum )
                throw new ArgumentException( "length parameter must be valid!" );

            List<char> chars = new List<char>();

            if ( this.MinUpperCaseChars > 0 )
            {
                chars.AddRange( GetUpperCasePasswordChars( this.MinUpperCaseChars ) );
            }

            if ( this.MinLowerCaseChars > 0 )
            {
                chars.AddRange( GetLowerCasePasswordChars( this.MinLowerCaseChars ) );
            }

            if ( this.MinNumericChars > 0 )
            {
                chars.AddRange( GetNumericPasswordChars( this.MinNumericChars ) );
            }

            if ( this.MinSpecialChars > 0 )
            {
                chars.AddRange( GetSpecialPasswordChars( this.MinSpecialChars ) );
            }

            int restLength = length - chars.Count;

            switch ( this.FillRest )
            {
                case (CharType.UpperCase):
                    chars.AddRange( GetUpperCasePasswordChars( restLength ) );
                    break;
                case (CharType.LowerCase):
                    chars.AddRange( GetLowerCasePasswordChars( restLength ) );
                    break;
                case CharType.Numeric:
                    chars.AddRange( GetNumericPasswordChars( restLength ) );
                    break;
                case CharType.Special:
                    chars.AddRange( GetSpecialPasswordChars( restLength ) );
                    break;
                default:
                    chars.AddRange( GetLowerCasePasswordChars( restLength ) );
                    break;
            }

            return GeneratePasswordFromList( chars );
        }

        #endregion


        #region Private Methods

        private List<char> GetUpperCasePasswordChars( int count )
        {
            List<char> result = new List<char>();

            Random random = new Random();

            for ( int index = 0; index < count; index++ )
            {
                result.Add( Char.ToUpper( Convert.ToChar( random.Next( 65, 90 ) ) ) );
            }

            return result;
        }

        private List<char> GetLowerCasePasswordChars( int count )
        {
            List<char> result = new List<char>();

            Random random = new Random();

            for ( int index = 0; index < count; index++ )
            {
                result.Add( Char.ToLower( Convert.ToChar( random.Next( 97, 122 ) ) ) );
            }

            return result;
        }

        private List<char> GetNumericPasswordChars( int count )
        {
            List<char> result = new List<char>();

            Random random = new Random();

            for ( int index = 0; index < count; index++ )
            {
                result.Add( Convert.ToChar( random.Next( 0, 9 ).ToString() ) );
            }

            return result;
        }

        private List<char> GetSpecialPasswordChars( int count )
        {
            List<char> result = new List<char>();

            Random random = new Random();

            for ( int index = 0; index < count; index++ )
            {
                result.Add( Char.ToLower( Convert.ToChar( random.Next( 35, 38 ) ) ) );
            }

            return result;
        }

        private string GeneratePasswordFromList( List<char> chars )
        {
            string result = string.Empty;

            Random random = new Random();

            while ( chars.Count > 0 )
            {
                int randomIndex = random.Next( 0, chars.Count );
                result += chars[randomIndex];
                chars.RemoveAt( randomIndex );
            }

            return result;
        }

        #endregion
    }

    public enum CharType
    {
        UpperCase,
        LowerCase,
        Numeric,
        Special
    }
}
