namespace eGame.Models
{
    public class Token
    {
        public Account AcctId { get; set; }
        public string _Token { get; set; }
        public bool IsActive { get; set; }
    }
}