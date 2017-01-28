using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteUser : System.Web.UI.Page
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

            if (temp == (txtUserId.Text.ToString()))
            {
                chk_roll_no.Visible = true;
                chk_roll_no.Text = "Created Acounted";
                //Response.RedirectPermanent("Registration.aspx");
                break;
            }
            else
                chk_roll_no.Visible = true;
            chk_roll_no.Text = "Account isn't created ";

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
   

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            if (txtUserId.Text != "" )
            {
                String uid = txtUserId.Text;  //text box theke user id ta nilam abong uid te rakhlam
                SqlCommand comm = new SqlCommand("SELECT [Id] from [StudentInfo] where Id = " + "'" + uid + "'", con); //select korlam databse theka ai userid te keu ase kina
                //comm.Connection = con;
                SqlDataReader reader = comm.ExecuteReader();
                if (reader.Read())
                {
                   
                        String id = reader["Id"].ToString();
                        if ( id == uid)
                        {
                            con.Close();
                            reader.Close();
                            con.Open();
                            comm = new SqlCommand("DELETE FROM [StudentInfo] WHERE Id = "+" '" + uid + "'",con);
                            
                            if ( comm.ExecuteNonQuery() !=0)
                            {
                                ShowAlertMessage("Deleted User Successfully !!!!!!");
                                //Response.Redirect("DeleteUser.aspx");
                            }
                            else
                            {
                                ShowAlertMessage("Failed to delete !!!!!!");
                            }
                        }
                       
                   
                }
                else
                {
                    ShowAlertMessage("Invalid User Id");
                    //Response.Redirect("MainPage.aspx");
                }

            }
            else
            {
                ShowAlertMessage("Please Enter User Id");
                // Response.Redirect("MainPage.aspx");
            }
        }
    }
    
}