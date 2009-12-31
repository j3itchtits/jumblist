namespace StuartClode.Mvc.Model
{
    public abstract class Entity<T> : IEntity where T : class, IEntity
    {
        public virtual int Id { get; set; }

        public bool IsNew
        {
            get { return Id == 0; }
        }
    }
}