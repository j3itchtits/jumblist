using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;
using System.Data.Linq;

namespace Jumblist.Data.Access
{
    public class SqlTempRepository : ITempRepository
    {
        private JumblistDataContext dataContext;

        public SqlTempRepository( string connectionString )
        {
            dataContext = new JumblistDataContext(connectionString);
        }

        //Comment
        #region ITempRepository Members

        public IQueryable<Temp> Temp
        {
            get { return dataContext.Temp; }
        }

        public IQueryable<Temp> SelectTemp()
        {
            return dataContext.Temp;
        }

        public Temp SelectTemp( int id )
        {
            return dataContext.Temp.SingleOrDefault( t => t.TempId == id ); 
        }

        public Temp SelectTemp( string name )
        {
            return dataContext.Temp.FirstOrDefault( t => t.Name == name ); 
        }

        public void Add( Temp temp )
        {
            throw new NotImplementedException();
        }

        public void Delete( Temp temp )
        {
            throw new NotImplementedException();
        }

        public void Save( Temp temp )
        {
            if (temp.TempId == 0)
            {
                dataContext.Temp.InsertOnSubmit( temp );
            }
            else
            {
                //dataContext.Temp.Attach( temp );
                //dataContext.Temp.Context.Refresh( RefreshMode.KeepCurrentValues, temp );

            }
            dataContext.Temp.Context.SubmitChanges();            
        }

        #endregion
    }
}
