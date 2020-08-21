using Dapper;
using eGame.Models;
using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace eGame.Helpers
{
    public class Transaction
    {
        public static string Transfer(Transfer transfer)
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
                p.Add("ReferenceId", Guid.NewGuid());
                p.Add("RetVal", dbType: DbType.Int32, direction: ParameterDirection.ReturnValue);

                connection.Query("Transaction", param: p, commandType: CommandType.StoredProcedure);
                transfer.TransferId = p.Get<Guid>("TransferId").ToString();
                int val = p.Get<int>("RetVal");
                return transfer.TransferId;
            }
        }
    }
}