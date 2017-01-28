<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lookover.aspx.cs" Inherits="lookover" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="userid" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" SortExpression="userid" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masumdbConnectionString1 %>" DeleteCommand="DELETE FROM [user] WHERE [userid] = @userid" InsertCommand="INSERT INTO [user] ([userid], [password]) VALUES (@userid, @password)" SelectCommand="SELECT [userid], [password] FROM [user]" UpdateCommand="UPDATE [user] SET [password] = @password WHERE [userid] = @userid">
            <DeleteParameters>
                <asp:Parameter Name="userid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userid" Type="Int32" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="userid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
