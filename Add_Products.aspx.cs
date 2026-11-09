using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;
using System.IO.IsolatedStorage;
using System.IO.MemoryMappedFiles;
using System.IO.Compression;

namespace CompanyProject
{
    public partial class Add_Products : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm, nm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("show_company.aspx");
        }

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            drpcmp.Text = string.Empty;
            txtmodel.Text = string.Empty;
            txtweight.Text = string.Empty;
            txtconfig.Text = string.Empty;
            txtprice.Text = string.Empty;
        }

        string fileUpload()
        {
            fnm = "~/Prod_image/" + imgUpload.FileName;
            imgUpload.SaveAs(Server.MapPath(fnm));
            return fnm;
        }
        void fillCombo()
        {
            getCon();
            da = new SqlDataAdapter("Select * from Add_Company_Tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                drpcmp.Items.Add(ds.Tables[0].Rows[i]["Comp_Name"].ToString());
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            getCon();
            fileUpload();
            da = new SqlDataAdapter("select * from Add_Company_Tbl where Comp_Name='" + drpcmp.SelectedItem + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            int cid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            ViewState["cid"] = cid;
            cmd = new SqlCommand("insert into Add_Products_Tbl(Prod_Comp_Id,Prod_Name,Prod_Model,Prod_Desc,Prod_Weight,Prod_Config,Prod_Img,Prod_Price) values ('" + ViewState["cid"] + "','" + txtpnm.Text + "','" + txtmodel.Text + "','" + txtdesc.Text + "','" + txtweight.Text + "','" + txtconfig.Text + "','" + fnm + "','" + txtprice.Text + "')", con); cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Product Added Successfully')</script>");
            clear();
        }

        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                fillCombo();
            }

            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, " + Session["admin"].ToString();
            }
        }
    }
}
