using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;


        void getCon()
        {

            con = new SqlConnection(s);
            con.Open();

        }
        public void fileUpload()
        {
            fnm = "images/" + imgupload.FileName;
            imgupload.SaveAs(Server.MapPath(fnm));
        }


        void fillGrid()
        {
            getCon();
            da = new SqlDataAdapter("Select * from emp_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        public void clear()
        {
            txtusername.Text = string.Empty;
            txtaddress.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtmbl.Text = string.Empty;
            rdogen.SelectedIndex = -1;
            drpcity.SelectedIndex = -1;


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getCon();
            fillGrid();

        }

        void fillData()
        {
            getCon();
            da = new SqlDataAdapter("select * from emp_tbl where Id ='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);


            txtusername.Text = ds.Tables[0].Rows[0]["Name"].ToString();


            if (ds.Tables[0].Rows[0]["Gender"].ToString() == "Male")
            {
                rdogen.SelectedValue = "Male";
            }
            else
            {
                rdogen.SelectedValue = "Female";
            }
            txtemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            drpcity.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
            txtaddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();


        }

        protected void Save_btn_Click(object sender, EventArgs e)
        {
            if (Save_btn.Text == "Save")
            {
                getCon();
                fileUpload();
                string command = "insert into emp_tbl(Name,Gender,Email,City,Address,Mobile,Image) values('" + txtusername.Text + "','" + rdogen.SelectedValue + "','" + txtemail.Text + "','" + drpcity.SelectedValue + "','" + txtaddress.Text + "','" + txtmbl.Text + "','" + fnm + "')";
                cmd = new SqlCommand(command, con);
                cmd.ExecuteNonQuery();
                fillGrid();
                Response.Write("Data Inserted Successfully");
                clear();
            }
            else
            {
                getCon();
                cmd = new SqlCommand("update emp_tbl set Name='" + txtusername.Text + "',Gender='" + rdogen.SelectedValue + "',Email='" + txtemail.Text + "',City='" + drpcity.SelectedValue + "',Address='" + txtaddress.Text + "',Mobile='" + txtmbl.Text + "' where Id='" + ViewState["id"] + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
                clear();
                Response.Write("Data Edited Successfully");
                Save_btn.Text = "Save";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                Save_btn.Text = "Update";
                fillData();
            }
            else
            {
                getCon();
                cmd = new SqlCommand("delete from emp_tbl where Id = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
                Response.Write("Data Deleted Successfully");
            }
        }
    }
}
