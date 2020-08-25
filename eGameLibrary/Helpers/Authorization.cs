using Dapper;
using eGameLibrary.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace eGameLibrary.Helpers
{
    public class Authorization
    {
        public static Authorize Authorizaton(int AcctId, string _Token)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            AccountInfo search;
            using (var connection = new SqlConnection(connString))
            {
                DynamicParameters p = new DynamicParameters();
                p.Add("token", _Token);
                p.Add("AcctId", AcctId);

                search = connection.Query<AccountInfo>("AuthorizeAccount", param: p, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
            Authorize authorize = new Authorize();
            authorize.AccountInfo = search;
            if (search != null)
            {
                authorize.Msg = ResponseCodes.Response(authorize.Code);
            }
            else
            {
                authorize.Code = 50104;
                authorize.Msg = ResponseCodes.Response(authorize.Code);
            }
            authorize.SerialNo = Guid.NewGuid().ToString();
            return authorize;
        }
    }
}