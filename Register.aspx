<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MTN.Register" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div style="margin: 0 5%;">
        <div class="registration">
            <div>
                <h1 class="Page-Title top-title">تسجيل</h1>
                <h3 class="Page-SubTitle">يرجى ادخال المعلومات أدناه</h3>
                <form runat="server" method="post">
                    <h4 class="title on-background-text">إنشاء حساب جديد</h4>
                    <div style="margin-bottom: .5rem; display: flex; flex-wrap: wrap;">
                        <div class="Page-Body Registration" style="padding: 0; width: 100%;">
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
                                <asp:TextBox runat="server" required="" ID="phoneNumber" placeholder="رقم الهاتف" value="963">
                                </asp:TextBox>
                                <asp:RegularExpressionValidator ControlToValidate="phoneNumber" Display="Dynamic" EnableClientScript="False"
                                    ValidationExpression="^(?=.*[0-9]).{9}$" ErrorMessage="يجب أن يكون رقم الهاتف 9 أرقام بدون الصفر"
                                    CssClass="error_validate" runat="server" />
                            </div>
                            <div style="padding-top: 10px;">
                                <asp:TextBox type="email" runat="server" ID="Email" placeholder="Email"></asp:TextBox>
                            </div>

                            <div style="padding-top: 10px;">
                                <asp:TextBox required="" runat="server" ID="UserName" placeholder="User Name"></asp:TextBox>
                                <asp:RegularExpressionValidator ControlToValidate="UserName"
                                    ValidationExpression="((^|, )(admin|^(?=.*[A-Za-z]).{8,}$))+$" Display="Dynamic"
                                    ErrorMessage="يجب أن يحوي اسم المستخدم على 8 أحرف على الأقل فقط، يمكن استخدام (.) أو (-)"
                                    EnableClientScript="False" CssClass="error_validate" runat="server" />
                            </div>

                            <div style="padding-top: 10px;">
                                <asp:TextBox runat="server" required="" autocomplete="on" ID="Password"
                                    type="password" placeholder="Passwoed"></asp:TextBox>
                                <asp:RegularExpressionValidator ControlToValidate="Password" Display="Dynamic"
                                    EnableClientScript="False"
                                    ValidationExpression="((^|, )(123|^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$))+$"
                                    ErrorMessage="يجب أن تحتوي كلمة المرور على حرف كبير على الأقل، ورقم على الأقل."
                                    CssClass="error_validate" runat="server" />
                            </div>
                            <div style="padding-top: 10px;">
                                <input onblur="check(this)" onfocus="this.style=''" placeholder="Retype Passwoed" required=""
                                    autocomplete="on" id="repass" type="password" />
                                <script>
                                    function check(ele) {
                                        var pass = document.getElementById("MainContent_Password").value;
                                        if (ele.value != pass) {
                                            ele.style = "box-shadow: 0 0 0 0.2rem rgb(186 26 26 / 35%);border-color: #7e0007;";
                                            ele.value = "";
                                        }
                                    }
                                </script>
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
                            <div>
                                <input id="TermsAndCondtion" type="checkbox" required="required" style="width: 30px" autocomplete="off">
                                <label for="TermsAndCondtion" style="max-width: 300px;">
                                    أوافق
                                على الشروط و الأحكام</label>
                            </div>
                            <div style="padding-top: 10px;">
                                <asp:Button runat="server" OnClick="Signup"
                                    type="button" Text="Sign up"></asp:Button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
