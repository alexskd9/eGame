using eGameLibrary.Contracts;
using eGameLibrary.Helpers;
using eGameLibrary.Models;
using System.Web.Mvc;

namespace eGameLibrary.Controllers
{
    public class PlayerController : Controller
    {
        private readonly IGameRepository _gameRepository;
        public PlayerController(IGameRepository gameRepository)
        {
            _gameRepository = gameRepository;
        }
        [HttpPost]
        public JsonResult Authorize(Account account, Token token)
        {
            Authorize result = _gameRepository.Authorizaton(account.AcctId, token._Token);
            return Json(result);
        }

        [HttpPost]
        public JsonResult GetBalance(AccountInfoMain account)
        {
            AuthorizeMain result = _gameRepository.Balance(account.AcctId, account.Currency);
            return Json(result);
        }

        [HttpPost]
        public JsonResult PlaceBet(Transfer transfer)
        {
            AuthorizeMain accInfo = _gameRepository.Balance(transfer.AcctId, transfer.Currency);
            TransferResponse classToCheck = Checker.Check(accInfo, transfer);
            return Json(classToCheck);
        }

        [HttpPost]
        public JsonResult CancelBet(Transfer transfer)
        {
            AuthorizeMain accInfo = _gameRepository.Balance(transfer.AcctId, transfer.Currency);
            TransferResponse classToCheck = Checker.Check(accInfo, transfer);
            return Json(classToCheck);
        }
    }
}