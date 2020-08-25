using Dapper;
using eGameLibrary.Models;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System;

namespace eGameLibrary.Helpers
{
    public class CancelBet
    {
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