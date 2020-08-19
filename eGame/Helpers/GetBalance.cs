using Dapper;
using eGame.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace eGame.Helpers
{
    public class GetBalance
    {
        public static AuthorizeMain Balance(int AcctID)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            AccountInfoMain search;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("AcctId", AcctID);

                search = connection.Query<AccountInfoMain>("GetBalance", param: p, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
            AuthorizeMain authorize = new AuthorizeMain();
            authorize.AccountInfoMain = search;
            if (search != null)
            {
                authorize.Msg = ResponseCodes.response(authorize.Code);
            }
            else
            {
                authorize.Code = 50100;
                authorize.Msg = ResponseCodes.response(authorize.Code);
            }
            authorize.SerialNo = Guid.NewGuid().ToString();
            return authorize;
        }
    }
}