<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Sammilani High School</title>
    <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <link href="s3slider.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 187px;
        }
        .auto-style2 {
            text-align: right;
            width: 187px;
        }
        .auto-style3 {
            text-align: right;
            width: 187px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            width: 603px;
        }
        .auto-style6 {
            height: 26px;
            width: 603px;
        }
        .auto-style7 {
            text-align: right;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
            text-align: right;
        }
    </style>
    
</head>
<body>
    <form action="Registration.aspx" runat="server" >
								
	<div class="Heading">
       <div class="ImageLogo">
             <asp:Image ID="Image1" src="images/gallery/imagesScl.jpg" runat="server" />
            </div>
            <div class="SchoolName">
            Sammilani Maddhayamic Viddalaya Chalitatala.<br/>
              <font face="Siyam Rupali"> সম্মিলনী মাধ্যমিক বিদ্যালয়,চালিতাতলা </font>
            </div>
            <div class="Login_Info">
               
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

 <div class="Registration_Form">
     
        

       <div class="table"> 
      
	   <h1 style="color:fuchsia;"> Enter Information to Add Student </h1>
          <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager> 
       <table style="width: 1020px; margin-right: 133px; height: 233px;">
        <tr></tr>
          <tr>
              <td class="auto-style7">Roll No:</td>
              <td>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                  <asp:TextBox ID="txtuserid" AutoPostBack="true" OnTextChanged="roll_TextChanged" type="text" runat="server"></asp:TextBox><font color="#FF0000" size="5"><asp:Label runat="server" name="chk_rol_no" id="chk_roll_no"></asp:Label></font>
                      </ContentTemplate>
                      </asp:UpdatePanel>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" BackColor="Red" ControlToValidate="txtuserid" ErrorMessage="Required Roll Number"></asp:RequiredFieldValidator>
                  <br />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" BackColor="Red" ControlToValidate="txtuserid" ErrorMessage="Only Digit are required format" ValidationExpression="^([0-9\(\)\/\+ \-]*)$"></asp:RegularExpressionValidator>
              </td>
          </tr>
        <tr>
              <td class="auto-style7">Class:</td>
              <td>
                  <asp:DropDownList ID="DropDownList_CLASS" runat="server">
                      <asp:ListItem Selected="True">Select Class...</asp:ListItem>
                      <asp:ListItem>Six</asp:ListItem>
                      <asp:ListItem>Seven</asp:ListItem>
                      <asp:ListItem>Eight</asp:ListItem>
                      <asp:ListItem>Nine</asp:ListItem>
                      <asp:ListItem>Ten</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" BackColor="Red" ControlToValidate="DropDownList_CLASS" ErrorMessage="Select Class.." InitialValue="Select Class..."></asp:RequiredFieldValidator>
              </td>
          </tr>
        <tr>
              <td class="auto-style7">Group:</td>
              <td>
                  <asp:DropDownList ID="DropDownList_grp" runat="server">
                      <asp:ListItem Selected="True">Select Group...</asp:ListItem>
                      <asp:ListItem>Science</asp:ListItem>
                      <asp:ListItem>Arts</asp:ListItem>
                      <asp:ListItem>Commmerce</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" BackColor="Red" ControlToValidate="DropDownList_grp" ErrorMessage="Select Group" InitialValue="Select Group..."></asp:RequiredFieldValidator>
              </td>
          </tr>
        <tr>
              <td class="auto-style7">Session:</td>
              <td>
                  <asp:DropDownList ID="DropDownList_session" runat="server">
                      <asp:ListItem Selected="True">Select Session...</asp:ListItem>
                      <asp:ListItem>2010-11</asp:ListItem>
                      <asp:ListItem>2011-12</asp:ListItem>
                      <asp:ListItem>2012-13</asp:ListItem>
                      <asp:ListItem>2013-14</asp:ListItem>
                      <asp:ListItem>2014-15</asp:ListItem>
                  </asp:DropDownList>
              </td>
              <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" BackColor="Red" ControlToValidate="DropDownList_session" ErrorMessage="Required Session" InitialValue="Select Session..."></asp:RequiredFieldValidator>
              </td>
          </tr>
            <tr>
                <td class="auto-style2">UserName:</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                     <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" MinimumPrefixLength="1" ServiceMethod="GetCompletionList" TargetControlID="txtName" UseContextKey="True"></asp:AutoCompleteExtender>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" BackColor="Red" ControlToValidate="txtName" ErrorMessage="Required Name"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
        <tr>
            <td style="text-align: right">Gender:</td>
            <td>
                <asp:DropDownList ID="sex_list" runat="server">
                    <asp:ListItem Selected="True">Select Gender...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" BackColor="Red" ControlToValidate="sex_list" ErrorMessage="Select Gender.." InitialValue="Select Gender..."></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Father Name:</td>
            <td class="auto-style8">
                <asp:TextBox ID="f_name" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" BackColor="Red" ControlToValidate="f_name" ErrorMessage="Required Father Name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Village:</td>
            <td>
                <asp:TextBox ID="village" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" BackColor="Red" ControlToValidate="village" ErrorMessage="Required Village"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Thana:</td>
            <td>
                <asp:TextBox ID="thana" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" BackColor="Red" ControlToValidate="thana" ErrorMessage="Required Thana"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
               <td class="auto-style1">Mobile No:</td>
                <td>
                    <asp:TextBox ID="mobile_no" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="Red" ControlToValidate="mobile_no" ErrorMessage="Required Mobile Number"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" BackColor="Red" ControlToValidate="mobile_no" ErrorMessage="Invalid Phone Number" ValidationExpression="^([0-9\(\)\/\+ \-]*)$"></asp:RegularExpressionValidator>
                </td>

                   </tr>
        <tr>
               <td class="auto-style1">Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
               </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="Red" ControlToValidate="txtEmail" ErrorMessage="Required Email address"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" BackColor="Red" ControlToValidate="txtEmail" ErrorMessage="Invalid Email format..!!!!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
               </td>
            </tr>
        <tr>
               <td class="auto-style1">PassWord:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
               </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="Red" ControlToValidate="txtPassword" ErrorMessage="Required PassWord"></asp:RequiredFieldValidator>
               </td>
            <asp:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="txtPassword" PreferredPasswordLength="1" MinimumUpperCaseCharacters="1" MinimumSymbolCharacters="1" MinimumNumericCharacters="1" MinimumLowerCaseCharacters="1"></asp:PasswordStrength>
                   </tr>
           <tr>
               <td class="auto-style1">ConfirmPassWord:</td>
                <td>
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
               <td class="auto-style3">Country:</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList1" runat="server" >
                        <asp:ListItem Selected="True">Select One....</asp:ListItem>
                        <asp:ListItem>Bangladesh</asp:ListItem>
                        <asp:ListItem>India</asp:ListItem>
                        <asp:ListItem>Pakistan</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" BackColor="Red" ControlToValidate="DropDownList1" ErrorMessage="Required to select country" InitialValue="Select One...."></asp:RequiredFieldValidator>
                       </td>

                   </tr>
                   <tr>
               <td class="auto-style3">
                   <asp:Button ID="SubmitButton" OnClick="submit_Click" runat="server" Text="Submit" />
                       </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style6">
                    <input id="Reset1" type="reset" value="reset" /></td>

                   </tr>
    </table>
         
     </div>
   </div>
	  <label id="valid_msg"></label>
</form>

</body>
</html>
