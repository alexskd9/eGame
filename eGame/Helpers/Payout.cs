using Dapper;
using eGame.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace eGame.Helpers
{
    public class Payout
    {
        public static Transfer _Payout(Transfer transfer)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("TransferId", DbType.Guid.ToString(), direction: ParameterDirection.Output);
                p.Add("AcctId", transfer.AcctId);
                p.Add("Currency", transfer.Currency);
                p.Add("Amount", transfer.Amount);
                p.Add("Type", transfer.Type);
                p.Add("Channel", transfer.Channel);
                p.Add("GameCode", transfer.GameCode);
                p.Add("TicketId", transfer.TicketId);
                p.Add("SpecialGameId", transfer.SpecialGame);
                p.Add("ReferenceId", transfer.ReferenceId);

                connection.Query("Payout", param: p, commandType: System.Data.CommandType.StoredProcedure);
                transfer.TransferId = p.Get<string>("TransferId");
                return transfer;
            }
        }
    }
}