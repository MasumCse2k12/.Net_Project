<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxPass.aspx.cs" Inherits="AjaxPass" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <ajaxToolkit:toolkitscriptmanager ID="Toolkitscriptmanager1" runat="server"></ajaxToolkit:toolkitscriptmanager>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br/><br />
        <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" MinimumUpperCaseCharacters="1" PreferredPasswordLength="1" TargetControlID="TextBox1"></ajaxToolkit:PasswordStrength>
        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
        <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" MinimumPrefixLength="1" ServiceMethod="GetCompletionList" TargetControlID="TextBox2" UseContextKey="True"></ajaxToolkit:AutoCompleteExtender>
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
