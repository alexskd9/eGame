namespace eGame.Models
{
    public class Authorize
    {
        public AccountInfo AccountInfo { get; set; }
        public string Msg { get; set; }
        public int Code { get; set; }
        public string SerialNo { get; set; }
    }
}