using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }

        //This method get data from front end and stores data in backend database to validate data later on by login page
        protected void Register_Click(object sender, EventArgs e)
        {
            try
            {
                string EMAIL = email.Text;
                string passwd = pass.Text;
                string FirstName = fname.Text;
                string LastName = lname.Text;

                DataSet logvalid;
                string query = "";
                query = "select * from Users where Email='" + EMAIL + "'";
                Database dc = new Database();

                logvalid = dc.ReadData(query);
                DataTable dt = logvalid.Tables[0];


                if(dt.Rows.Count > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('User already exists, Please login')", true);

                }
                else
                {
                    query = "select max(UserID)+1 as UserID from users";
                  

                    logvalid = dc.ReadData(query);
                    dt = logvalid.Tables[0];


                    query = "insert into Users(UserID,FirstName,LastName,Email,Password,Role) " +
                        "values(" + dt.Rows[0]["USERID"].ToString() + ",'" + FirstName + "','" + LastName + "'" +
                        ",'" + EMAIL + "','" + passwd + "','JobSeaker')";


                    if (dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success, Please login')", true);

                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                    }

                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}