using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class UserProfile : System.Web.UI.Page
    {
        Database dc = new Database();
        DataSet dt1;
        DataTable dt = new DataTable();
        string profileid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                profileid = Request.QueryString["profileid"];
                profileid = profileid.Trim();


                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {
                        //Initial loading of the data from database
                        LoadInitialData();
                    }
                }
                

            }
            catch (Exception ex)
            {

            }
        }


        //Loading the save data from ProfileEdit.aspx page and this methos is used to load those data
        //and bind in the front end form
        protected void LoadInitialData()
        {
            try
            {
                
                if(profileid == "")
                {
                    profileid = Session["USERID"].ToString();
                }

                string query = "";
                query = "select * from Users where USERID=" + profileid + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                UserName.Text = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
                UserName.Font.Size = 40;
                email.Text = dt.Rows[0]["Email"].ToString();
                ABOUT.Text = dt.Rows[0]["AboutMe"].ToString();

                query = "select * from UserAddress where USERID=" + profileid + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                

                Mobile.Text = dt.Rows[0]["Mobile"].ToString();
                Address.Text = dt.Rows[0]["Street"].ToString() + " " + dt.Rows[0]["City"].ToString() + " " +
                    "" + dt.Rows[0]["State"].ToString() + " " + dt.Rows[0]["country"].ToString() + " " + dt.Rows[0]["Zipcode"].ToString();


                query = "select * from UserSkills where USERID=" + profileid + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                PS.Text = dt.Rows[0]["PrimarySkill"].ToString();
                SS.Text = dt.Rows[0]["SecondarySkill"].ToString();
                OS.Text = dt.Rows[0]["OtherSkills"].ToString();


                DateTime temp;
                string s;

                query = "select * from WorkExperience where USERID=" + profileid + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                if(dt.Rows.Count > 0)
                {
                    WCompany.Text = dt.Rows[0]["Role"].ToString() + " at " + dt.Rows[0]["CompanyName"].ToString();
                    WRole.Text = dt.Rows[0]["Role"].ToString();

                    WTen.Text = (Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture) + " to "
                        + (Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WDes.Text = "";

                }

                if (dt.Rows.Count > 1)
                {
                    WCompany2.Text = dt.Rows[1]["CompanyName"].ToString() + " at " + dt.Rows[1]["CompanyName"].ToString();
                    WRole2.Text = dt.Rows[1]["Role"].ToString();

                    WTen2.Text = (Convert.ToDateTime(dt.Rows[1]["FromDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture) + " to "
                        + (Convert.ToDateTime(dt.Rows[1]["ToDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WDes2.Text = "";

                }



                query = "select * from Certifications where USERID=" + profileid + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    CertName.Text = dt.Rows[0]["Name"].ToString();
                    CertFrom.Text = dt.Rows[0]["IssuedBy"].ToString();
                    CertDesc.Text = dt.Rows[0]["CertDesc"].ToString();

                    CertExp.Text = (Convert.ToDateTime(dt.Rows[0]["IssuedOn"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture) + " to "
                        + (Convert.ToDateTime(dt.Rows[0]["ValidTill"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WDes.Text = "";

                }





                query = "select * from educationdetails where USERID=" + profileid + " and Type='Graduation'";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                if(dt.Rows.Count > 0)
                {
                    GradUniv.Text = " from " + dt.Rows[0]["University"].ToString();
                    GradSpec.Text = dt.Rows[0]["Specialization"].ToString();
                    GradGPA.Text = dt.Rows[0]["GPA"].ToString();
                    GradTime.Text = (Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture) + " to "
                        + (Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture);

                }




                query = "select * from educationdetails where USERID=" + profileid + " and Type='Under Grad'";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                if( dt.Rows.Count > 0)
                {
                    UGUniv.Text = " from " + dt.Rows[0]["University"].ToString();
                    UGSpec.Text = dt.Rows[0]["Specialization"].ToString();
                    UGGPA.Text = dt.Rows[0]["GPA"].ToString();
                    UGTime.Text = (Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture) + " to "
                        + (Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture);

                }





                query = "select * from educationdetails where USERID=" + profileid + " and Type='High School'";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                if(dt.Rows.Count > 0)
                {
                    HSUniv.Text = " from " + dt.Rows[0]["University"].ToString();
                    HSSpec.Text = dt.Rows[0]["Specialization"].ToString();
                    HSGPA.Text = dt.Rows[0]["GPA"].ToString();
                    HSTime.Text = (Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture) + " to "
                        + (Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString())).ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                }



            }
            catch (Exception ex)
            {

            }
        }


    }
}