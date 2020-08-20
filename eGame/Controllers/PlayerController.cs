using eGame.Helpers;
using eGame.Models;
using System.Web.Mvc;

namespace eGame.Controllers
{
    public class PlayerController : Controller
    {
        [HttpPost]
        public JsonResult Authorize(Account account, Token token)
        {
            var result = Authorization.Authorizaton(account.AcctId, token._Token);
            return Json(result);
        }

        [HttpPost]
        public JsonResult GetBalance(AccountInfoMain account)
        {
            var result = Helpers.GetBalance.Balance(account.AcctId, account.Currency);
            return Json(result);
        }

        [HttpPost]
        public JsonResult PlaceBet(Transfer transfer)
        {
            var accInfo = Helpers.GetBalance.Balance(transfer.AcctId, transfer.Currency);
            var classToCheck = Checker.Check(accInfo, transfer);
            return Json(classToCheck);
        }

        [HttpPost]
        public JsonResult CancelBet(Transfer transfer)
        {
            var accInfo = Helpers.GetBalance.Balance(transfer.AcctId, transfer.Currency);
            var classToCheck = Checker.Check(accInfo, transfer);
            return Json(classToCheck);
        }
    }
}