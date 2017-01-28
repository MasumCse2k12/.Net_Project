<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lookover.aspx.cs" Inherits="lookover" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 343px; width: 753px">
    <form id="form1" runat="server">
    <div>
      
    
         </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ShowEditButton="True" ShowDeleteButton="True"/>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="Group" HeaderText="Group" SortExpression="Group" />
                <asp:BoundField DataField="session" HeaderText="session" SortExpression="session" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                <asp:BoundField DataField="father_name" HeaderText="father_name" SortExpression="father_name" />
                <asp:BoundField DataField="village" HeaderText="village" SortExpression="village" />
                <asp:BoundField DataField="thana" HeaderText="thana" SortExpression="thana" />
                <asp:BoundField DataField="mobile_number" HeaderText="mobile_number" SortExpression="mobile_number" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" ProviderName="<%$ ConnectionStrings:mycon.ProviderName %>" SelectCommand="SELECT [Id], [class], [Group], [session], [name], [gender], [father_name], [village], [thana], [mobile_number], [email], [password] FROM [StudentInfo]"  DeleteCommand="DELETE FROM [StudentInfo] WHERE [Id] = @Id" >
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        </form>
</body>
</html>
