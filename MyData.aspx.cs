using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTN
{
    public partial class MyData : System.Web.UI.Page
    {
        public Database Db { get; private set; }
        public string[] Data { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "My Data";
            Db = new Database();
            string foo = Request.Cookies["UserLogin"] == null ? "false" : Request.Cookies["UserLogin"].Value;
            if (!bool.Parse(foo))
                Response.Redirect("Login.aspx");
            Data = Db.Get_user_data(int.Parse(Request.Cookies["UserId"].Value), null);
            if (!Page.IsPostBack)
            {
                FirstName.Text = Data[3];
                LastName.Text = Data[4];
                title.SelectedValue = Data[12];
                City.SelectedValue = Data[2];
                sex.SelectedValue = Data[10];
                job.SelectedValue = Data[8];
                dob.Text = Data[5];
                address.Text = Data[11];
            }
        }

        public void Update(object sender, EventArgs e)
        {
            Db.Update_user_data(Data[0], FirstName.Text, LastName.Text, City.SelectedValue, job.SelectedValue, sex.SelectedValue, dob.Text, title.SelectedValue, address.Text);
            Response.Redirect("MyData.aspx");
        }
    }
}