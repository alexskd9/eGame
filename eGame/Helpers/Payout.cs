using Dapper;
using eGame.Models;
using System;
using System.Configuration;
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
                p.Add("TransferId", Guid.NewGuid().ToString());
                p.Add("AcctId", transfer.AcctId);
                p.Add("Currency", transfer.Currency);
                p.Add("Amount", transfer.Amount);
                p.Add("Type", transfer.Type);
                p.Add("Channel", "Web");
                p.Add("GameCode", "S-DG02");
                p.Add("TicketId", 234950357);
                p.Add("SpecialGameId", 1);
                p.Add("ReferenceId", "dfffdca06c14811b24653468e60");
                p.Add("RefTicketIds", "[" + "120001, 120002, 120003" + "]");

                connection.Query("Payout", param: p, commandType: System.Data.CommandType.StoredProcedure);
                return transfer;
            }
        }
    }
}