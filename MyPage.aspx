<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPage.aspx.cs" Inherits="MTN.MyPage" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
   <form runat="server">
        <div class="mpage">
            <ul class="leftmenu">
                <li><a href="mypage" class="upperMenu active">صفحتي الرئيسية</a></li>
                <li><a href="AddNumber" class="upperMenu">أضف رقم جديد</a></li>
                <li><a href="mydata" class="upperMenu">معلوماتي الشخصية</a></li>
            </ul>
            <div>
                <h1 class="Page-Title" style="color: #3c3c3c;">معلومات الخط</h1>
                <div>
                    <br>
                    <div style="margin-bottom: 20px !important;">
                        <div class="textvalue">
                            <span class="memberProperty">رقم الخط : </span>
                            <asp:Label runat="server" ID="phoneNumber" class="orangevalue memberProperty"></asp:Label>
                        </div>
                        <div class="textvalue">
                            <span class="memberProperty">حالة الخط : </span>
                            <span class="orangevalue memberProperty">فعال</span>
                        </div>
                        <div class="textvalue">
                            <span class="memberProperty">وصف فئة الخدمة : </span>
                            <span class="orangevalue memberProperty">MTN ثواني</span>
                        </div>
                        <div class="textvalue">
                            <span class="memberProperty">الحساب الرئيسي : </span>
                            <span class="orangevalue memberProperty">5900 ل.س</span>
                        </div>
                    </div>
                </div>
                <div id="UnDone" runat="server" class="Page-Body Registration">
                    <h2>الحصول على بيانات الدفع</h2>
                    <asp:DropDownList ID="drop" runat="server"></asp:DropDownList>
                    <asp:Button runat="server" OnClick="Show_payments" Text="Submit" />
                </div>
                <div runat="server" id="Done" style="margin-bottom: 20px !important;"></div>
            </div>
        </div>
    </form>
</asp:Content>
