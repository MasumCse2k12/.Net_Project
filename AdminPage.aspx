<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> AdMin Page</title>
     <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <link href="s3slider.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="Main"
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
        <div class="sidebar">
                   <h1 style="color:fuchsia;">Sidebar:</h1>
                                              
                      <a style="color:#C7C03E; background: #8A0808; text-decoration:none" href="#"> UPLOAD </a> <br/><br/>				
					    <asp:Button runat="server" Text="IMAGES" ID="imgUpload" /><br/>
                         <asp:Button runat="server" Text="VIDEO" ID="videoUpload" /><br/><br/>
                    <a style="color:#C7C03E; background: #8A0808;text-decoration:none" href="#"> About Student </a><br/><br/>
                       <asp:Button runat="server" Text="INSERT STUDENT" ID="InsertStd" OnClick="InsertStd_Click" /><br/>
                         <asp:Button runat="server" Text="DELETE STUDENT" ID="DeleteStd" OnClick="DeleteStd_Click" />	<br/>
                          <asp:Button runat="server" Text="UPDATE STUDENT" ID="UpdateStd" OnClick="UpdateStd_Click" /><br/>
                         	
                </div>
        <div class="table">
        <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="FileUpload" runat="server" style="margin-top: 0px" Text="Upload_Videos"  Width="110px" OnClick="Upload_Videos_Click" /> &nbsp;&nbsp;
             <asp:Button ID="Button1" runat="server" style="margin-top: 0px" Text="Upload_Photos"  Width="110px" OnClick="Upload_Photos_Click" />
        <br />
            <font color="#FF0000" size="5"><asp:Label runat="server" id="imgformatLabel"></asp:Label></font>
        <br />
        <br />
        &nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="font-family:Arial,sans-serif,'Times New Roman'" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="505px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <FooterStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size In byte" >
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Type" HeaderText="File Type" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" >
                <ItemStyle Wrap="False" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        
            </div>
    </div>

        
            </div>
        
    </form>
</body>
</html>
