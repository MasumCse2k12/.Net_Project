<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload.aspx.cs" Inherits="FileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Upload Page</title>
     <link rel="icon" href="imagesScl.jpg" type="image/jpg" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div class="table">
        <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="Button1" runat="server" Text="UPLOAD" OnClick="Upload_Click" />
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
    </form>
</body>
</html>
