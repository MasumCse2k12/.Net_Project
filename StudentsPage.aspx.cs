using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
public partial class StudentsPage : System.Web.UI.Page
{
    public bool imageflag;
    protected string imname;
    protected void Page_Load(object sender, EventArgs e)
    {
        imgformatLabel.Visible = false;
        imgformatLabel.Text = "";
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
                Response.Redirect("MainPage.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control","no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("pragma","no-cache");
            }
        }
        String uid = Session["UserID"].ToString();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
        {
            con.Open();
            try
            {
                SqlCommand command = new SqlCommand("SELECT [imagename] from [StdImageInfo]  where Id = " + "'" + uid + "'", con);
                SqlDataReader reader = command.ExecuteReader();




                imageflag = reader.Read();
                if (imageflag == true)
                {
                    imname = reader["imagename"].ToString();
                    Image1.ImageUrl = "images/" + imname;
                    Image1.Visible = true;
                    con.Close();
                    reader.Close();
                }
                else
                {


                }
            }
            catch
            {
                ShowAlertMessage("Exeption to set image in StudentsPage Method");
            }
        }
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
                String name = reader["Id"].ToString();
                 stdName.Text= reader["name"].ToString();
                 father_name.Text = reader["father_name"].ToString();
                 village.Text = reader["village"].ToString();
                 roll.Text = reader["Id"].ToString();
                 Gender.Text = reader["gender"].ToString();
              
                 Year.Text = reader["class"].ToString();
                 group.Text = reader["Group"].ToString();
                 
                 Thana.Text = reader["thana"].ToString();
                 session.Text = reader["session"].ToString();
                 Email.Text = reader["email"].ToString();
                mobile.Text = reader["mobile_number"].ToString();
                con.Close();
                reader.Close();
            }
            
         } catch (Exception exp)
                    {
                        ShowAlertMessage("Exception occured in StudentsPage in Page Method");
                    }
            

        }

       
        /*HttpCookie MyCookie = Request.Cookies["UserInfo"];
        if (!IsPostBack)
        {
            if (MyCookie != null)
            {
                Response.Redirect("StudentsPage.aspx");
            }
        
            //if(Session["User"] == null)
               // Response.Redirect("MainPage.aspx");
        else
        {
            //Response.ClearHeaders(); 
                Response.Redirect("MainPage.aspx");
        }

        }*/
                
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie myCookie = new HttpCookie("Preferences");
        myCookie.Expires = DateTime.Now.AddSeconds(-60);
        Response.Cookies.Add(myCookie);
        Response.Redirect("MainPage.aspx");
    }

    protected void UserInfo(object sender, EventArgs e)
    {

    }
    public void ShowAlertMessage(String message)
    {
        string alertScript = String.Format("<Script Language='javascript'> alert('{0}');</script>", message);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Key", alertScript, false);

    }
    protected void ChangeProfile(object sender, EventArgs e)
    {
        String uid = Session["UserID"].ToString();
        string path = Server.MapPath("images/");
        //StringBuilder build = new StringBuilder();

        if (FileUpload1.HasFile)
        {
           // string catagory = build.ToString();

            string ext = Path.GetExtension(FileUpload1.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".JPG" || ext == ".JPEG")
            {
               // String imgurl = path + FileUpload1.FileName;
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                 //string imgname = "~/images/" + FileUpload1.FileName;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
                {
                    con.Open();
                    try
                    {
                        SqlCommand command = new SqlCommand("SELECT [Id],[password] from [StudentInfo] where Id = " + "'" + uid + "'", con); //select korlam databse theka ai userid te keu ase kina
                        //comm.Connection = con;
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            String id = reader["Id"].ToString();
                            // String pass = reader["password"].ToString();
                            //Year.Text = reader["Id"].ToString();
                           // group.Text = path + FileUpload1.FileName;
                            // comm.Dispose;
                            con.Close();
                            reader.Close();
                            con.Open();
                            //Thana.Text = FileUpload1.FileName;
                            String cmdline = "INSERT INTO [StdImageInfo] values('" + id + "','" + FileUpload1.FileName + "')";
                            command = new SqlCommand(cmdline, con);
                            if (command.ExecuteNonQuery() != 0)
                            {
                                //FileUpload1.SaveAs("~" + "\\Images\\" + FileUpload1.FileName);
                                con.Close();
                                reader.Close();
                                con.Open();
                                 command = new SqlCommand("SELECT [imagename] from [StdImageInfo]  where Id = " + "'" + uid + "'", con);
                                 reader = command.ExecuteReader();




                                imageflag = reader.Read();
                                if (imageflag == true)
                                {
                                    imname = reader["imagename"].ToString();
                                    Image1.ImageUrl = "images/" + imname;
                                    Image1.Visible = true;
                                    con.Close();
                                    reader.Close();
                                    Response.Redirect("StudentsPage.aspx");
                                }
                                else
                                {

                                    Response.Redirect("StudentsPage.aspx");
                                }
                               // Image1.ImageUrl = "Images/" + FileUpload1.FileName;
                                //Image1.Visible = true;
                                //con.Close();
                               // reader.Close();
                               // Response.Redirect("StudentsPage.aspx");
                            }
                            // else
                            {
                                ShowAlertMessage("User Exist !");
                                con.Close();
                            }
                        }
                    }
                    catch
                    {
                        ShowAlertMessage("Exception Occured in StudentsPage in Change Profile Method");
                    }





                }

            }

            else
            {
                imgformatLabel.Visible = true;
                imgformatLabel.Text = "Invalid_Image_Format";
               
            }

        }
        else
        {
            imgformatLabel.Visible = true;
            imgformatLabel.Text = "Please_Select_Image";
            
        }
    }




    protected void ShowChangedImg(object sender, EventArgs e)
    {
        String uid = Session["UserID"].ToString();
        string path = Server.MapPath("images/");
        //StringBuilder build = new StringBuilder();

        if (FileUpload1.HasFile)
        {
            // string catagory = build.ToString();

            string ext = Path.GetExtension(FileUpload1.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".JPG" || ext == ".JPEG")
            {
                // String imgurl = path + FileUpload1.FileName;
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
                {
                    con.Open();
                    try
                    {
                        SqlCommand command = new SqlCommand("SELECT [Id],[password] from [StudentInfo] where Id = " + "'" + uid + "'", con); //select korlam databse theka ai userid te keu ase kina
                        //comm.Connection = con;
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            con.Close();
                            reader.Close();
                            con.Open();
                            String commandline = "UPDATE StdImageInfo SET imagename='" + FileUpload1.FileName + "' where Id='" + uid + "'";
                            command = new SqlCommand(commandline, con);
                            //reader = command.ExecuteReader();

                            if (command.ExecuteNonQuery() != 0)
                            {
                                //FileUpload1.SaveAs("~" + "\\Images\\" + FileUpload1.FileName);
                                con.Close();
                                reader.Close();
                                con.Open();
                                command = new SqlCommand("SELECT [imagename] from [StdImageInfo]  where Id = " + "'" + uid + "'", con);
                                reader = command.ExecuteReader();




                                imageflag = reader.Read();
                                if (imageflag == true)
                                {
                                    imname = reader["imagename"].ToString();
                                    Image1.ImageUrl = "images/" + imname;
                                    Image1.Visible = true;
                                    con.Close();
                                    reader.Close();
                                    Response.Redirect("StudentsPage.aspx");
                                }
                                else
                                {

                                    Response.Redirect("StudentsPage.aspx");
                                }
                                // Image1.ImageUrl = "Images/" + FileUpload1.FileName;
                                //Image1.Visible = true;
                                //con.Close();
                                // reader.Close();
                                // Response.Redirect("StudentsPage.aspx");
                            }
                        }
                    }

                    catch
                    {
                        ShowAlertMessage("Exeption to Update image in StudentsPage Method");
                    }
                }
            }
            else
            {
                imgformatLabel.Visible = true;
                imgformatLabel.Text = "Invalid_Image_Format";

            }
        }
        else
        {
            imgformatLabel.Visible = true;
            imgformatLabel.Text = "Please_Select_Image";

        }
    }
        
}