using Dapper;
using eGameLibrary.Models;
using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace eGameLibrary.Helpers
{
    public class Transaction
    {
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
    }
}