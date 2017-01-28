using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            if (Session["UserID"] == null && Session["UserID"] != "1207002")
                Response.Redirect("MainPage.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("pragma", "no-cache");
            }
        }
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            dt.Columns.Add("date", typeof(string));
            foreach (string strFile in Directory.GetFiles(Server.MapPath("videos/")))
            {
                FileInfo fi = new FileInfo(strFile);
                dt.Rows.Add(fi.Name, fi.Length, GetFileTypeByExtension(fi.Extension), DateTime.Now);

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
       string s= FileUpload1.FileName;
    }

    protected void Upload_Videos_Click(object sender, EventArgs e)
    {
        //String uid = Session["UserID"].ToString();
        string path = Server.MapPath("videos/");
        //StringBuilder build = new StringBuilder();

        if (FileUpload1.HasFile)
        {
            // string catagory = build.ToString();
            FileUpload1.PostedFile.SaveAs(Server.MapPath("videos/") + FileUpload1.FileName);
            string ext = Path.GetExtension(FileUpload1.FileName);
            if (ext == ".mp3" || ext == ".flv" || ext == ".mkv" || ext == ".DAT" || ext ==".FLV")
            {
                // String imgurl = path + FileUpload1.FileName;
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                //string imgname = "~/images/" + FileUpload1.FileName;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString()))
                {
                    con.Open();
                    try
                    {

                        String cmdline = "INSERT INTO [VideoInfo] values('" + FileUpload1.FileName + "')";
                        SqlCommand command = new SqlCommand(cmdline, con);
                        if (command.ExecuteNonQuery() != 0)
                        {
                            //FileUpload1.SaveAs("~" + "\\Images\\" + FileUpload1.FileName);
                            Response.Redirect("StudentsPage.aspx");
                        }

                        {
                            ShowAlertMessage("User Exist !");
                            con.Close();
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
                imgformatLabel.Text = "Invalid_video_Format";

            }

        }
        else
        {
            imgformatLabel.Visible = true;
            imgformatLabel.Text = "Please_Select_VideoFile";

        }
        //save
        DataTable dt = new DataTable();


        dt.Columns.Add("File", typeof(string));
        dt.Columns.Add("Size", typeof(string));
        dt.Columns.Add("Type", typeof(string));
        dt.Columns.Add("date", typeof(string));
        foreach (string strFile in Directory.GetFiles(Server.MapPath("videos/")))
        {
            FileInfo fi = new FileInfo(strFile);
            dt.Rows.Add(fi.Name, fi.Length, GetFileTypeByExtension(fi.Extension), DateTime.Now);

        }
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    private string GetFileTypeByExtension(string extension)
    {
        switch (extension.ToLower())
        {
            case ".doc":
            case ".docx":
                return "Microsoft Word Document";
            case ".xlsx":
            case ".xls":
                return "Microsoft Excel Document";
            case ".jpg":
            case ".png":
                return "image";
            case ".exe":
                return "EXE";

            case ".ppt":
            case ".pptx":
                return "PPT";


            case ".mp3":

                return "MP3";

            case ".mp4":

                return "MP4";

            default:
                return "unknown";
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Download")
        {

            Response.Clear();
            Response.ContentType = "application/octect-stream";
            Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("videos/") + e.CommandArgument);
            Response.End();




        }




    }
    
    
   
    public void ShowAlertMessage(String message)
    {
        string alertScript = String.Format("<Script Language='javascript'> alert('{0}');</script>", message);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Key", alertScript, false);

    }
    protected void Upload_Photos_Click(object sender, EventArgs e)
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
                       
                          String cmdline = "INSERT INTO [ImageInfo] values('" + FileUpload1.FileName + "')";
                          SqlCommand  command = new SqlCommand(cmdline, con);
                            if (command.ExecuteNonQuery() != 0)
                            {
                                
                                Response.Redirect("Photos.aspx");
                               
                            }
                             else
                            {
                                ShowAlertMessage("User Exist !");
                                con.Close();
                            }
                       
                    }
                    catch
                    {
                        ShowAlertMessage("Exception Occured in AdminPage to insert images");
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

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        HttpCookie myCookie = new HttpCookie("Preferences");
        myCookie.Expires = DateTime.Now.AddSeconds(-60);
        Response.Cookies.Add(myCookie);
        Response.Redirect("MainPage.aspx");
    }

    protected void InsertStd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }


    protected void DeleteStd_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeleteUser.aspx");
    }


    protected void UpdateStd_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditUserInfo.aspx");
    }
}