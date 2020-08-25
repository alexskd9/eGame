using Dapper;
using eGameLibrary.DAL;
using eGameLibrary.Contracts;
using eGameLibrary.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace eGameLibrary.Helpers
{
    public class GameRepository : IGameRepository
    {
        public Authorize Authorizaton(int AcctId, string _Token)
        {
            AccountInfo search;
            search = DbOperations.Authorization(AcctId, _Token);
            Authorize authorize = new Authorize();
            authorize.AccountInfo = search;
            if (search != null)
            {
                authorize.Msg = ResponseCodes.Response(authorize.Code);
            }
            else
            {
                authorize.Code = 50104;
                authorize.Msg = ResponseCodes.Response(authorize.Code);
            }
            authorize.SerialNo = Guid.NewGuid().ToString();
            return authorize;
        }

        public AuthorizeMain Balance(int AcctID, string Currency)
        {
            AccountInfoMain search = DbOperations.GetBalance(AcctID, Currency);
            AuthorizeMain authorize = new AuthorizeMain();
            authorize.AccountInfoMain = search;
            if (search != null)
            {
                authorize.Msg = ResponseCodes.Response(authorize.Code);
            }
            else
            {
                authorize.Code = 50100;
                authorize.Msg = ResponseCodes.Response(authorize.Code);
            }
            authorize.SerialNo = Guid.NewGuid().ToString();
            return authorize;
        }

        public string Cancel(Transfer transfer, out int res)
        {
            return DbOperations.Cancel(transfer, out res);
        }
        
        public string Transfer(Transfer transfer, out int res)
        {
            return DbOperations.Transfer(transfer, out res);
        }

        public TransferResponse ModelCreator(Transfer transfer, int Code, string Msg)
        {
            AuthorizeMain accinfo2 = Balance(transfer.AcctId, transfer.Currency);
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
