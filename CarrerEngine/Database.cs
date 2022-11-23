using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;
using System.Data;

namespace CarrerEngine
{
    public class Database
    {
        public static System.Data.Common.DbProviderFactory dbFactory;
        public static string connstring = String.Empty;
        public static string providername = String.Empty;
        private Database conn = null;
        
        SqlConnection con = new SqlConnection("data source=SANJAYBOGA; Initial Catalog = CarrerEngine; Trusted_Connection = True;");
        
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        public Database()
        {
            connstring = ConfigurationManager.ConnectionStrings["conns"].ConnectionString;
            providername = "System.Data.SqlClient";
            dbFactory = DbProviderFactories.GetFactory(providername);
        }

        public DataSet ReadData(string qry)
        {
            try
            {
                da = new SqlDataAdapter(qry, con);
                ds = new DataSet();
                con.Open();
                DataTable dt = new DataTable();
                da.Fill(ds, "Student");

                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
            }

            return ds;
        }

        public Boolean Insert(string qry)
        {
            try
            {
                cmd = new SqlCommand();
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = qry;
                cmd.ExecuteNonQuery();
                con.Close();
                return true;
            }
            catch (Exception ex)
            {
                con.Close();
            }
            return false;
        }


    }
}