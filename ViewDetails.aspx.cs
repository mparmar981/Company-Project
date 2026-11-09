using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.UI.WebControls;

namespace CompanyProject
{
    public partial class ViewDetails : System.Web.UI.Page
    {

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillDataList()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT * FROM Add_Products_Tbl where Prod_Id = '" + Request.QueryString["pid"] + "'",
                con
            );

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                Label4.Text =
                    "Welcome, " + Session["admin"].ToString();

                fillDataList();
            }
        }
    }
}
