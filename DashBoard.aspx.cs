using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTN
{
    public partial class DashBoard : System.Web.UI.Page
    {
        public Database Db { get; private set; }
        public string[,] Data { get; set; }
        public string[,] Users { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "DashBoard";
            Db = new Database();
            Data = Db.Get_Payments();
            Users = Db.GetUsers();
            string foo = Request.Cookies["IsAdmin"] == null ? "false" : Request.Cookies["UserLogin"].Value;
            if (!bool.Parse(foo))
                Response.Redirect("Login.aspx");
            if (!Page.IsPostBack)
            {
                for (int j = 0; j < Users.GetLength(0); j++)
                {
                    ListItem item = new ListItem(Users[j, 3] + " " + Users[j, 4], Users[j, 0]);
                    list.Items.Add(item);
                }
                list.Items.Add(new ListItem("", ""));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["amount"]) && list.SelectedValue != "")
            {
                Db.Add_payment(list.SelectedValue, Request.QueryString["amount"], "no");
                list.SelectedValue = "";
                Response.Redirect("dashboard.aspx");
            }
        }

        public void ShowForm(object sender, EventArgs e)
        {
            if (list.SelectedValue != "")
            {
                result.Style.Clear();
                var d = Db.Get_user_data(int.Parse(list.SelectedValue));
                result.TagName = "form";
                result.InnerHtml = $"<div><p userId='{d[0]}'>{d[3]} {d[4]}</p></div><div><p>{d[9]}</p></div><input type='text' name='amount'/>";
            }
        }
    }
}