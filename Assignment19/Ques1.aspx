<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ques1.aspx.cs" Inherits="Assignment19.Ques1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <hr />
        <h3>Question 1(a)</h3>
        <h5>Create Customer Table</h5>
        <asp:Button ID="CreateTableBtn" runat="server" Text="Create Customer Table" OnClick="CreateTableBtn_Click"/>

        <hr />
        <h3>Question [1(b),3(c)]</h3>
        <h5>Insert a new record into the table</h5>
        <asp:Label ID="Label1" runat="server" Text="Customer Name"></asp:Label>
        <asp:TextBox ID="CusNameId" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Customer Address"></asp:Label>
        <asp:TextBox ID="CusAddId" runat="server"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="DOB"></asp:Label>
        <input id="DobId" type="date" runat="server" />
        <asp:Label ID="Label4" runat="server" Text="Salary"></asp:Label>
        <asp:TextBox ID="salId" runat="server"></asp:TextBox>
        <asp:Button ID="InsertRec" runat="server" Text="Insert a record" OnClick="InsertRec_Click"/>
        
        <hr />
        <h3>Question [1(c),3(a)] & [1(d),3(b)] & [1(e),3(d)] & [1(f),3(e)]</h3>
        <asp:TextBox ID="txtCustId" runat="server"></asp:TextBox>
        <asp:Button ID="btnDispByCustId" runat="server" Text="Display" OnClick="btnDispByCustId_Click"/>
        <asp:Button ID="btnDispAllId" runat="server" Text="Display All" OnClick="btnDispAllId_Click"/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
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
                <asp:CommandField ShowEditButton="true" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
            
        </asp:GridView>
    </div>
    
</asp:Content>
