<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="Photos" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Photos</title>
     <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MainMenu">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="Heading">
            <div class="ImageLogo">
             <asp:Image ID="Image2" src="images/gallery/imagesScl.jpg" runat="server" />
            </div>
            <div class="SchoolName">
            Sammilani Maddhayamic Viddalaya Chalitatala.<br/>
              <font face="Siyam Rupali"> সম্মিলনী মাধ্যমিক বিদ্যালয়,চালিতাতলা </font>
            </div>
            
            <div class="Login_Info">
                Academic System Automation<br/>
                <p id="User_Id">User ID:
                   <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                 
                        </ContentTemplate>
                            </asp:UpdatePanel>--%>
                     <asp:TextBox id="txtUserId"  runat="server" OnTextChanged="roll_TextChanged" type="text" AutoPostBack="true" Width="133px" Height="18px"></asp:TextBox>
                </p>
                <p id="Password">PassWord:
                <asp:TextBox id="txtPassword" TextMode="password" runat="server" Width="133px" Height="18px"/>
                    </p>
                <p id="CheckBox">
                    <asp:CheckBox ID="RememberMeCheckBox" runat="server" Width="20px" Height="20px"/>
                     Remember Me?
                    </p>
                <p id="btnLogin">
                   
                    <asp:Button ID="LoginButton" Text="LOG IN" runat="server" onClick="btnSubmit_Click" Width="100px" Height="25px"/><br/>
                    <font color="#F6F6F6" size="4"><asp:Label runat="server"  name="chk_rol_no" id="chk_roll_no"></asp:Label></font>
                  <!-- <a href="#" style="color:#C7C03E">Forgot PassWord?</a><br/> -->
                    
                   
                    
                    </div>
            </div>
        <div class="mainmenu">
			<ul >
                
				<li><a href="MainPage.aspx">Home</a></li>
			   <li> <a href="#">Key Person</a>
                 <ul>
						<li> <a href="#">Chairman </a></li>					
					    <li><a href="#">Headmaster</a></li>
                        <li> <a href="#">Managing Committee</a></li>					
					    <li><a href="#">Teachers</a></li>
                         <li> <a href="#">Former Headmaster </a></li>					
					    <li><a href="#">Office Stuff</a></li>
				   </ul>
                </li>
			   <li><a href="#">About Us</a>
                   
                   <ul>
                      <li> <a href="#">Introduction </a></li>					
					    <li><a href="#">History</a></li>
                        <li> <a href="#">Mission and Vission</a></li>					
					    <li><a href="#">Future Plan</a></li>
                         <li> <a href="#">Donors </a></li>					
					    <li><a href="#">Founders</a></li>
                     </ul>
			   </li>
                <li> <a href="AdminLogin.aspx">ADMIN</a></li>
			   <li> <a href="#">Rules Regulation</a></li>
			   <li><a href="#">Studets Corner</a>
			     <ul>
                      <li> <a href="#">Students List </a></li>					
					    <li><a href="#">Ex-Reputed Students</a></li>
                        <li> <a href="#">Scholarships</a></li>					
					    <li><a href="#">Advise for Students</a></li>
                         
                     </ul>
			   </li>
			   
 				<li><a href="Registration.aspx">Registration</a></li>
                <li><a href="Photos.aspx">Photos</a></li>
                <li><a href="#" >Contact</a>
                    <ul>
                      <li> <a href="#">Introduction </a></li>					
					    <li><a href="#">History</a></li>
                        <li> <a href="#">Mission and Vission</a></li>					
					    <li><a href="#">Future Plan</a></li>
                         <li> <a href="#">Donors </a></li>					
					    <li><a href="#">Founders</a></li>
                     </ul>
                </li>
                <li><a href="Videos.aspx">Video Gallery</a></li>
			 </ul>
		</div>
   
        <div class="Marquee_Show">
            <div id="scroll1" style="width:950px;height:28px; font-size:16px; color:#FF0000;">

                <marquee onmouseover="javascript:this.stop();" onmouseout="javascript:this.start();" scrolldelay="12" behavior="scroll" direction="left" scrollamount="2">
                   <a class="fcclass"><span style="color:red;">:: Welcome to Sammilani Maddhayamic Viddalaya Chalitatla (SMVC)::</span>
                 </a>
               </marquee>

             </div>
            </div>
    <div class="MenuItem_Slider">
    
        <%
            for (int i = 0; i < count; i++)
            {
                Image1.ImageUrl = cnt[i];
                //Image1.Visible = true;
                
            
             %>
        &nbsp;
   <asp:image CssClass="userImage" BackColor="Fuchsia" BorderColor="Fuchsia"  ID="Image1"  Width="300px" Height="250px" runat="server" /> 
        &nbsp;
        
       <%
       }
      
        %>
    </div>
        </div>
    </form>
</body>
</html>
