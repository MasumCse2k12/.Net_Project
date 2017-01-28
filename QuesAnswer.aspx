<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuesAnswer.aspx.cs" Inherits="QuesAnswer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Question Answer</title>
    <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <div class="Heading">
            <div class="ImageLogo">
             <asp:Image ID="Image1" src="images/gallery/imagesScl.jpg" runat="server" />
            </div>
            <div class="SchoolName">
            Sammilani Maddhayamic Viddalaya Chalitatala.<br/>
              <font face="Siyam Rupali"> সম্মিলনী মাধ্যমিক বিদ্যালয়,চালিতাতলা </font>
            </div>
            <div class="Login_Info">
                Academic System Automation<br/>
                <p id="User_Id">
               <asp:Button id="logout" Text="LOG OUT" runat="server" Width="120px" Height="30px" OnClick="logout_Click"></asp:Button>
                </p>
                
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
                 </a></marquee>

             </div>
            </div>
        <div class="MenuItem_Slider">
              <div class="Margin_left"></div>
                <div class="Margin_right"></div>
               <div class="Margin_center"></div> 
               
           </div> 
        <div class="Registration_Form">
            <%
            for (int i = 0; i < count; i++)
            {
                stdName.Text = user[i];
               UQA.Text = QA[i];
                //Image1.Visible = true;
                
            
             %>
       
      <font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="stdName"/></font><br />
   <asp:Label runat="server" ID="UQA"/>
            <br /><br />
        
        
       <%
       }
      
        %>
           <h1 style="color:red; margin-bottom:0px;"> Ask Question or Reply Answer:</h1>
          <asp:TextBox ID="TextBoxQuesAns" runat="server" Height="40px" MaxLength="500" Width="500px"></asp:TextBox><br />
            <asp:Button ID="QuesAnsButton" runat="server" OnClick="QuesAnsButton_Click" Text="Submit" BackColor="#FFFF66" Height="30px" Width="100px" />
        </div>
        
    </div>
    </form>
</body>
</html>
