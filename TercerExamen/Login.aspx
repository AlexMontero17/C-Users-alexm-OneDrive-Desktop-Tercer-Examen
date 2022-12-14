<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TercerExamen.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Usuario (Email):&nbsp;
            <asp:TextBox ID="Tusuario" runat="server" OnTextChanged="Tusuario_TextChanged"></asp:TextBox>
            <br />
            <br />
            <br />
            Clave:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Tclave" runat="server" OnTextChanged="Tclave_TextChanged"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Bingresar" runat="server" Text="Ingresar" OnClick="Bingresar_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdUsuario" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" ReadOnly="True" SortExpression="IdUsuario" />
                    <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                    <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VehiculosConnectionString1 %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [IdUsuario] = @IdUsuario" InsertCommand="INSERT INTO [Usuarios] ([Usuario], [Clave], [Nombre], [Apellido]) VALUES (@Usuario, @Clave, @Nombre, @Apellido)" SelectCommand="SELECT [IdUsuario], [Usuario], [Clave], [Nombre], [Apellido] FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [Usuario] = @Usuario, [Clave] = @Clave, [Nombre] = @Nombre, [Apellido] = @Apellido WHERE [IdUsuario] = @IdUsuario">
                <DeleteParameters>
                    <asp:Parameter Name="IdUsuario" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Clave" Type="String" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Apellido" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Clave" Type="String" />
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Apellido" Type="String" />
                    <asp:Parameter Name="IdUsuario" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </form>
</body>
</html>
