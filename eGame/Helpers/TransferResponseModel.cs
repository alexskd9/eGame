using eGame.Models;
using System;

namespace eGame.Helpers
{
    public class TransferResponseModel
    {
        public static TransferResponse ModelCreator(Transfer transfer, int Code, string Msg)
        {
            AuthorizeMain accinfo2 = GetBalance.Balance(transfer.AcctId, transfer.Currency);
            TransferResponse tr = new TransferResponse();
            if (accinfo2.AccountInfoMain != null)
            {
                tr.AcctId = accinfo2.AccountInfoMain.AcctId;
                tr.Balance = accinfo2.AccountInfoMain.Balance;
                tr.Code = Code;
                tr.Msg = Msg;
                tr.TransferId = transfer.TransferId;
                tr.SerialNo = Guid.NewGuid().ToString();
                return tr;
            }
            else
            {
                tr.Code = 50100;
                tr.Msg = ResponseCodes.Response(tr.Code);
                tr.TransferId = transfer.TransferId;
                tr.SerialNo = Guid.NewGuid().ToString();
                return tr;
            }
        }
    }
}