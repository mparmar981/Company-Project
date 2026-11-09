using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyProject
{
    public partial class Add_To_Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        int uid;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            uid = Convert.ToInt32(Session["uid"]);

            if (!IsPostBack)
            {
                Label5.Text = "Welcome, " + Session["admin"].ToString();
                fillCart();
            }
        }

        void fillCart()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT c.Cart_Id, p.Prod_Id, p.Prod_Img, p.Prod_Name, p.Prod_Price, c.Quentity, " +
                "CONVERT(decimal(18,2), p.Prod_Price) * c.Quentity AS Total " +
                "FROM Add_Products_Tbl p INNER JOIN Cart_Tbl c ON p.Prod_Id = c.Cart_Prod_Id " +
                "WHERE c.Cart_User_Id = " + uid, con);

            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            GridView1.DataSource = ds;
            GridView1.DataBind();


            decimal grand = 0;
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["Total"] != DBNull.Value)
                {
                    grand = grand + Convert.ToDecimal(row["Total"]);
                }

            }
            lblGrand.Text = "₹" + grand.ToString("N2");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillCart();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillCart();
        }

        // select the current quantity in the dropdown when the row goes into edit mode
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlQty");
                string qty = DataBinder.Eval(e.Row.DataItem, "Quentity").ToString();

                if (ddl.Items.FindByValue(qty) != null)
                {
                    ddl.SelectedValue = qty;
                }
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DropDownList ddl = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlQty");
            int qty = Convert.ToInt32(ddl.SelectedValue);
            int cartId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            getCon();
            cmd = new SqlCommand("UPDATE cart_tbl SET Quentity = " + qty + " WHERE Cart_Id = " + cartId, con);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            fillCart();
        }
    }
}
