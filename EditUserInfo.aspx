<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditUserInfo.aspx.cs" Inherits="EditUserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <title>Edit UserInfo</title>
     <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
     <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <link href="s3slider.css" rel="stylesheet" type="text/css" />
    <!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>

    <script type="text/javascript">
        function chk_frm_s(frm) {
            var c = 0;

            document.getElementById("chk_roll_no").innerHTML = "";
            if (frm.txtuserid.value.length == 0) {
                document.getElementById("chk_roll_no").innerHTML = "Enter Roll No!";
                c = 1;
            }
            if (frm.txtuserid.value.length > 0) {
                var strValidChars = "0123456789০১২৩৪৫৬৭৮৯";
                var strChar;
                var strString = frm.txtuserid.value;
                //  test strString consists of valid characters listed above
                for (i = 0; i < strString.length ; i++) {
                    strChar = strString.charAt(i);
                    if (strValidChars.indexOf(strChar) == -1) {
                        document.getElementById("chk_roll_no").innerHTML = "Correct Roll No";
                        c = 1;
                        break;
                    }
                }
            }

            document.getElementById("chk_session").innerHTML = "";
            if (frm.DropDownList_session.value == "Select Session") {
                document.getElementById("chk_session").innerHTML = "Select Session!";
                c = 1;
            }


            document.getElementById("chk_name").innerHTML = "";
            if (frm.txtName.value.length == 0) {
                document.getElementById("chk_name").innerHTML = "Enter Name!";
                c = 1;
            }
            document.getElementById("chk_password").innerHTML = "";
            if (frm.txtPassword.value.length == 0) {
                document.getElementById("chk_password").innerHTML = "Enter PassWord!";
                c = 1;
            }
            document.getElementById("chk_email").innerHTML = "";
            if (frm.txtEmail.value.length == 0) {
                document.getElementById("chk_email").innerHTML = "Enter Email !";
                c = 1;
            }

            /* if (frm.txtEmail.value.length > 0) {
                 //var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var filter= /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                 if (!filter.test(frm.txtEmail.Text)) {
                     document.getElementById("chk_email").innerHTML = frm.txtEmail.Text;
                     c = 1;
                 }
             }*/
            //  check for valid numeric strings
            document.getElementById("chk_mobile_no").innerHTML = "";
            if (frm.mobile_no.value.length == 0) {
                document.getElementById("chk_mobile_no").innerHTML = "Enter Mobile No!";
                c = 1;
            }
            if (frm.mobile_no.value.length > 0) {
                var strValidChars = "0123456789০১২৩৪৫৬৭৮৯";
                var strChar;
                var strString = frm.mobile_no.value;
                //  test strString consists of valid characters listed above
                for (i = 0; i < strString.length ; i++) {
                    strChar = strString.charAt(i);
                    if (strValidChars.indexOf(strChar) == -1) {
                        document.getElementById("chk_mobile_no").innerHTML = "Correct Mobile No";
                        c = 1;
                        break;
                    }
                }
            }

            document.getElementById("valid_msg").innerHTML = "";

            if (c == 1) {
                return false;
            }
            // else return true;

        }

</script>
</head>
<body>
    <form action="EditUserInfo.aspx" method="post" runat="server" ENCTYPE="multipart/form-data" name="frm_ins_stu"  id="frm_ins_stu" onsubmit="return chk_frm_s(this)" >
    
   <div class="Main">
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
                <li><a href="#">Video Gallery</a></li>
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
       <div class="linksidebar" style="background: #CC525D;">
					<ul>
						<li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="StudentsPage.aspx" style="color:#C7C03E; background: #8A0808;">User Info</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="ChangePassWord.aspx" >Change Password</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="EditUserInfo.aspx" >Edit UserInfo</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="QuesAnswer.aspx" >Registration</a></li>
					</ul>
				</div>
           
               
    <div class="table"> 
      <table width="740" border="1" cellspacing="10" cellpadding="0" bgcolor="#999999">
	   
          <tr>
              <th><h1 style="color:fuchsia;font-size:30px;"  >Student's </h1></th>
              <th><h1 style="color:fuchsia;font-size:30px;"  > Update Information </h1></th>
          </tr>
       <tr>
          <td align="right">Roll no:</td>
          <td>
              
              <asp:TextBox runat="server" name="txtuserid" AutoPostBack="true" OnTextChanged="roll_TextChanged" type="text" id="txtuserid"/><font color="#FF0000" size="2"><asp:Label runat="server" name="chk_rol_no" id="chk_roll_no">*</asp:Label></font>
            
                    
              </td>
        </tr>
        <tr>
          <td align="right">Year:</td>
          <td><asp:DropDownList runat="server" name="DropDownList_CLASS" size="1" id="DropDownList_CLASS">
          <asp:ListItem value="1st">1st Year</asp:ListItem>
          <asp:ListItem value="2nd">2nd Year</asp:ListItem>

        </asp:DropDownList></td>
        </tr>
		<tr>
          <td align="right">Group:</td>
          <td><asp:DropDownList runat="server" name="DropDownList_grp" size="1" id="DropDownList_grp" >
		  <asp:ListItem value="Science">SCIENCE</asp:ListItem>
          <asp:ListItem value="Commerce">COMMERCE</asp:ListItem>
		  <asp:ListItem value="Arts">ARTS</asp:ListItem>
        </asp:DropDownList></td>
		</tr>
		<tr>
          <td align="right">Session:</td>
          <td><asp:DropDownList runat="server" name="DropDownList_session" size="1" id="DropDownList_session">
		  <asp:ListItem value="Select Session">Select Session</asp:ListItem>
		  <asp:ListItem value="2009-2010">2009-2010</asp:ListItem>
		  <asp:ListItem value="2010-2011">2010-2011</asp:ListItem>
		  <asp:ListItem value="2011-2012">2011-2012</asp:ListItem>
		  </asp:DropDownList><font color="#FF0000" size="2"><label id="chk_session">*</label></font></td>
        </tr>
        <tr>
          <td align="right">Name:</td>
          <td><asp:TextBox runat="server" name="Name" type="text" ID="Name" size="20" maxlength="50"/><font color="#FF0000" size="2"><asp:Label runat="server" id="chk_name">*</asp:Label></font></td>
        </tr>
          <tr>
                <td align="right"><asp:Label ID="sex" runat="server" text-align="right" Text="Gender:"/></td>
                <td><asp:DropDownList ID="sex_list" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>FeMale</asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
        <tr>
          <td align="right">Father Name:</td>
          <td><asp:TextBox runat="server" name="f_name" type="text" id="f_name" size="40" maxlength="50"/></td>
        </tr>
        <tr>
          <td align="right">Village:</td>
          <td><asp:TextBox runat="server" name="village" type="text" id="village" size="40" maxlength="50"/></td>
        </tr>
		<tr>
          <td align="right">Thana:</td>
          <td><asp:TextBox runat="server" name="thana" type="text" id="thana" size="40" maxlength="50"/></td>
        </tr>
        <tr>
          <td align="right">Mobile No:</td>
          <td><asp:TextBox runat="server" name="mobile_no" type="text" id="mobile_no" /><font color="#FF0000" size="2"><label id="chk_mobile_no">*</label></font></td>
        </tr>
          <tr>
                <td align="right">Email:</td>
            <%--  <td><input name="txtEmail" id="txtEmail" size="20" type="email" value="something@gmail.com"/> --%>
                 <td><asp:TextBox runat="server" type="email" size="20" placeholder="some@gmail.com" ID="txtEmail" /><font color="#FF0000" size="2"><asp:Label runat="server" id="chk_email"></asp:Label></font></td>
                    <%--  <asp:RegularExpressionValidator id="regEmail" ControlToValidate="txtEmail" ErrorMessage="Invalid email"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                Runat="server" ValidationGroup="masum" EnableClientScript="false" CssClass="rtext4" ForeColor="Red" ></asp:RegularExpressionValidator>
            
                <asp:RequiredFieldValidator ID="text4" CssClass="rtext4" ValidationGroup="masum" ControlToValidate="txtEmail"  Runat="server"  ErrorMessage="Enter Email!"  ForeColor="Red"
                EnableClientScript="false"></asp:RequiredFieldValidator> --%>
              </tr> 
           <tr>
              <%--  <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager> --%>
            <td align="right">Password:</td>
            <td><asp:TextBox runat="server" name="txtPassword" placeholder="at least six charecter, strong password is a combination of punctuation & letter marks." ID="txtPassword" TextMode="Password" /><font color="#FF0000" size="2">*<label id="chk_password"></label></font></td>
             <%--  <asp:PasswordStrength ID="PasswordStrength1" runat="server"></asp:PasswordStrength> --%>
                </tr>
        <tr>
        <td align="right">ConfirmPassword</td>
        <td class="auto-style3">
<asp:TextBox runat="server" ID="ConfirmPassword" size="15px" name="ConfirmPassword" TextMode="password"/><asp:Label ID="passcheck" runat="server" ForeColor="Red" Text="*Password notmatched"/>

        </td>
                        
    </tr>

        <tr>
          <td align="right"><label>
            <input name="btn_reset" type="reset" id="btn_reset" value="Reset Data" />
          </label></td>
            <%-- <td align="center"><input name="btn_ins_student" type="submit" id="btn_ins_student" value="Insert Student" /></td> --%>
           
           <td align="center"><asp:Button runat="server" name="btn_update" type="submit"  id="btn_update" Text="Update" OnClick="update_Click"/></td> 
        </tr>
       
              
      </table>
     </div>
               </div>
               
           </div>
             
    
    </form>
    </body>
</html>
