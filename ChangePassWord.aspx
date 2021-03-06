﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassWord.aspx.cs" Inherits="ChangePassWord" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style14 {
            width: 127px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
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
         <div class="Registration_Form" style="background:#C7C03E">
        <div class="linksidebar" style="background: #CC525D;">
					<ul>
						<li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="StudentsPage.aspx" style="color:#C7C03E; background: #8A0808;">User Info</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="ChangePassWord.aspx" >Change Password</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="EditUserInfo.aspx" >Edit UserInfo</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="QuesAnswer.aspx" >Registration</a></li>
					</ul>
				</div>
         <div class="table"> 
         <h1 style="color:fuchsia; text-align: center;"> Change Password </h1>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
       <table style="width: 1020px; margin-right: 133px; height: 23px;">
            <tr>
               <td class="auto-style1">PassWord:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
               </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="Red" ControlToValidate="txtPassword" ErrorMessage="Required PassWord"></asp:RequiredFieldValidator>
               </td>
            <asp:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="txtPassword" PreferredPasswordLength="1" MinimumUpperCaseCharacters="1" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" MinimumLowerCaseCharacters="1"></asp:PasswordStrength>
                   </tr>
           <tr>
               <td class="auto-style1">ConfirmPassWord:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
               </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="Red" ControlToValidate="ConfirmPassword" ErrorMessage="Required  confirm PassWord"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" BackColor="Red" ControlToCompare="txtPassword" ControlToValidate="ConfirmPassword" ErrorMessage="Both password must match"></asp:CompareValidator>
                    <br />
               </td>
            </tr>
           <tr>
               <td class="auto-style3">
                   &nbsp;</td>
                <td class="auto-style14">
                   <asp:Button ID="SubmitButton" OnClick="submit_Click" runat="server" Text="Submit" style="text-align: right" />
                    <input id="Reset1" type="reset" value="reset" /></td>
                
                   <td> &nbsp;</td>

                   </tr>
           </table>

         </div>
    </div>
    </form>
</body>
</html>
