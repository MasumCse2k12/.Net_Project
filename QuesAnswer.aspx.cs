using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuesAnswer : System.Web.UI.Page
{
    protected int count = 0;
    protected string[] user = new string[100];
    protected string[] QA = new string[100];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
                Response.Redirect("MainPage.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("pragma", "no-cache");
            }
        }
        String uid = Session["UserID"].ToString();
        //Response.Write(uid);
        ShowQuestionAnswer();
    }
    protected void QuesAnsButton_Click(object sender, EventArgs e)
    {
        String uid = Session["UserId"].ToString();
        String userName = SearchUserName(uid);
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();

            if ( TextBoxQuesAns.Text != "" )
            {

              
                    try
                    {
                        String commandline = "INSERT INTO [QuesAnswer] values('" + userName + "','" + TextBoxQuesAns.Text + "')";
                        SqlCommand command = new SqlCommand(commandline, con);
                        //SqlCommand command = new SqlCommand("INSERT INTO HACK values('" + a + "','" + name.Text + "')", con);

                        if (command.ExecuteNonQuery() != 0)
                        {
                            ShowAlertMessage("Your registration request is successfully sent.Please wait for verification");
                            Response.Redirect("QuesAnswer.aspx");
                        }
                        else
                        {
                            ShowAlertMessage("User Exist !");
                            con.Close();
                        }
                    }
                    catch (Exception exp)
                    {
                        ShowAlertMessage("Exception occured Registration Page");
                    }
            }
            else
            {
                ShowAlertMessage("Question or Answer can not empty!!!!!!!!");
            }

        }
    }
    public void ShowAlertMessage(String message)
    {
        string alertScript = String.Format("<Script Language='javascript'> alert('{0}');</script>", message);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Key", alertScript, false);

    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie myCookie = new HttpCookie("Preferences");
        myCookie.Expires = DateTime.Now.AddSeconds(-60);
        Response.Cookies.Add(myCookie);
        Response.Redirect("MainPage.aspx");
    }
    public String SearchUserName(String tmp)
    {
        Response.Write(tmp);
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            try
            {
                SqlCommand command = new SqlCommand("SELECT [name] from [StudentInfo]  where Id = " + "'" + tmp + "'", con);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    tmp = reader["name"].ToString();
                    con.Close();
                    reader.Close();
                }
                else
                {


                }
            }
            catch
            {
                ShowAlertMessage("Exeption to Search UserName");
            }
        }
       // Response.Write(tmp);
        return tmp ;

    }

    public void ShowQuestionAnswer()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            try
            {
                SqlCommand command = new SqlCommand("SELECT [UserName],[QuesAns] from [QuesAnswer] ", con);
                SqlDataReader reader = command.ExecuteReader();



                int i = 0;
                
                while (reader.Read())
                {
                   user[i]=reader["UserName"].ToString();
                    QA[i] = reader["QuesAns"].ToString();
                   
                    count++; 
                    i++;
                }
                con.Close();
                reader.Close();
            }
            catch
            {
                ShowAlertMessage("Exeption to set question Answer in StudentsPage Method");
            }

        }
    }
}