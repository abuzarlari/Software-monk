<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" language="javascript">
        function Checkall(Checkbox) {
            var GridView1 = document.getElementById("<%=GridView1.ClientID %>");
            for (i = 1; i < GridView1.rows.length; i++) {
                GridView1.rows[i].cells[3].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
            }
        }
    </script>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  

            CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Select All">
                    <HeaderTemplate>
                        <asp:CheckBox ID="CheckBox1"  AutoPostBack="true" OnCheckedChanged="chckchanged" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="Item" HeaderText="Item" />
                <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" />
                
                
                <asp:TemplateField HeaderText="Select All">
                      <ItemTemplate>
                        <asp:textbox ID="txtamount" runat="server" Text='<%# Eval("Amount") %>'  />
                          <asp:textbox ID="txtRemark" runat="server" Text='<%# Eval("Remark") %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    <br />
        <asp:Button ID="Update" runat="server" Text="Button" OnClick="Update_Click" />

    </div>
    </form>
</body>
</html>
