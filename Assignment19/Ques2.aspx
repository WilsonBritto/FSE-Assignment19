<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ques2.aspx.cs" Inherits="Assignment19.Ques2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <h3>Question 2a & 2b</h3>
    <h5>Customer details born after given date</h5>
    <asp:Label ID="Label1" runat="server" Text="Enter the date:"></asp:Label>
    <input id="InpDateId" type="date" runat="server" />
    <asp:Button ID="GetCustByDobId" runat="server" Text="Get customers" OnClick="GetCustByDobId_Click"/>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="CustId" HeaderText="Customer Id" ReadOnly/>
                <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                <asp:BoundField DataField="CustAddr" HeaderText="Address" />
                <%--<asp:BoundField DataField="Dob" HeaderText="Date of Birth" />--%>
                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblDobId"
                            Text='<%#DataBinder.Eval(Container.DataItem, "Dob").ToString()%>'>
                        </asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="dtDobId" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Dob").ToString()%>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Salary" HeaderText="Salary" />
            </Columns>
            
        </asp:GridView>

</asp:Content>
