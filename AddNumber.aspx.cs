using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTN
{
    public partial class AddNumber : System.Web.UI.Page
    {
        public Database Db { get; private set; }
        public string[] Data { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "My Page";
            Db = new Database();
            string foo = Request.Cookies["UserLogin"] == null ? "false" : Request.Cookies["UserLogin"].Value;
            if (!bool.Parse(foo))
                Response.Redirect("Login.aspx");
            Data = Db.Get_user_data(int.Parse(Request.Cookies["UserId"].Value), null);
        }

        protected void Add_Number(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Db.Add_number(Data[0], newNumber.Text);
                Response.Redirect("mypage.aspx");
            }
        }
    }
}