<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ques4.aspx.cs" Inherits="Assignment19.Ques4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Question 4</h3>
    <h5>Create table from XML File</h5>
    <asp:FileUpload ID="InpFileId" runat="server" accept=".xml"/>
    <br />
    <asp:Button ID="LoadBtnId" runat="server" Text="Load" OnClick="LoadBtnId_Click"/>
</asp:Content>
