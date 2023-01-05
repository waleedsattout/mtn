using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MTN
{
    public partial class MyPage : System.Web.UI.Page
    {
        public Database Db { get; private set; }
        public string[] Data { get; private set; }
        public string[,] Payments { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "My Page";
            Db = new Database();
            string foo = Request.Cookies["UserLogin"] == null ? "false" : Request.Cookies["UserLogin"].Value;
            if (!bool.Parse(foo))
                Response.Redirect("Login.aspx");
            Data = Db.Get_user_data(int.Parse(Request.Cookies["UserId"].Value), null);
            if (!Page.IsPostBack)
            {
                phoneNumber.Text = Data[9].Split(',')[0];
                drop.DataSource = Data[9].Split(',');
                drop.DataBind();
            }
        }

        public void Show_payments(object sender, EventArgs e)
        {
            Payments = Db.Get_done_payments(Data[0], drop.SelectedValue);
            var table = "<h3 class='Page-SubTitle'>عمليات الدفع السابقة</h3><br/><table class='ProductServices'><tr class='categorytitle'><td> التاريخ </td><td> القيمة </td></tr>";
            int i;
            for (i = 0; i < Payments.GetLength(0); i++)
            {
                if (Payments[i, 0] == null) break;
                string tr = $"<tr><td>{Payments[i, 4]}</td>";
                tr += $"<td>{Payments[i, 3]}</td></tr>";
                table += tr;
            }
            if (i != 0)
            {
                table += "</table>";
                Done.InnerHtml = table;
            }
            else
                Done.InnerHtml = "<h3 class='Page-SubTitle'>عمليات الدفع السابقة</h3><div class='textvalue'><span class='memberProperty'>لا يوجد عمليات دفع سابقة</span></div>";
            Payments = Db.Get_payments(Data[0], drop.SelectedValue);
            table = "<h3 class='Page-SubTitle'>عمليات الدفع المستحقة</h3><br/><table class='ProductServices'><tr class='categorytitle'><td> التاريخ </td><td> القيمة </td></tr>";

            for (i = 0; i < Payments.GetLength(0); i++)
            {
                if (Payments[i, 0] == null) break;
                string tr = $"<tr><td>{Payments[i, 4]}</td>";
                tr += $"<td>{Payments[i, 3]}</td></tr>";
                table += tr;
            }
            if (i != 0)
            {
                table += "</table>";
                UnDone.InnerHtml = table;
            }
            else
                UnDone.InnerHtml = "<h3 class='Page-SubTitle'>عمليات الدفع المستحقة</h3><div class='textvalue'><span class='memberProperty'>لا يوجد عمليات دفع مستحقة</span></div>";
        }
    }
}