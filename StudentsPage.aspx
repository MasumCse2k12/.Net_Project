<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentsPage.aspx.cs" Inherits="StudentsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <title>Student Page</title>
     <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <link href="s3slider.css" rel="stylesheet" type="text/css" />
    <!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#slider').s3Slider({
            timeOut: 2600
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
   <div class="Main">
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
       <div class="Registration_Form" style="background:#C7C03E">
        <div class="linksidebar" style="background: #CC525D;">
					<ul>
						<li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="StudentsPage.aspx" style="color:#C7C03E; background: #8A0808;">User Info</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="ChangePassWord.aspx" >Change Password</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="EditUserInfo.aspx" >Edit UserInfo</a></li>
                        <li style="border-bottom: 2px solid #960405; border-top: 1px solid #FD7A80;"><a href="QuesAnswer.aspx" >QuestionAnswer</a></li>
					</ul>
				</div>
           <div class="StudentInfo" style="background:#C7C03E">
               <%-- <div id="Var_margin"> </div> --%>
               <h1 style="text-align:center; color:fuchsia">My Personal Info</h1>
               
               <table width="440" >
               <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Name:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="stdName"/></font></td>
                     
                       </tr>
                    <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Roll No:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="roll"/></font></td>
                     
                       </tr>
                <tr>
                    <td style="padding-left:25px;color:blue"> <font style="color:blue;font-size:25px;">Fatther Name:</font></td>
                    <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="father_name"/></font><td>
                       
                         </tr> 
                   
              
                   <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">village:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="village"/></font></td>

               </tr>
                   <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Thana.:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="Thana"/></font></td>
                     
                       </tr>
                   <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Gender:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="Gender"/></font></td>

               </tr>
                   <tr>
                   <td  style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Group:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="group"/></font></td>

               </tr>
                    <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Year:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="Year"/></font></td>
                     
                       </tr>
                    <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Session:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="session"/></font></td>
                     
                       </tr>
                    <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Mobile No. :</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="mobile"/></font></td>
                     
                       </tr>
                    <tr>
                   <td style="padding-left:25px;color:blue"><font style="color:blue;font-size:25px;">Email:</font></td>
                   <td><font style="color:blue;font-size:25px;"><asp:Label runat="server" ID="Email"/></font></td>
                     
                       </tr>
                   </table>
               
               </div>
           <div class="stdImage" style="background:#C7C03E"> 
               <asp:image CssClass="userImage" BackColor="Fuchsia" BorderColor="Fuchsia"  ID="Image1"  Width="150px" Height="150px"    runat="server" /> 
               <asp:FileUpload ID="FileUpload1"  runat="server" />
               <asp:Button runat="server" Text="Set Profile" OnClick="ChangeProfile"/>
                <asp:Button ID="Refresh" runat="server" Text="Update profile" OnClick="ShowChangedImg"/> 
               <font color="#FF0000" size="5"><asp:Label runat="server" id="imgformatLabel"></asp:Label></font>
               
           </div>
        </div>
     </div>
             
   
    </form>
    </body>
</html>
