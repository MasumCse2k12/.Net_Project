<%@ Page Language="C#" AutoEventWireup="true" CodeFile="links.aspx.cs" Inherits="links" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <%-- <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
         <asp:Xml ID="Xml1" runat="server"></asp:Xml>
         <asp:Timer ID="Timer1" runat="server"></asp:Timer> 
        <asp:LoginView ID="LoginView1" runat="server"></asp:LoginView> 
        <asp:ChangePassword ID="ChangePassword1" runat="server"></asp:ChangePassword>
        <asp:TreeView ID="TreeView1" runat="server"></asp:TreeView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource> 
        <asp:GridView ID="GridView1" runat="server"></asp:GridView> 
        <asp:FormView ID="FormView1" runat="server"></asp:FormView> 
        <asp:ImageMap ID="ImageMap1" runat="server"></asp:ImageMap>
        <asp:Table ID="Table1" runat="server"></asp:Table> 
        <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox> 
        <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
        <asp:ImageButton ID="ImageButton1" runat="server" />  --%>
        <asp:Image ID="Image1" runat="server" Height="40px" Width="50px" /> 
        <image src ="images/kuet.JPG" ></image>
    <div class="linksidebar" style="background: #CC525D;">
					<ul>
						<li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a style="color:#C7C03E; background: #8A0808;" href="index.html" target="showframe">User Info</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="Education.html" target ="showframe">Change Password</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="Contact.html" target ="showframe">Contact</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="input.aspx" target ="showframe">Registration</a></li>
					</ul>
				</div>

    </div>
    </form>
</body>
</html>
