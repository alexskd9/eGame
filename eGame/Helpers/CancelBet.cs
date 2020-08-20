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
        public static int Cancel(Transfer transfer, out int res)
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
                p.Add("RetVal", dbType: DbType.Int32, direction: ParameterDirection.ReturnValue);


                DynamicParameters p1 = new DynamicParameters();
                p1.Add("TransferId", transfer.TransferId);
                var search = connection.Query($"select * from Transfers where TransferId = @TransferId ", param:p1, commandType: CommandType.Text);

                if (search.Count() > 0)
                {
                    connection.Query("CancelBet", param: p, commandType: CommandType.StoredProcedure);
                    res = p.Get<int>("RetVal");
                    return res;
                }
                else
                {                    
                    return res = 109;
                }
            }
        }
    }
}