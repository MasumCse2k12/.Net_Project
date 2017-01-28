using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            if (TextBox1.Text != "" && TextBox2.Text != "")
            {
                String uid = TextBox1.Text;  //text box theke user id ta nilam abong uid te rakhlam
                SqlCommand comm = new SqlCommand("SELECT [username],[password] from [stdtable] where username = " + "'" + uid + "'", con); //select korlam databse theka ai userid te keu ase kina
                SqlDataReader reader = comm.ExecuteReader();
                reader.Read();

                try
                {
                    string password = reader["password"].ToString(); //query thka ja password ta pailam oita variable a rakhlam
                    string givenpass = TextBox2.Text.ToString();    //eita hoilo tumi je password ta dila
                    if (password == givenpass)
                    {
                        Response.RedirectPermanent("success.aspx");
                    }
                    else
                    {
                        //Response.RedirectPermanent("LogIn.aspx");
                        Label3.Text = "Invalid UserName or Password";
                    }

                }
                catch (Exception ex)
                {
                    Label3.Text = "exception";
                }
                con.Close();
            }
            else
            {
                Label3.Text = "please enter";
            }
        }
    }
}