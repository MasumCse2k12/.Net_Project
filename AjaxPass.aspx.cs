using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjaxPass : System.Web.UI.Page
{
    public static string[] name = new string[100];
    protected void Page_Load(object sender, EventArgs e)
    {
        
        name[0] = "masum";
        name[1] = "makil";
        name[2] = "mala";
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {


        var namelist = from tmp in name where tmp.ToLower().StartsWith(prefixText) select tmp;
        return namelist.ToArray();

    }
}