using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Jumblist.Data.Entity;

namespace Jumblist.Data.Access
{
    public interface ITempRepository
    {
        //Query Lists
        IQueryable<Temp> Temp { get; }
        IQueryable<Temp> SelectTemp();

        //Query Item
        Temp SelectTemp( int id );
        Temp SelectTemp( string name );

        // Insert/Delete
        void Add( Temp temp );
        void Delete( Temp temp );

        // Persistence
        void Save( Temp temp );


    }
}
