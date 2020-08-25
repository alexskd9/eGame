using Dapper;
using eGameLibrary.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace eGameLibrary.DAL
{
    public class DbOperations
    {
        public static AccountInfo Authorization(int AcctId, string _Token)
        {
            AccountInfo search;
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("token", _Token);
                p.Add("AcctId", AcctId);

                search = connection.Query<AccountInfo>("AuthorizeAccount", param: p, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
            return search;
        }

        public static AccountInfoMain GetBalance(int AcctID, string Currency)
        {
            AccountInfoMain search;
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("AcctId", AcctID);
                p.Add("Currency", Currency);

                search = connection.Query<AccountInfoMain>("GetBalance", param: p, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
            return search;
        }

        public static string Transfer(Transfer transfer, out int res)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("TransferId", dbType: DbType.Guid, direction: ParameterDirection.Output);
                p.Add("AcctId", transfer.AcctId);
                p.Add("Currency", transfer.Currency);
                p.Add("Amount", transfer.Amount);
                p.Add("Type", transfer.Type);
                p.Add("TicketId", transfer.TicketId);
                p.Add("Channel", transfer.Channel);
                p.Add("GameCode", transfer.GameCode);
                p.Add("SpecialGameId", transfer.SpecialGame);
                p.Add("ReferenceId", transfer.ReferenceId);
                p.Add("RetVal", dbType: DbType.Int32, direction: ParameterDirection.ReturnValue);

                connection.Query("Transaction", param: p, commandType: CommandType.StoredProcedure);
                transfer.TransferId = p.Get<Guid>("TransferId").ToString();
                res = p.Get<int>("RetVal");
                return transfer.TransferId;
            }
        }

        public static string Cancel(Transfer transfer, out int res)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("TransferId", dbType: DbType.Guid, direction: ParameterDirection.Output);
                p.Add("ReferenceId", transfer.ReferenceId);
                p.Add("AcctId", transfer.AcctId);
                p.Add("Currency", transfer.Currency);
                p.Add("Amount", transfer.Amount);
                p.Add("Type", transfer.Type);
                p.Add("RetVal", dbType: DbType.Int32, direction: ParameterDirection.ReturnValue);

                var search = connection.Query("select * from Transfers where ReferenceId = @ReferenceId", param: p, commandType: CommandType.Text).FirstOrDefault();
                if (search != null)
                {
                    connection.Query("CancelBet", param: p, commandType: CommandType.StoredProcedure);
                }
                else
                {
                    connection.Query("CancelledBet", param: p, commandType: CommandType.StoredProcedure);
                }
                res = p.Get<int>("RetVal");
                transfer.TransferId = p.Get<Guid>("TransferId").ToString();
                return transfer.TransferId;
            }
        }
    }
}
