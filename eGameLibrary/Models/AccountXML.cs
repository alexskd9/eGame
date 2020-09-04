using System;
using System.Xml.Serialization;

namespace eGameLibrary.Models
{
    public class AccountXML
    {
        [XmlRoot(ElementName = "AuthorizeRequest")]
        public class Account
        {
            [XmlElement(DataType = "int", ElementName = "AcctId")]
            public int AcctId { get; set; }
            [XmlElement(DataType = "string", ElementName = "_Token")]
            public string _Token { get; set; }
        }
    }
}
