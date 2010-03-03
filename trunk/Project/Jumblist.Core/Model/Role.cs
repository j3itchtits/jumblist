using System;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class Role
    {
        // allowed roles. These must match the data in table Role
        public static Role Administrator { get { return new Role() { RoleId = (int)RoleUniqueId.Administrator, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.Administrator, "g" ), Level = (int)RoleLevel.Administrator }; } }
        public static Role Editor { get { return new Role() { RoleId = (int)RoleUniqueId.Editor, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.Editor, "g" ), Level = (int)RoleLevel.Editor }; } }
        public static Role Author { get { return new Role() { RoleId = (int)RoleUniqueId.Author, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.Author, "g" ), Level = (int)RoleLevel.Author }; } }
        public static Role ExternalUser { get { return new Role() { RoleId = (int)RoleUniqueId.ExternalUser, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.ExternalUser, "g" ), Level = (int)RoleLevel.ExternalUser }; } }
        //end allowed roles

        public bool UserIsAdministrator { get { return Name == Administrator.Name; } }
        public bool UserIsEditor { get { return Name == Editor.Name; } }
        public bool UserIsAuthor { get { return Name == Author.Name; } }
        public bool UserIsExternalUser { get { return Name == ExternalUser.Name; } }
        public bool UserCanAccessAdminArea { get { return Level <= Editor.Level; } }


        public static Expression<Func<Role, bool>> WhereNameEquals( string name )
        {
            return x => x.Name == name;
        }

        public static Expression<Func<Role, bool>> WhereEquals( Role role )
        {
            return x => x.RoleId == role.RoleId;
        }

        public static Expression<Func<Role, bool>> WhereNotEquals( Role role )
        {
            return x => x.RoleId != role.RoleId;
        }
    }

    [Serializable]
    [Flags]
    public enum RoleLevel
    {
        Administrator = 1,
        Editor = 2,
        Author = 3,
        ExternalUser = 4
    }

    [Serializable]
    [Flags]
    public enum RoleUniqueId
    {
        Administrator = 2,
        Editor = 3,
        Author = 1,
        ExternalUser = 4
    }
}
