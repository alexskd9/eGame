using eGameLibrary.Models;

namespace eGameLibrary.Contracts
{
    public interface IGameRepository
    {
        Authorize Authorizaton(int AcctId, string _Token);
        string Cancel(Transfer transfer, out int res);
        AuthorizeMain Balance(int AcctID, string Currency);
        string Transfer(Transfer transfer, out int res);
        TransferResponse ModelCreator(Transfer transfer, int Code, string Msg);
    }
}
