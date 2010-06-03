using System;
using System.Linq.Expressions;

namespace Jumblist.Core.Model
{
    public partial class Role
    {
        // allowed roles. These must match the data in table Role
        public static Role Administrator { get { return new Role() { RoleId = (int)RoleUniqueId.Administrator, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.Administrator, "g" ), Level = (int)RoleLevel.Administrator }; } }
        public static Role Editor { get { return new Role() { RoleId = (int)RoleUniqueId.Editor, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.Editor, "g" ), Level = (int)RoleLevel.Editor }; } }
        public static Role RegisteredUser { get { return new Role() { RoleId = (int)RoleUniqueId.RegisteredUser, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.RegisteredUser, "g" ), Level = (int)RoleLevel.RegisteredUser }; } }
        public static Role AnonymousUser { get { return new Role() { RoleId = (int)RoleUniqueId.AnonymousUser, Name = Enum.Format( typeof( RoleUniqueId ), RoleUniqueId.AnonymousUser, "g" ), Level = (int)RoleLevel.AnonymousUser }; } }
        //end allowed roles

        public bool UserIsAdministrator { get { return Name == Administrator.Name; } }
        public bool UserIsEditor { get { return Name == Editor.Name; } }
        public bool UserIsRegisteredUser { get { return Name == RegisteredUser.Name; } }
        public bool UserIsAnonymousUser { get { return Name == AnonymousUser.Name; } }
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
        RegisteredUser = 3,
        AnonymousUser = 4
    }

    [Serializable]
    [Flags]
    public enum RoleUniqueId
    {
        Administrator = 2,
        Editor = 3,
        RegisteredUser = 1,
        AnonymousUser = 4
    }
}
