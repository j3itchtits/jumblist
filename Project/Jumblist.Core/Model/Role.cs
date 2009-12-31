using System;

namespace JumblistTest.Core.Model
{
    public partial class Role
    {
        //public override string ToString()
        //{
        //    return Name;
        //}

        public const int AuthorId = 1;
        public const int AdministratorId = 2;

        //public const string Admin = "Administrator";

        //// allowed roles. These must match the data in table Role
        public static Role Author { get { return new Role() { RoleId = AuthorId, Name = "Author" }; } }
        public static Role Administrator { get { return new Role() { RoleId = AdministratorId, Name = "Administrator" }; } }

        public bool IsAuthor { get { return Name == Author.Name; } }
        public bool IsAdministrator { get { return Name == Administrator.Name; } }
    }
}
