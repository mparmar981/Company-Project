using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CompanyProject
{
    public partial class show_company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager
                    .ConnectionStrings["dbcon"]
                    .ConnectionString;

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

            if (!IsPostBack)
            {
                Label1.Text = "Welcome, " + Session["admin"].ToString();

                filldataList();
            }
        }

        void filldataList()
        {
            getCon();

            string query = "SELECT * FROM Add_Company_Tbl";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();

            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

            con.Close();
        }

        protected void DataList1_ItemCommand(
            object source,
            DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_company")
            {
                string companyId = e.CommandArgument.ToString();

                Response.Redirect(
                    "show_product.aspx?cid=" + companyId
                );
            }
        }
    }
}
