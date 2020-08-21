using eGame.Models;
using System;
using System.Linq;

namespace eGame.Helpers
{
    public class Checker
    {
        public static TransferResponse Check(AuthorizeMain accInfo, Transfer transfer)
        {
            if (accInfo.AccountInfoMain != null)
            {
                if (accInfo.AccountInfoMain.Currency.ToUpper() == transfer.Currency.ToUpper())
                {
                    if (transfer.Amount.ToString().All(char.IsDigit))
                    {
                        if (transfer.Amount <= 0)
                        {
                            accInfo.Code = 50113;
                            accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                        }
                        else
                        {
                            if (transfer.Type == 1 && transfer.Amount <= accInfo.AccountInfoMain.Balance || transfer.Type == 4)
                            {
                                var placeBet = Transaction.Transfer(transfer);
                            }
                            else if (transfer.Type == 2)
                            {
                                var cancelBet = CancelBet.Cancel(transfer, out int res);
                                accInfo.Code = res;
                                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                            }
                            else
                            {
                                accInfo.Code = 50110;
                                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                            }
                        }
                    }
                    else
                    {
                        accInfo.Code = 106;
                        accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                    }
                }
                else
                {
                    accInfo.Code = 50112;
                    accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                }
            }
            else
            {
                accInfo.Code = 50100;
                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
            }
            

            #region Unnecessary part
            //switch (transfer.Type)
            //{
            //    case 1:
            //        if (accInfo.AccountInfoMain.Currency.ToUpper() == transfer.Currency.ToUpper())
            //        {
            //            if (transfer.Amount.ToString().All(char.IsDigit))
            //            {
            //                if (transfer.Amount <= 0)
            //                {
            //                    accInfo.Code = 50113;
            //                    accInfo.Msg = ResponseCodes.response(accInfo.Code);
            //                }
            //                else
            //                {
            //                    if (transfer.Amount <= accInfo.AccountInfoMain.Balance)
            //                    {
            //                        var placeBet = Transaction.Transfer(transfer);
            //                    }
            //                    else
            //                    {
            //                        accInfo.Code = 50110;
            //                        accInfo.Msg = ResponseCodes.response(accInfo.Code);
            //                    }
            //                }
            //            }
            //            else
            //            {
            //                accInfo.Code = 106;
            //                accInfo.Msg = ResponseCodes.response(accInfo.Code);
            //            }
            //        }
            //        else
            //        {
            //            accInfo.Code = 50112;
            //            accInfo.Msg = ResponseCodes.response(accInfo.Code);
            //        }
            //        break;
            //    case 2:
            //        var cancelBet = CancelBet.Cancel(transfer);
            //        accInfo.Code = cancelBet.Item2;
            //        accInfo.Msg = ResponseCodes.response(accInfo.Code);
            //        break;
            //    case 4:
            //        var payout = Transaction.Transfer(transfer);
            //        break;
            //    default:
            //        accInfo.Code = 1;
            //        accInfo.Msg = ResponseCodes.response(accInfo.Code);
            //        break;
            //}
            #endregion

            var accinfo2 = GetBalance.Balance(transfer.AcctId, transfer.Currency);
            TransferResponse tr = new TransferResponse();
            if (accInfo.AccountInfoMain != null)
            {
                tr.AcctId = accInfo.AccountInfoMain.AcctId;
                tr.Balance = accinfo2.AccountInfoMain.Balance;
                tr.Code = accInfo.Code;
                tr.Msg = accInfo.Msg;
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