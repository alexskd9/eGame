using Dapper;
using eGame.Models;
using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;

namespace eGame.Helpers
{
    public class CancelBet
    {
        public static Transfer Cancel(Transfer transfer)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("TransferId", transfer.TransferId);
                p.Add("AcctId", transfer.AcctId);
                p.Add("Currency", transfer.Currency);
                p.Add("Amount", transfer.Amount);
                p.Add("Type", transfer.Type);

                var search = connection.Query($"select * from Transfers where TransferId = '{transfer.TransferId}'", commandType: CommandType.Text);
                if (search.Count() > 0)
                {
                    connection.Query("CancelBet", param: p, commandType: CommandType.StoredProcedure);
                }
                return transfer;
            }
        }
    }
}