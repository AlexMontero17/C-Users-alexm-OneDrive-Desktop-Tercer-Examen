<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TercerExamen.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
    <br />
</p>
<p>
    A continuación se muestra la tabla con el registro de usuarios. Puede agregar, borrar y modificar los usuarios.</p>
<p>
    &nbsp;</p>
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
<p>
    Usuario:&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="Tusuario" runat="server" OnTextChanged="TCodigo_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <p>
        Clave:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="Tclave" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    Nombre:&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="Tnombre" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
</p>
<p>
    Apellido:&nbsp;
    <asp:TextBox ID="Tapellido" runat="server" OnTextChanged="Tprecio_TextChanged"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="BModificar" runat="server" OnClick="BModificar_Click" Text="Modificar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Bborrar" runat="server" OnClick="Bborrar_Click" Text="Borrar" />
</p>
<p>
    &nbsp;</p>

</asp:Content>
