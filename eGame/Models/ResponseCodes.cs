using System.Web.Mvc;

namespace eGame.Models
{
    public class ResponseCodes
    {
        public static string Response(int code)
        {
            switch (code)
            {
                case 0:
                    return "Success";
                case 1:
                    return "System error";
                case 2:
                    return "Invalid Request";
                case 3:
                    return "Service Inaccessible";
                case 100:
                    return "Request Timeout";
                case 101:
                    return "Call Limited";
                case 104:
                    return "Request Forbidden";
                case 105:
                    return "Missing Parameters";
                case 106:
                    return "Invalid Parameters";
                case 107:
                    return "Duplicated Serial NO.";
                case 109:
                    return "Reference No Not found";
                case 110:
                    return "Dplicated Reference No";
                case 10113:
                    return "Merchant Not Found";
                case 112:
                    return "API Call Limited";
                case 113:
                    return "Invalid Acct ID";
                case 118:
                    return "Invalid Format";
                case 50099:
                    return "Acct Exist";
                case 50100:
                    return "Acct Not Found";
                case 50101:
                    return "Acct Inactive";
                case 50102:
                    return "Acct Locked";
                case 50103:
                    return "Acct Suspend";
                case 50104:
                    return "Token Validation Failed";
                case 50110:
                    return "Insufficient Balance";
                case 50111:
                    return "Exceed Max Amount";
                case 50112:
                    return "Currency Invalid";
                case 50113:
                    return "Amount Invalid";
                case 50115:
                    return "Date Format Invalid";
                case 10104:
                    return "Password Invalid";
                case 10105:
                    return "Transaction is already canceled";
                case 999:
                    return "Unknown error. Bet canceled";
                default:
                    return "Unexpected error";
            }
        }
    }
}