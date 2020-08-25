using Dapper;
using eGameLibrary.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
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
    }
}
