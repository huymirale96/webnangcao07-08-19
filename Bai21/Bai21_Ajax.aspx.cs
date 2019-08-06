using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Bai21
{
    public partial class Bai21_Ajax : System.Web.UI.Page
    {
        static String sCnStr = @"Data Source=DESKTOP-69BHUF7\SQLEXPRESS;Initial Catalog=thuHanh;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    LoadDDL();
            //}
        }

        private void LoadDDL()
        {
            using (SqlConnection sCnn = new SqlConnection(sCnStr))
            {
                sCnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "ViewLaixe";
                    cmd.Connection = sCnn;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DDLLaixe.DataSource = dt;
                    DDLLaixe.DataTextField = "sHoten";
                    DDLLaixe.DataValueField = "iLaixe";
                    DDLLaixe.DataBind();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int i = int.Parse(RBL.SelectedValue);
            using (SqlConnection sCnn = new SqlConnection(sCnStr))
            {
                sCnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "DanhGia";
                    cmd.Connection = sCnn;
                    cmd.Parameters.Add(new SqlParameter("@idLaixe", DDLLaixe.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@dNgaydanhgia", txtbNgay.Text.ToString()));
                    cmd.Parameters.Add(new SqlParameter("@iSosao", i));
                    int kq = cmd.ExecuteNonQuery();
                    if (kq != 0)
                    {
                        Response.Write("<script>alert('Đánh giá thành công')</script>");
                    }
                }

            }

        }

        static DateTime FormatDate(string date)
        {
            string[] arr = date.Split('-');
            DateTime dt = new DateTime(int.Parse(arr[0]), int.Parse(arr[1]), int.Parse(arr[2]));
            return dt;
            
        }

        [WebMethod]
        public static String SelectedIndexChanged(String LaixeID)
        {
            using (SqlConnection sCnn = new SqlConnection(sCnStr))
            {
                sCnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "ViewDanhGia";
                    SqlParameter parameter = new SqlParameter("@iLaixeID", int.Parse(LaixeID));
                    cmd.Connection = sCnn;
                    cmd.Parameters.Add(parameter);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count != 0 && dt != null)
                    {
                        var result = JsonConvert.SerializeObject(dt);
                        return result;
                    }
                    else
                    {
                        return "false";
                    }
                }

            }
            
        }

        [WebMethod]
        public static string Insert()
        {
            return "thu ajaxjj";
            /*
            Random rd = new Random();
            int x = rd.Next(1, 1000);
            using (SqlConnection sCnn = new SqlConnection(sCnStr))
            {
                sCnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "DanhGia";
                    cmd.Connection = sCnn;
                    cmd.Parameters.Add(new SqlParameter("@idLaixe", LaixeID));
                    cmd.Parameters.Add(new SqlParameter("@dNgaydanhgia", FormatDate(Ngay)));
                    cmd.Parameters.Add(new SqlParameter("@iSosao", SoSao));
                    cmd.Parameters.Add(new SqlParameter("@id", x));
                    int kq = cmd.ExecuteNonQuery();
                    if (kq != 0)
                    {
                        return "ok roi";
                    }
                    return "false";
                }


            }*/


            }
    }
}