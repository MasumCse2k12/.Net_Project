using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    static string[] name = new string[10];
    //protected static vector<String>name;
    protected void Page_Load(object sender, EventArgs e)
    {
       // passcheck.Visible = false;

        int i = 0;
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            SqlCommand comm = new SqlCommand("SELECT [name] FROM [StudentInfo]", con);
            SqlDataReader reader = comm.ExecuteReader();

            while (reader.Read())
            {
                name[i] = reader["name"].ToString();
                
                //Response.Write(name[i]);
                i++;
            }

        }
        
        
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {


        var namelist = from tmp in name where tmp.ToLower().StartsWith(prefixText) select tmp;
        return namelist.ToArray();

    }
     protected void submit_Click(object sender, EventArgs e)
     {
         //Response.Redirect("MainPage.aspx");
         
             using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
             {
                 con.Open();

                 if (thana.Text != "" && f_name.Text != "" && village.Text != "")
                 {

                     if (txtPassword.Text != ConfirmPassword.Text)
                     {
                         // passcheck.Visible = true;
                     }
                     else
                         try
                         {
                             String commandline = "INSERT INTO [StudentInfo] values('" + txtuserid.Text + "','" + DropDownList_CLASS.Text + "','" + DropDownList_grp.Text + "','" + DropDownList_session.Text + "','" + txtName.Text + "','" + sex_list.Text + "','" + f_name.Text + "','" + village.Text + "', '" + thana.Text + "' ,'" + mobile_no.Text + "','" + txtEmail.Text + "', '" + txtPassword.Text + "')";
                             SqlCommand command = new SqlCommand(commandline, con);
                             //SqlCommand command = new SqlCommand("INSERT INTO HACK values('" + a + "','" + name.Text + "')", con);

                             if (command.ExecuteNonQuery() != 0)
                             {
                                 ShowAlertMessage("Your registration request is successfully sent.Please wait for verification");
                                 Response.Redirect("MainPage.aspx");
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
                     ShowAlertMessage("Please fill up all the blank TextBox");
                 }

             }
         

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
    public void ShowAlertMessage(String message)
    {
        string alertScript = String.Format("<Script Language='javascript'> alert('{0}');</script>", message);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Key", alertScript, false);

    }

}