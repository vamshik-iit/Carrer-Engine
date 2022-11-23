using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Chat : System.Web.UI.Page
    {
        string fromid = "";
        string toid = "";
        string query = "";
        Database dc = new Database();
        DataSet dt1;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                //URL Encoding using from id and to ID to build the communication channel
                fromid = Request.QueryString["fromid"];
                fromid = fromid.Trim();

                toid = Request.QueryString["toid"];
                toid = toid.Trim();


                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {

                    }
                }
                LoadInitialData();
            }
            catch (Exception ex)
            {

            }
        }

        //This is the initial page load method which will bind the data from backed to the updated panel in frontend
        // to the chat window
        private void LoadInitialData()
        {
            try
            {
                query = "select * from MessagesHistory " +
                    "where (FromID=" + fromid + " and ToID=" + toid + ") or (FromID=" + toid + " and ToID=" + fromid + ") and TimeStamp>getdate()-7 order by TimeStamp asc";
                dt1 = dc.ReadData(query);

                dt = dt1.Tables[0];
                string finaltxt = "";

                for(int i = 0; i < dt.Rows.Count; i++)
                {
                    finaltxt = finaltxt + "<b>" + dt.Rows[i]["FromName"].ToString() + "</b>";
                    finaltxt = finaltxt + ": " + dt.Rows[i]["MessageDesc"].ToString() + " ";
                    finaltxt = finaltxt + "<br/>";

                }

                Msg.Text = finaltxt;


                query = "select * from Users where UserID=" + Session["USERID"].ToString();
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                name.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
            }
            catch (Exception ex)
            {

            }
        }

        //This method is called when user click on send button and msg is inserted in database based on 
        // 2 key values i.e. from and to ID
        protected void Send_Click(object sender, EventArgs e)
        {
            try
            {
                string sendername = "";
                string toname = "";

                query = "select * from Users where UserID=" + fromid;
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                sendername = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();

                query = "select * from Users where UserID=" + toid;
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                toname = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();

                query = "insert into MessagesHistory(FromID,FromName,ToID,ToName,MessageDesc) " +
                    "values(" + fromid + ",'" + sendername + "'," + toid + ",'" + toname + "','" + SendText.Text + "')";

                dc.Insert(query);

            }
            catch (Exception ex)
            {

            }
        }
    }
}