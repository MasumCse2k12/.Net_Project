using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FileUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            dt.Columns.Add("date", typeof(string));
            foreach (string strFile in Directory.GetFiles(Server.MapPath("Data/")))
            {
                FileInfo fi = new FileInfo(strFile);
                dt.Rows.Add(fi.Name, fi.Length, GetFileTypeByExtension(fi.Extension), DateTime.Now);

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        string s = FileUpload1.FileName;
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

    protected void Upload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {

            FileUpload1.PostedFile.SaveAs(Server.MapPath("Data/") + FileUpload1.FileName);
        }
        DataTable dt = new DataTable();


        dt.Columns.Add("File", typeof(string));
        dt.Columns.Add("Size", typeof(string));
        dt.Columns.Add("Type", typeof(string));
        dt.Columns.Add("date", typeof(string));
        foreach (string strFile in Directory.GetFiles(Server.MapPath("Data/")))
        {
            FileInfo fi = new FileInfo(strFile);
            dt.Rows.Add(fi.Name, fi.Length, GetFileTypeByExtension(fi.Extension), DateTime.Now);

        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
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
            Response.TransmitFile(Server.MapPath("Data/") + e.CommandArgument);
            Response.End();




        }

    }
}