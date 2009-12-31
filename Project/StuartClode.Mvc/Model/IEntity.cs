namespace StuartClode.Mvc.Model
{
    public interface IEntity
    {
        int Id { get; set; }
        bool IsNew { get; }
    }
}