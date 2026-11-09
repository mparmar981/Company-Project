using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.UI.WebControls;

namespace CompanyProject
{ 
    public partial class show_product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void ShowProducts()
        {
            string companyId = Request.QueryString["cid"];

            int cid;
            if (!int.TryParse(companyId, out cid))
            {
                lblEmpty.Visible = true;
                return;
            }

            getCon();

            da = new SqlDataAdapter("SELECT * FROM Add_Products_Tbl WHERE Prod_Comp_Id = " + cid, con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataList1.DataSource = ds;
                DataList1.DataBind();
                lblEmpty.Visible = false;
            }
            else
            {
                lblEmpty.Visible = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Add_To_Cart.aspx");
                return;
            }

            if (!IsPostBack)
            {
                Label3.Text = "Welcome, " + Session["admin"].ToString();
                ShowProducts();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                Response.Redirect("ViewDetails.aspx?pid=" + e.CommandArgument);
            }

            if (e.CommandName == "cmd_cart")
            {
                int prdid = Convert.ToInt32(e.CommandArgument);
                int uid = Convert.ToInt32(Session["uid"]);

                getCon();

                cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM cart_tbl WHERE Cart_User_Id = " + uid + " AND Cart_Prod_Id = " + prdid, con);
                int found = Convert.ToInt32(cmd.ExecuteScalar());

                if (found > 0)
                {
                    cmd = new SqlCommand(
                        "UPDATE cart_tbl SET Quentity = CASE WHEN Quentity < 6 THEN Quentity + 1 ELSE 6 END WHERE Cart_User_Id = " + uid + " AND Cart_Prod_Id = " + prdid, con);
                }
                else
                {
                    cmd = new SqlCommand(
                        "INSERT INTO cart_tbl (Cart_User_Id, Cart_Prod_Id, Quentity, AddedDate) " +
                        "VALUES (" + uid + ", " + prdid + ", 1, GETDATE())", con);
                }

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Product added to cart successfully')</script>");
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
