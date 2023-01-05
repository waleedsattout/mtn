<%@ Page Language="C#" MasterPageFile="/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MTN.Login" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="Page-Body Registration" style="margin: 0 5%;">
        <form runat="server" method="post" style="width: 50%;margin: auto;">
            <h4 class="Page-Title top-title">تسجيل الدخول</h4>
            <h3 class="Page-SubTitle">يرجى ادخال المعلومات أدناه</h3>
            <h4>تسجيل الدخول</h4>
            <div style="margin-bottom: 1rem; display: flex; flex-wrap: wrap;">
                <asp:TextBox placeholder="اسم المستخدم" required="" runat="server" ID="UserName"></asp:TextBox>
                <asp:TextBox placeholder="كلمة المرور" runat="server" required="" autocomplete="on" ID="Password" type="password"></asp:TextBox>
            </div>
            <asp:Button runat="server" OnClick="Login_user" class="w-100 primary on-primary-text primary-btn hover1 shape" type="submit" Text="Sign in"></asp:Button>
        </form>
    </div>
    <div style="display: flex; justify-content: center; margin: 0 25%;">
        <div style="margin: 0 5px;">
            <div class="sel" onclick="sel('admin')">
                admin
            </div>
        </div>
        <div style="margin: 0 5px;">
            <div class="sel" onclick="sel('user')">
                user
            </div>
        </div>
    </div>
    <script>
        function sel(user) {
            document.getElementById("MainContent_UserName").value = user;
            document.getElementById("MainContent_Password").value = "123";
        }
    </script>
</asp:Content>

