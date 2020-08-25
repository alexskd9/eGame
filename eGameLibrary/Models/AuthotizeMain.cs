namespace eGameLibrary.Models
{
    public class AuthorizeMain
    {
        public AccountInfoMain AccountInfoMain { get; set; }
        public string Msg { get; set; }
        public int Code { get; set; }
        public string SerialNo { get; set; }
    }
}