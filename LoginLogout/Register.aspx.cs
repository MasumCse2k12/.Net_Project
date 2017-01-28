using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["masumdbConnectionString1"].ToString()))
        {
            con.Open();
            if (TextBox1.Text != "" && TextBox2.Text != "")
            {

                //String commandline = "INSERT INTO [USER] values('" + TextBox1.Text + "','" + TextBox2.Text + "')";
                String commandline = "INSERT INTO [USER] values('" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox2.Text + "')";
                SqlCommand command = new SqlCommand(commandline, con);
                //SqlCommand command = new SqlCommand("INSERT INTO HACK values('" + a + "','" + name.Text + "')", con);

                if (command.ExecuteNonQuery() != 0)
                {
                    Label3.Visible = true;
                    Label3.Text = "Your registration request is successfully sent.Please wait for verification";
                    Response.Redirect("LogIn.aspx");
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "user exist!";
                    con.Close();
                }
            }
        }
    }
}