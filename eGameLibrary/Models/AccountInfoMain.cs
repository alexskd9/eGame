using System.Xml.Serialization;

namespace eGameLibrary.Models
{
    [XmlRoot(ElementName = "GetBalanceRequest")]
    public class AccountInfoMain
    {
        public int AcctId { get; set; }
        public decimal Balance { get; set; }
        public string UserName { get; set; }
        public string Currency { get; set; }
    }
}