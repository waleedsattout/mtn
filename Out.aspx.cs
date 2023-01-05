using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MTN
{
    public partial class Out : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cookies["IsAdmin"].Expires = DateTime.Now;
            Response.Cookies["UserLogin"].Expires = DateTime.Now;
            Response.Cookies["UserId"].Expires = DateTime.Now; 
            Response.Redirect("Login.aspx");
        }
    }
}