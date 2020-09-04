using eGameLibrary.XML;
using eGameLibrary.Contracts;
using eGameLibrary.Helpers;
using eGameLibrary.Models;
using System.Web.Mvc;
using System.IO;
using System.Text;

namespace eGame.Controllers
{
    public class XMLPlayerController : Controller
    {
        private readonly IGameRepository _gameRepository;
        public XMLPlayerController(IGameRepository gameRepository)
        {
            _gameRepository = gameRepository;
        }
        [HttpPost]
        public string Authorize()
        {
            var requestContent = GetRequestContentAsString();
            var document = SerDeserUtility.Deserialize<AccountXML.Account>(requestContent);
            Authorize result = _gameRepository.Authorizaton(document.AcctId, document._Token);
            return SerDeserUtility.SerializeToPlainXml(result);
        }

        [HttpPost]
        public string GetBalance()
        {
            var requestContent = GetRequestContentAsString();
            var document = SerDeserUtility.Deserialize<AccountInfoMain>(requestContent);
            AuthorizeMain result = _gameRepository.Balance(document.AcctId, document.Currency);
            return SerDeserUtility.SerializeToPlainXml(result);
        }

        [HttpPost]
        public string PlaceBet()
        {
            var requestContent = GetRequestContentAsString();
            var document = SerDeserUtility.Deserialize<Transfer>(requestContent);
            Checker c = new Checker(_gameRepository);
            AuthorizeMain accInfo = _gameRepository.Balance(document.AcctId, document.Currency);
            TransferResponse classToCheck = c.Check(accInfo, document);
            return SerDeserUtility.SerializeToPlainXml(classToCheck);
        }

        [HttpPost]
        public string CancelBet()
        {
            var requestContent = GetRequestContentAsString();
            var document = SerDeserUtility.Deserialize<Transfer>(requestContent);
            Checker c = new Checker(_gameRepository);
            AuthorizeMain accInfo = _gameRepository.Balance(document.AcctId, document.Currency);
            TransferResponse classToCheck = c.Check(accInfo, document);
            return SerDeserUtility.SerializeToPlainXml(classToCheck);
        }

        private string GetRequestContentAsString()
        {
            using (var receiveStream = Request.InputStream)
            {
                using (var readStream = new StreamReader(receiveStream, Encoding.UTF8))
                {
                    return readStream.ReadToEnd();
                }
            }
        }
    }
}