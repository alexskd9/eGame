using eGameLibrary.Contracts;
using eGameLibrary.Models;

namespace eGameLibrary.Helpers
{
    public class Checker
    {
        private readonly IGameRepository _gameRepository;
        public Checker(IGameRepository gameRepository)
        {
            _gameRepository = gameRepository;
        }
        public TransferResponse Check(AuthorizeMain accInfo, Transfer transfer)
        {
            if (accInfo.AccountInfoMain == null)
            {
                accInfo.Code = 50100;
                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                return TransferResponseModel.ModelCreator(transfer, accInfo.Code, accInfo.Msg);
            }

            if (accInfo.AccountInfoMain.Currency.ToUpper() != transfer.Currency.ToUpper())
            {
                accInfo.Code = 50112;
                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                return TransferResponseModel.ModelCreator(transfer, accInfo.Code, accInfo.Msg);
            }

            if (transfer.Amount <= 0)
            {
                accInfo.Code = 50113;
                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                return TransferResponseModel.ModelCreator(transfer, accInfo.Code, accInfo.Msg);
            }

            if (transfer.Type == 1 && transfer.Amount <= accInfo.AccountInfoMain.Balance || transfer.Type == 4)
            {
                _gameRepository.Transfer(transfer, out int res);
                accInfo.Code = res;
                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                return _gameRepository.ModelCreator(transfer, accInfo.Code, accInfo.Msg);
            }

            else if (transfer.Type == 2)
            {
                _gameRepository.Cancel(transfer, out int res);
                accInfo.Code = res;
                accInfo.Msg = ResponseCodes.Response(accInfo.Code);
                return _gameRepository.ModelCreator(transfer, accInfo.Code, accInfo.Msg);
            }

            return null;
        }
    }
}