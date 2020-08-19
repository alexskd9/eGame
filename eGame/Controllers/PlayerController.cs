using eGame.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace eGame.Controllers
{
    public class PlayerController : Controller
    {
        [HttpPost]
        public JsonResult Authorize(Token token)
        {
            var result = Helpers.Authorization.Authorizaton(token._Token);
            return Json(result);
        }

        [HttpPost]
        public JsonResult GetBalance(Account account)
        {
            var result = Helpers.GetBalance.Balance(account.AcctId);
            return Json(result);
        }

        [HttpPost]
        public JsonResult PlaceBet(Transfer transfer)
        {
            var accInfo = Helpers.GetBalance.Balance(transfer.AcctId);
            if (accInfo.AccountInfoMain != null)
            {
                switch (transfer.Type)
                {
                    case 1:
                        if (accInfo.AccountInfoMain.Currency.ToUpper() == transfer.Currency.ToUpper())
                        {
                            if (transfer.Amount.ToString().All(char.IsDigit))
                            {
                                if (transfer.Amount <= 0)
                                {
                                    accInfo.Code = 50113;
                                    accInfo.Msg = ResponseCodes.response(accInfo.Code);
                                }
                                else
                                {
                                    if (transfer.Amount <= accInfo.AccountInfoMain.Balance)
                                    {
                                        var placeBet = Helpers.PlaceBet.Transfer(transfer);
                                    }
                                    else
                                    {
                                        accInfo.Code = 50110;
                                        accInfo.Msg = ResponseCodes.response(accInfo.Code);
                                    }
                                }
                            }
                            else
                            {
                                accInfo.Code = 106;
                                accInfo.Msg = ResponseCodes.response(accInfo.Code);
                            }
                        }
                        else
                        {
                            accInfo.Code = 50112;
                            accInfo.Msg = ResponseCodes.response(accInfo.Code);
                        }
                        break;
                    case 2:
                        accInfo.Code = 1;
                        accInfo.Msg = ResponseCodes.response(accInfo.Code);
                        break;
                    case 4:
                        var payout = Helpers.Payout._Payout(transfer);
                        break;
                    default:
                        accInfo.Code = 1;
                        accInfo.Msg = ResponseCodes.response(accInfo.Code);
                        break;
                }
            }
            var accinfo2 = Helpers.GetBalance.Balance(transfer.AcctId);
            TransferResponse tr = new TransferResponse();
            tr.AcctId = accInfo.AccountInfoMain.AcctId;
            tr.Balance = accinfo2.AccountInfoMain.Balance;
            tr.Code = accInfo.Code;
            tr.Msg = accInfo.Msg;
            tr.TransferId = Helpers.LastTransferId.LastTransaction(accInfo.AccountInfoMain.AcctId);
            tr.SerialNo = Guid.NewGuid().ToString();
            return Json(tr);
        }
    }
}