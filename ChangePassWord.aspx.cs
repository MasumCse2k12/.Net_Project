using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassWord : System.Web.UI.Page
{
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
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        String uid = Session["UserID"].ToString();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();

            if ( txtPassword.Text != "" && ConfirmPassword.Text !="")
            {

                try
                {
                    String commandline = "UPDATE StudentInfo SET  password='" + txtPassword.Text + "' where Id='" + uid + "'";
                    SqlCommand command = new SqlCommand(commandline, con);
                    //SqlCommand command = new SqlCommand("INSERT INTO HACK values('" + a + "','" + name.Text + "')", con);
                    if (txtPassword.Text != ConfirmPassword.Text)
                    {
                        
                    }
                    else
                    {
                        if (command.ExecuteNonQuery() != 0)
                        {
                            ShowAlertMessage("Your registration request is successfully sent.Please wait for verification");
                            Response.Redirect("MainPage.aspx");
                        }
                   
                    }
                }
                catch (Exception exp)
                {
                    ShowAlertMessage("Exception occured in Editpage while upadate checking");
                
                }
            }
            else
            {
                ShowAlertMessage("Please fill up all the blank TextBox");
          
            }

        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        //Session.Clear();
        HttpCookie myCookie = new HttpCookie("Preferences");
        myCookie.Expires = DateTime.Now.AddSeconds(-60);
        Response.Cookies.Add(myCookie);
        Response.Redirect("MainPage.aspx");
    }
    public void ShowAlertMessage(String message)
    {
        string alertScript = String.Format("<Script Language='javascript'> alert('{0}');</script>", message);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Key", alertScript, false);

    }
}