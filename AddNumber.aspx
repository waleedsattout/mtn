<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNumber.aspx.cs" Inherits="MTN.AddNumber" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="mpage">
        <ul class="leftmenu">
            <li><a href="mypage" class="upperMenu">صفحتي الرئيسية</a></li>
            <li><a href="AddNumber" class="upperMenu active">أضف رقم جديد</a></li>
            <li><a href="mydata" class="upperMenu">معلوماتي الشخصية</a></li>
        </ul>

        <div>
            <h1>أضف رقم جديد</h1>
            <div class="Page-Body Registration">
                <form runat="server">
                    <h3 class="Page-SubTitle">يرجى إدخال رقم </h3>
                    <asp:TextBox runat="server" ID="newNumber" placeholder="رقمك الجديد" required=""></asp:TextBox>
                    <asp:RegularExpressionValidator ControlToValidate="newNumber" Display="Dynamic" EnableClientScript="False"
                        ValidationExpression="^(?=.*[0-9]).{9}$" ErrorMessage="يجب أن يكون رقم الهاتف 9 أرقام بدون الصفر"
                        CssClass="error_validate" runat="server" />

                <asp:Button runat="server" OnClick="Add_Number" type="button" Text="إضافة"></asp:Button>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
