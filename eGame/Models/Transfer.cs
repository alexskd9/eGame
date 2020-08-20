namespace eGame.Models
{
    public class Transfer
    {
        public int AcctId { get; set; }
        public string TransferId { get; set; }
        public string Currency { get; set; }
        public decimal Amount { get; set; }
        public int Type { get; set; }
        public string TicketId { get; set; }
        public string Channel { get; set; }
        public string GameCode { get; set; }
        public string SerialNo { get; set; }
        public string ReferenceId { get; set; }
        public int SpecialGame { get; set; }
    }
}