using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTN
{
    public partial class Register : System.Web.UI.Page
    {
        public Database _db { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            string foo = Request.Cookies["UserLogin"] == null ? "false" : Request.Cookies["UserLogin"].Value;
            if (bool.Parse(foo))
                Response.Redirect("MyPage.aspx");
            Page.Title = "Register";
            _db = new Database();
        }
        protected void Signup(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                _db.Insert_user(FirstName.Text, LastName.Text, UserName.Text, City.SelectedValue, Email.Text, Password.Text, job.SelectedValue, sex.SelectedValue, dob.Text, phoneNumber.Text, address.Text, title.SelectedValue);

                var d = _db.Get_user_data(null, UserName.Text);
                HttpCookie cookie1 = new HttpCookie("UserLogin", "true");
                HttpCookie cookie2 = new HttpCookie("UserId", d[0]);
                HttpCookie cookie3 = new HttpCookie("IsAdmin", (d[0] == "1").ToString());
                Response.Cookies["UserLogin"].Expires = DateTime.Now.AddMinutes(20);

                Response.Cookies.Add(cookie1);
                Response.Cookies.Add(cookie2);
                Response.Cookies.Add(cookie3);
                Response.Redirect("MyPage.aspx");
            }
        }
    }
}