namespace eGameLibrary.Models
{
    public class TransferResponse
    {
        public string TransferId { get; set; }
        public int AcctId { get; set; }
        public decimal Balance { get; set; }
        public string Msg { get; set; }
        public int Code { get; set; }
        public string SerialNo { get; set; }
    }
}