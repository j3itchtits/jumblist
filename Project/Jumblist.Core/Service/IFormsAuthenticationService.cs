using System;
using System.Web.Security;

namespace Jumblist.Core.Service
{
    public interface IFormsAuthenticationService
	{
		void SignOut();
		void SetAuthCookie(string name, bool createPersistentCookie);
		string HashPasswordForStoringInConfigFile(string password);
	}
}