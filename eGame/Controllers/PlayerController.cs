using eGameLibrary.Helpers;
using eGameLibrary.Models;
using System.Web.Mvc;

namespace eGameLibrary.Controllers
{
    public class PlayerController : Controller
    {
        [HttpPost]
        public JsonResult Authorize(Account account, Token token)
        {
            Authorize result = Authorization.Authorizaton(account.AcctId, token._Token);
            return Json(result);
        }

        [HttpPost]
        public JsonResult GetBalance(AccountInfoMain account)
        {
            AuthorizeMain result = Helpers.GetBalance.Balance(account.AcctId, account.Currency);
            return Json(result);
        }

        [HttpPost]
        public JsonResult PlaceBet(Transfer transfer)
        {
            AuthorizeMain accInfo = Helpers.GetBalance.Balance(transfer.AcctId, transfer.Currency);
            TransferResponse classToCheck = Checker.Check(accInfo, transfer);
            return Json(classToCheck);
        }

        [HttpPost]
        public JsonResult CancelBet(Transfer transfer)
        {
            AuthorizeMain accInfo = Helpers.GetBalance.Balance(transfer.AcctId, transfer.Currency);
            TransferResponse classToCheck = Checker.Check(accInfo, transfer);
            return Json(classToCheck);
        }
    }
}