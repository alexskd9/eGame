using Dapper;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace eGame.Helpers
{
    public class LastTransferId
    {
        public static string LastTransaction(int AcctId)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            string result;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("AcctId", AcctId);

                result = connection.Query("GetLastTransactionId", param: p, commandType: CommandType.StoredProcedure).ToString();
            }
            return result;
        }
    }
}