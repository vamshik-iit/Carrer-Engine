using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                Session["USERID"] = null;
            }
            catch (Exception ex)
            {

            }
        }


        //Validation credentials based on the user input and backend database values
        //If true permittting to enter the job portal to home page
        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                string EMAIL = email.Text;
                string passwd = pass.Text;
                DataSet logvalid;
                string query = "";
                query = "select * from Users where Email='" + EMAIL + "' and Password='" + passwd + "'";
                Database dc = new Database();

                logvalid = dc.ReadData(query);
                DataTable dt = logvalid.Tables[0];


                if (dt.Rows.Count > 0)
                {
                    //Creating session of user login information
                    //Storing important user information and used it for futher functional logic

                    Session["USERID"] = dt.Rows[0]["USERID"].ToString();
                    Session["FirstName"] = dt.Rows[0]["FirstName"].ToString();
                    Session["LastName"] = dt.Rows[0]["LastName"].ToString();
                    Session["Email"] = dt.Rows[0]["Email"].ToString();
                    if (dt.Rows[0]["Role"].ToString() == "Recuiter")
                    {
                        Session["Role"] = "Recuiter";
                    }
                    else if (dt.Rows[0]["Role"].ToString() == "Admin")
                    {
                        Session["Role"] = "Admin";
                    }

                    else
                    {
                        Session["Role"] = "JobSeaker";
                    }

                    Response.Redirect("Default.aspx");

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Login')", true);


                }
            }
            catch (Exception ex)
            {

            }
        }




    }
}