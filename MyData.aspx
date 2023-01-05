<%@ Page Language="C#" MasterPageFile="/Site.Master" AutoEventWireup="true" CodeBehind="MyData.aspx.cs" Inherits="MTN.MyData" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="mpage">
        <ul class="leftmenu">
            <li><a href="mypage" class="upperMenu">صفحتي الرئيسية</a></li>
            <li><a href="AddNumber" class="upperMenu">أضف رقم جديد</a></li>
            <li><a href="mydata" class="upperMenu active">معلوماتي الشخصية</a></li>
        </ul>
        <div>
            <h1 class="Page-Title top-title">تحديث</h1>
            <h3 class="Page-SubTitle">يرجى ادخال المعلومات أدناه</h3>
            <form runat="server" method="post">
                <div class="Page-Body Registration" style="padding: 0;">
                    <div style="padding-top: 10px;">
                        <asp:DropDownList ID="title" runat="server" required="">
                            <asp:ListItem Value="">اللقب</asp:ListItem>
                            <asp:ListItem Value="mr">السيد</asp:ListItem>
                            <asp:ListItem Value="ms">السيدة</asp:ListItem>
                            <asp:ListItem Value="mss">السادة</asp:ListItem>
                            <asp:ListItem Value="dr">الدكتور</asp:ListItem>
                            <asp:ListItem Value="other">أخرى</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="padding-top: 10px;">
                        <asp:TextBox required="" runat="server" ID="FirstName"
                            placeholder="الاسم الأول">
                        </asp:TextBox>
                    </div>
                    <div style="padding-top: 10px;">
                        <asp:TextBox ID="LastName" required="" runat="server"
                            placeholder="اسم العائلة">
                        </asp:TextBox>
                    </div>

                    <div style="padding-top: 10px;">
                        <asp:DropDownList required="" ID="City" runat="server">
                            <asp:ListItem Value="">المدينة</asp:ListItem>
                            <asp:ListItem Value="Damascus">دمشق</asp:ListItem>
                            <asp:ListItem Value="Aleppo">حلب</asp:ListItem>
                            <asp:ListItem Value="Latakia">اللاذقية</asp:ListItem>
                            <asp:ListItem Value="Hama">حماه</asp:ListItem>
                            <asp:ListItem Value="Homs">حمص</asp:ListItem>
                            <asp:ListItem Value="Tartus">طرطوس</asp:ListItem>
                            <asp:ListItem Value="Quneitra">القنيطرة</asp:ListItem>
                            <asp:ListItem Value="Daraa">درعا</asp:ListItem>
                            <asp:ListItem Value="Qamishli">القامشلي</asp:ListItem>
                            <asp:ListItem Value="As-uwayda">السويداء</asp:ListItem>
                            <asp:ListItem Value="Deir z-Zor">دير الزور</asp:ListItem>
                            <asp:ListItem Value="Al-asakah">الحسكة</asp:ListItem>
                            <asp:ListItem Value="Ar-aqqah">الرقة</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="padding-top: 10px;">
                        <asp:TextBox runat="server" ID="address" TextMode="MultiLine"
                            placeholder="عنوان الإقامة"></asp:TextBox>
                    </div>
                    <div style="padding-top: 10px;">
                        <asp:DropDownList ID="sex" runat="server" required="">
                            <asp:ListItem Value="">الجنس</asp:ListItem>
                            <asp:ListItem Value="he">ذكر</asp:ListItem>
                            <asp:ListItem Value="she">أنثى</asp:ListItem>
                            <asp:ListItem Value="other">غير ذلك</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="padding-top: 10px;">
                        <asp:TextBox runat="server" required="" ID="dob" type="date">
                        </asp:TextBox>
                    </div>
                    <div style="padding-top: 10px;">
                        <asp:DropDownList runat="server" required="" ID="job">
                            <asp:ListItem Value="">المهنة</asp:ListItem>
                            <asp:ListItem Value="1">المحاسبة / المالية</asp:ListItem>
                            <asp:ListItem Value="2">تكنولوجيا المعلومات</asp:ListItem>
                            <asp:ListItem Value="4">الاستشارات</asp:ListItem>
                            <asp:ListItem Value="5">خدمة العملاء / الدعم</asp:ListItem>
                            <asp:ListItem Value="6">التعليم / التدريب</asp:ListItem>
                            <asp:ListItem Value="7">الاتصالات/تقنيات الشبكة</asp:ListItem>
                            <asp:ListItem Value="9">إداري</asp:ListItem>
                            <asp:ListItem Value="10">موظف حكومي / عسكري</asp:ListItem>
                            <asp:ListItem Value="11">الموارد البشرية/الإدارة</asp:ListItem>
                            <asp:ListItem Value="12">التصنيع / الإنتاج / العمليات</asp:ListItem>
                            <asp:ListItem Value="13">المهنية (الطبية والقانونية، وما إلى ذلك)</asp:ListItem>
                            <asp:ListItem Value="14">البحث والتطوير</asp:ListItem>
                            <asp:ListItem Value="15">التسويق</asp:ListItem>
                            <asp:ListItem Value="16">المبيعات</asp:ListItem>
                            <asp:ListItem Value="17">عمل خاص</asp:ListItem>
                            <asp:ListItem Value="18">طالب</asp:ListItem>
                            <asp:ListItem Value="19">تاجر / حرفي</asp:ListItem>
                            <asp:ListItem Value="20">عاطل عن العمل</asp:ListItem>
                            <asp:ListItem Value="21">أخرى</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <br>
                    <div style="padding-top: 10px;">
                        <asp:Button runat="server" OnClick="Update"
                            type="button" Text="حفظ"></asp:Button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
