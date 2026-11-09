using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;


namespace CompanyProject
{
    public partial class admin_deshboard : System.Web.UI.Page
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

        void fillusers()
        {
            getCon();
            cmd = new SqlCommand("Select Count(*) from emp_tbl", con);
            int i = Convert.ToInt16(cmd.ExecuteScalar());
            lblTotalUsers.Text = i.ToString();

        }
        void fillproduct()
        {
            getCon();
            cmd = new SqlCommand("Select Count(*) from Add_Product_tbl", con);
            int i = Convert.ToInt16(cmd.ExecuteScalar());
            lblTotalProducts.Text = i.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
    }
}