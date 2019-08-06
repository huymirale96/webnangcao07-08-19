using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai21
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void check_Quyen()
        {
            //get_NhomQuyen();
            // Session["NhomQuyen"] = 1; //them
            int x = Convert.ToInt32(Session["NhomQuyen"].ToString());
            if (x == 2)
            {
                Add_Edit_Articles.Visible = false;
            }    // p = 2 >> k them sua bai ; p =3 >> xem user   , log >> p = 0 
            else if (x == 1)
            {
                Users_List.Visible = false;
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["PK_iUserID"] = 0;
            int a = Convert.ToInt32(Session["PK_iUserID"]);
            Response.Redirect("Login.aspx");
        }
    }
}