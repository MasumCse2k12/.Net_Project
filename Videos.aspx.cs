using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Web.UI.HtmlControls.HtmlVideo;
public partial class Videos : System.Web.UI.Page
{
   public  int count;
   protected string [] cnt = new string[100]; 
    protected void Page_Load(object sender, EventArgs e)
    {
        imgformatLabel.Visible = false;
        Video_Sourc.Attributes.Add("src", "Music of Jannah {English Subtitles}.mp4");
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            try
            {
                SqlCommand command = new SqlCommand("SELECT [videoType] from [VideoInfo] ", con);
                SqlDataReader reader = command.ExecuteReader();
                int i = 0;

                while (reader.Read())
                {
                    String imname = reader["videoType"].ToString();
                    //Image1.ImageUrl = "images/" + imname;
                    cnt[i] = "videos/" + imname;
                    //Image1.Visible = true;
                    // Response.Write( ++i + "     " +imname + "   ");
                    // Image1.Visible = false;
                    count++; i++;
                }
                con.Close();
                reader.Close();
            }
            catch
            {
                ShowAlertMessage("Exeption to set image in StudentsPage Method");
            }

        }
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            if (txtUserId.Text != "" && txtPassword.Text != "")
            {
                String uid = txtUserId.Text;  //text box theke user id ta nilam abong uid te rakhlam
                SqlCommand comm = new SqlCommand("SELECT [Id],[password] from [StudentInfo] where Id = " + "'" + uid + "'", con); //select korlam databse theka ai userid te keu ase kina
                //comm.Connection = con;
                SqlDataReader reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    try
                    {
                        String id = reader["Id"].ToString();
                        String password = reader["password"].ToString(); //query thka ja password ta pailam oita variable a rakhlam
                        String givenpass = txtPassword.Text.ToString();    //eita hoilo tumi je password ta dila
                        if (password == givenpass && id == uid)
                        {

                            if (RememberMeCheckBox.Checked)
                            {
                                HttpCookie MyCookie = Request.Cookies["Preferences"];
                                if (MyCookie == null)
                                {
                                    MyCookie = new HttpCookie("Preferences");
                                    // MyCookie["roll"] = txtUserId.Text;
                                    //MyCookie["password"] = txtPassword.Text;
                                    MyCookie.Expires = DateTime.Now.AddSeconds(60);
                                    Response.Cookies.Add(MyCookie);
                                }
                            }


                            // Session["User"] = "logged in";
                            Session["UserID"] = txtUserId.Text.ToString(); //i store roll here to pass it to UserMainPage
                            // Session["password"] = txtPassword.Text;

                            Response.Redirect("StudentsPage.aspx");
                        }
                        else
                        {
                            ShowAlertMessage("Invalid UserName or Password");
                            //Response.Redirect("MainPage.aspx");
                        }
                    }
                    catch (Exception excp)
                    {
                        ShowAlertMessage("Excception occured!!!!!!!!");
                    }
                }

            }
            else
            {
                ShowAlertMessage("Please Enter userName and Password");
                // Response.Redirect("MainPage.aspx");
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //String uid = Session["UserID"].ToString();
        string path = Server.MapPath("videos/");
        //StringBuilder build = new StringBuilder();

        if (FileUpload1.HasFile)
        {
            // string catagory = build.ToString();

            string ext = Path.GetExtension(FileUpload1.FileName);
            if (ext == ".mp4" || ext == ".flv" || ext == ".mkv" || ext == ".DAT" || ext==".3gp")
            {
                // String imgurl = path + FileUpload1.FileName;
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                //string imgname = "~/images/" + FileUpload1.FileName;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
                {
                    con.Open();
                

                        String cmdline = "INSERT INTO [VideoInfo] values('" + FileUpload1.FileName + "')";
                        SqlCommand command = new SqlCommand(cmdline, con);
                        if (command.ExecuteNonQuery() != 0)
                        {
                            //FileUpload1.SaveAs("~" + "\\Images\\" + FileUpload1.FileName);
                            Response.Redirect("Videos.aspx");
                        }
                        else 
                        {
                            ShowAlertMessage("User Exist !");
                            con.Close();
                        }
                  
                    /*catch
                    {
                        ShowAlertMessage("Exception Occured in File Uploading");
                  }  */





                }

            }

            else
            {
                imgformatLabel.Visible = true;
                imgformatLabel.Text = "Invalid_video_Format";

            }

        }
        else
        {
            imgformatLabel.Visible = true;
            imgformatLabel.Text = "Please_Select_VideoFile";

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
}