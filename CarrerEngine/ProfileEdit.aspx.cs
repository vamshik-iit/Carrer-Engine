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
    public partial class ProfileEdit : System.Web.UI.Page
    {
        Database dc = new Database();
        DataSet dt1;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {
                        //This method calling is used to fetch all the user records such as bio, address, work exp
                        //education , certifcation and bind it the fron end form
                        LoadInitialData();
                    }
                }


            }
            catch (Exception ex)
            {

            }

        }

        //This method calling is used to fetch all the user records such as bio, address, work exp
        //education , certifcation and bind it the fron end form
        protected void LoadInitialData()
        {
            try
            {
                Name.Text = Session["FirstName"].ToString() + " " + Session["LastName"].ToString();
                Email.Text = Session["Email"].ToString();

                string query = "";
                query = "select * from Users where USERID=" + Session["USERID"].ToString() + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                FName.Text = dt.Rows[0]["FirstName"].ToString();
                LName.Text = dt.Rows[0]["LastName"].ToString();


                query = "select * from UserAddress where USERID=" + Session["USERID"].ToString() + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                Mobile.Text = dt.Rows[0]["Mobile"].ToString();
                Street.Text = dt.Rows[0]["Street"].ToString();
                City.Text = dt.Rows[0]["City"].ToString();
                country.Text = dt.Rows[0]["country"].ToString();
                State.Text = dt.Rows[0]["State"].ToString();
                Zipcode.Text = dt.Rows[0]["Zipcode"].ToString();


                query = "select * from UserSkills where USERID=" + Session["USERID"].ToString() + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                PS.Text = dt.Rows[0]["PrimarySkill"].ToString();
                SS.Text = dt.Rows[0]["SecondarySkill"].ToString();
                OS.Text = dt.Rows[0]["OtherSkills"].ToString();


                DateTime temp;
                string s;

                query = "select * from WorkExperience where USERID=" + Session["USERID"].ToString() + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                if(dt.Rows.Count > 0)
                {
                    Company.Text = dt.Rows[0]["CompanyName"].ToString();
                    Role.Text = dt.Rows[0]["Role"].ToString();
                    temp = Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString());
                    s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WFrom.Text = s.ToString();
                    temp = Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString());
                    s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WTo.Text = s.ToString();

                }

                if (dt.Rows.Count > 1)
                {
                    Company2.Text = dt.Rows[1]["CompanyName"].ToString();
                    Role2.Text = dt.Rows[1]["Role"].ToString();
                    temp = Convert.ToDateTime(dt.Rows[1]["FromDate"].ToString());
                    s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WFrom2.Text = s.ToString();
                    temp = Convert.ToDateTime(dt.Rows[1]["ToDate"].ToString());
                    s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    WTo2.Text = s.ToString();

                }



                query = "select * from educationdetails where USERID=" + Session["USERID"].ToString() + " and Type='Graduation'";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                GradUniv.Text = dt.Rows[0]["University"].ToString();
                GradSpec.Text = dt.Rows[0]["Specialization"].ToString();
                GradGpa.Text = dt.Rows[0]["GPA"].ToString();
                temp = Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString());
                s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                GradFrom.Text = s.ToString();
                temp = Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString());
                s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                GradTo.Text = s.ToString();




                query = "select * from educationdetails where USERID=" + Session["USERID"].ToString() + " and Type='Under Grad'";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                UGUniv.Text = dt.Rows[0]["University"].ToString();
                UGSpec.Text = dt.Rows[0]["Specialization"].ToString();
                UGGPA.Text = dt.Rows[0]["GPA"].ToString();
                temp = Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString());
                s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                UGFrom.Text = s.ToString();
                temp = Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString());
                s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                UGTo.Text = s.ToString();



                query = "select * from educationdetails where USERID=" + Session["USERID"].ToString() + " and Type='High School'";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                HSUniv.Text = dt.Rows[0]["University"].ToString();
                HSSpec.Text = dt.Rows[0]["Specialization"].ToString();
                HSGPA.Text = dt.Rows[0]["GPA"].ToString();
                temp = Convert.ToDateTime(dt.Rows[0]["FromDate"].ToString());
                s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                HSFrom.Text = s.ToString();
                temp = Convert.ToDateTime(dt.Rows[0]["ToDate"].ToString());
                s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                HSTo.Text = s.ToString();



                query = "select * from Certifications where USERID=" + Session["USERID"].ToString() + "";
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    IssuedBy.Text = dt.Rows[0]["IssuedBy"].ToString();
                    CertDesc.Text = dt.Rows[0]["CertDesc"].ToString();
                    CertName.Text = dt.Rows[0]["Name"].ToString();
                    temp = Convert.ToDateTime(dt.Rows[0]["IssuedOn"].ToString());
                    s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    CertIssued.Text = s.ToString();
                    temp = Convert.ToDateTime(dt.Rows[0]["ValidTill"].ToString());
                    s = temp.ToString("yyyy-M-dd", CultureInfo.InvariantCulture);
                    CertValid.Text = s.ToString();

                }




            }
            catch (Exception ex)
            {

            }
        }

        //This is the button click method which is called when user has filled all the information and want to
        //update this online resume which updated back to the database
        protected void SaveProfile_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "";

                //name
                if (!string.IsNullOrEmpty(FName.Text) && !string.IsNullOrEmpty(LName.Text))
                {
                    query = "update Users set FirstName='" + FName.Text + "',LastName='" + LName.Text + "' where UserID= " + Session["USERID"].ToString() + "";
                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the data and try again')", true);
                        return;

                    }
                }

                //Address
                if (!string.IsNullOrEmpty(Mobile.Text) && !string.IsNullOrEmpty(Street.Text) && !string.IsNullOrEmpty(Street.Text)
                    && !string.IsNullOrEmpty(City.Text)
                    && !string.IsNullOrEmpty(country.Text)
                    && !string.IsNullOrEmpty(State.Text)
                    && !string.IsNullOrEmpty(Zipcode.Text)
                    )
                {
                    query = "select * from UserAddress where USERID=" + Session["USERID"].ToString() + "";
                    dt1=dc.ReadData(query);
                    dt=dt1.Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        query = "update UserAddress set Street='" + Street.Text + "',City='" + City.Text + "',State='" + State.Text + "',Country='" + country.Text + "',ZipCode=" + Zipcode.Text + ",Mobile=" + Mobile.Text + "  where " +
                            "USERID=" + Session["USERID"].ToString() + "";
                    }
                    else
                    {
                        query = "insert into UserAddress(Street,City,State,Country,ZipCode,Mobile,USERID) " +
                            "values('" + Street.Text + "','" + City.Text + "','" + State.Text + "','" + country.Text + "'," + Zipcode.Text + "," + Mobile.Text + "," + Session["USERID"].ToString() + ")";
                    }
                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the address data and try again')", true);
                        return;

                    }
                }

                //About ME
                string aboutme = aboutus.Text;
                if (!string.IsNullOrEmpty(aboutme))
                {

                    query = "update Users set AboutMe='" + aboutme + "' WHERE USERID=" + Session["USERID"].ToString() + "";
                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the address data and try again')", true);
                        return;

                    }
                }

                //Skills
                if (!string.IsNullOrEmpty(PS.Text) && !string.IsNullOrEmpty(SS.Text) && !string.IsNullOrEmpty(OS.Text))
                {
                    query = "delete from UserSkills where USERID=" + Session["USERID"].ToString() + "";
                    dc.Insert(query);

                    query = "insert into UserSkills(PrimarySkill,SecondarySkill,OtherSkills,UpdatedOn,USERID) " +
                            "values('" + PS.Text + "','" + SS.Text + "','" + OS.Text + "',getdate()," + Session["USERID"].ToString() + ")";
                    
                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the skill set data and try again')", true);
                        return;

                    }
                }




                //Work
                if (!string.IsNullOrEmpty(Company.Text) && !string.IsNullOrEmpty(Role.Text) && !string.IsNullOrEmpty(WFrom.Text)
                    && !string.IsNullOrEmpty(WTo.Text)
                 
                    )
                {
                    query = "delete from WorkExperience where USERID=" + Session["USERID"].ToString() + "";
                    dc.Insert(query);

                    query = "insert into WorkExperience(Role,CompanyName,FromDate,ToDate,USERID,IsCurrentWorking) " +
                            "values('" + Role.Text + "','" + Company.Text + "','" + WFrom.Text + "','" + WTo.Text + "'," + Session["USERID"].ToString() + ",1)";

                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the work data and try again')", true);
                        return;

                    }

                    query = "insert into WorkExperience(Role,CompanyName,FromDate,ToDate,USERID,IsCurrentWorking) " +
                            "values('" + Role2.Text + "','" + Company2.Text + "','" + WFrom2.Text + "','" + WTo2.Text + "'," + Session["USERID"].ToString() + ",0)";

                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the work data and try again')", true);
                        return;

                    }


                }


                //Cert
                if (!string.IsNullOrEmpty(CertName.Text) && !string.IsNullOrEmpty(IssuedBy.Text) && !string.IsNullOrEmpty(CertDesc.Text)
                    && !string.IsNullOrEmpty(CertIssued.Text))
                {
                    query = "delete from Certifications where USERID=" + Session["USERID"].ToString() + "";
                    dc.Insert(query);

                    query = "insert into Certifications(Name,IssuedBy,IssuedOn,ValidTill,CertDesc,UserID) " +
                        "values('" + CertName.Text + "','" + IssuedBy.Text + "'," + "'"+ CertIssued.Text+"'" + "," + "'" +CertValid.Text +"'"+",'" + CertDesc.Text + "'," + Session["USERID"].ToString() + ") ";

                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the work data and try again')", true);
                        return;

                    }

                }

                //Grad
                if (!string.IsNullOrEmpty(GradUniv.Text) && !string.IsNullOrEmpty(GradSpec.Text) && !string.IsNullOrEmpty(GradGpa.Text)
                    && !string.IsNullOrEmpty(GradFrom.Text) && !string.IsNullOrEmpty(GradTo.Text)

                    )
                {
                    query = "delete from EducationDetails where USERID=" + Session["USERID"].ToString() + " and Type='Graduation'";
                    dc.Insert(query);

                    query = "insert into EducationDetails(University,Specialization,GPA,FromDate,ToDate,USERID,Type) " +
                            "values('" + GradUniv.Text + "','" + GradSpec.Text + "','" + GradGpa.Text + "','" + GradFrom.Text + "','" + GradTo.Text + "'," + Session["USERID"].ToString() + ",'Graduation')";

                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the graduation data and try again')", true);
                        return;

                    }
                }


                //UG
                if (!string.IsNullOrEmpty(UGUniv.Text) && !string.IsNullOrEmpty(UGSpec.Text) && !string.IsNullOrEmpty(UGGPA.Text)
                    && !string.IsNullOrEmpty(UGFrom.Text) && !string.IsNullOrEmpty(UGTo.Text)

                    )
                {
                    query = "delete from EducationDetails where USERID=" + Session["USERID"].ToString() + " and Type='Under Grad'";
                    dc.Insert(query);

                    query = "insert into EducationDetails(University,Specialization,GPA,FromDate,ToDate,USERID,Type) " +
                            "values('" + UGUniv.Text + "','" + UGSpec.Text + "','" + UGGPA.Text + "','" + UGFrom.Text + "','" + UGTo.Text + "'," + Session["USERID"].ToString() + ",'Under Grad')";

                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the Under Grad data and try again')", true);
                        return;

                    }
                }


                //HS
                if (!string.IsNullOrEmpty(HSUniv.Text) && !string.IsNullOrEmpty(HSSpec.Text) && !string.IsNullOrEmpty(HSGPA.Text)
                    && !string.IsNullOrEmpty(HSFrom.Text) && !string.IsNullOrEmpty(HSTo.Text))
                {
                    query = "delete from EducationDetails where USERID=" + Session["USERID"].ToString() + " and Type='HSuation'";
                    dc.Insert(query);

                    query = "insert into EducationDetails(University,Specialization,GPA,FromDate,ToDate,USERID,Type) " +
                            "values('" + HSUniv.Text + "','" + HSSpec.Text + "','" + HSGPA.Text + "','" + HSFrom.Text + "','" + HSTo.Text + "'," + Session["USERID"].ToString() + ",'High School')";

                    if (!dc.Insert(query))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please check the High school data and try again')", true);
                        return;

                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}