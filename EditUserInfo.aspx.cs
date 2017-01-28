using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditUserInfo : System.Web.UI.Page
{

    public static int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        passcheck.Visible = false;

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

        if (flag ==0)
        {
            String uid = Session["UserID"].ToString();
            EditUserInformation(uid);
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

    protected void roll_TextChanged(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();

        string temp;

        SqlCommand comm = new SqlCommand("SELECT [Id] FROM [StudentInfo]", conn);
        SqlDataReader reader = comm.ExecuteReader();

        while (reader.Read())
        {
            temp = (reader["Id"].ToString());

            if (temp == (txtuserid.Text.ToString()))
            {
                chk_roll_no.Visible = true;
                chk_roll_no.Text = "User already exist...";
                //Response.RedirectPermanent("Registration.aspx");
                break;
            }
            else
                chk_roll_no.Visible = true;
            chk_roll_no.Text = "UserId is available";

            temp = "";
        }
        //roll.Text = "";
        temp = "";
        reader.Close();
        conn.Close();
    }

    protected void update_Click(object sender, EventArgs e)
    {
        String uid = Session["UserID"].ToString();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();

            if (thana.Text != "" && txtPassword.Text !="" && f_name.Text != "" && village.Text != "")
            {
                
                    try
                    {
                        String commandline = "UPDATE StudentInfo SET class='" + DropDownList_CLASS.Text + "', session='" + DropDownList_session.Text + "',name='" + Name.Text + "',father_name='" + f_name.Text + "',gender='" + sex_list.Text + "',village='" + village.Text + "', thana='" + thana.Text + "' , mobile_number='" + mobile_no.Text + "',email='" + txtEmail.Text + "', password='" + txtPassword.Text + "' where Id='" + uid + "'";
                        SqlCommand command = new SqlCommand(commandline, con);
                        //SqlCommand command = new SqlCommand("INSERT INTO HACK values('" + a + "','" + name.Text + "')", con);
                        if (txtPassword.Text != ConfirmPassword.Text)
                        {
                            passcheck.Visible = true;
                        }
                        else
                        {
                            if (command.ExecuteNonQuery() != 0)
                            {
                                ShowAlertMessage("Your registration request is successfully sent.Please wait for verification");
                                Response.Redirect("MainPage.aspx");
                            }
                            flag = 0;
                        } 
                    }
                    catch (Exception exp)
                    {
                        ShowAlertMessage("Exception occured in Editpage while upadate checking");
                        flag = 0;
                    }
            }
            else
            {
                ShowAlertMessage("Please fill up all the blank TextBox");
                flag = 0;
            }

        }
    }
    public void ShowAlertMessage(String message)
    {
        string alertScript = String.Format("<Script Language='javascript'> alert('{0}');</script>", message);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Key", alertScript, false);

    }



    public void EditUserInformation( String uid)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            try
            {
                SqlCommand comm = new SqlCommand("SELECT [Id],[class],[Group],[session],[name],[gender],[father_name],[village],[thana],[mobile_number],[email] from [StudentInfo] where Id = " + "'" + uid + "'", con); //select korlam databse theka ai userid te keu ase kina
                //comm.Connection = con;
                SqlDataReader reader = comm.ExecuteReader();
                if (reader.Read())
                {


                    // String id = reader["Id"].ToString();
                    String name = reader["name"].ToString();
                    Name.Text = reader["name"].ToString();
                    f_name.Text = reader["father_name"].ToString();
                    village.Text = reader["village"].ToString();
                    txtuserid.Text = reader["Id"].ToString();
                    sex_list.Text = reader["gender"].ToString();

                    DropDownList_CLASS.Text = reader["class"].ToString();
                    DropDownList_grp.Text = reader["Group"].ToString();

                    thana.Text = reader["thana"].ToString();
                    DropDownList_session.Text = reader["session"].ToString();
                    txtEmail.Text = reader["email"].ToString();
                    mobile_no.Text = reader["mobile_number"].ToString();
                }
            }
            catch (Exception exp)
            {
                ShowAlertMessage("Exception occured Edit Page in Page Method");
            }


        }
        flag = 99999;
    }
}