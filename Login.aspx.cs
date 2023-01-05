using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTN
{
    public partial class Login : Page
    {
        public Database _db { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string foo = Request.Cookies["UserLogin"] == null ? "false" : Request.Cookies["UserLogin"].Value;
            if (bool.Parse(foo))
                Response.Redirect("MyPage.aspx");
            Page.Title = "Login";
            _db = new Database();
        }

        protected void Login_user(object sender, EventArgs e)
        {
            if (_db.Check_user_login(UserName.Text, Password.Text))
            {
                var d = _db.Get_user_data(null, UserName.Text);
                HttpCookie cookie1 = new HttpCookie("UserLogin", "True");
                HttpCookie cookie2 = new HttpCookie("UserId", d[0]);
                HttpCookie cookie3 = new HttpCookie("IsAdmin", (d[1] == "admin").ToString());
                Response.Cookies["UserLogin"].Expires = DateTime.Now.AddMinutes(20);

                Response.Cookies.Add(cookie1);
                Response.Cookies.Add(cookie2);
                Response.Cookies.Add(cookie3);
                Response.Redirect("MyPage.aspx");
            }
        }
    }
}