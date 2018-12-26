<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ques1.aspx.cs" Inherits="Assignment19.Ques1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <hr />
        <h3>Question 1(a)</h3>
        <h5>Create Customer Table</h5>
        <asp:Button ID="CreateTableBtn" runat="server" Text="Create Customer Table" OnClick="CreateTableBtn_Click"/>

        <hr />
        <h3>Question 1(b)</h3>
        <h5>Insert a new record into the table</h5>
        <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
        <asp:TextBox ID="CusNameId" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Customer Address"></asp:Label>
        <asp:TextBox ID="CusAddId" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="DOB"></asp:Label>
        <asp:TextBox ID="DobId" runat="server"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Salary"></asp:Label>
        <asp:TextBox ID="salId" runat="server"></asp:TextBox>
        <asp:Button ID="InsertRec" runat="server" Text="Insert a record" OnClick="InsertRec_Click"/>
        <hr />
    </div>
    
</asp:Content>
