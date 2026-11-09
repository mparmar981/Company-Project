using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace CompanyProject
{
    public partial class login : System.Web.UI.Page
    {
        string conString = ConfigurationManager
            .ConnectionStrings["dbcon"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text.Trim();
            string email = txtemail.Text.Trim();

            if (username == "" || email == "")
            {
                Response.Write("<script>alert('Please enter Username and Email');</script>");
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();

                    string createTable = @"
                        IF NOT EXISTS
                        (
                            SELECT *
                            FROM sys.tables
                            WHERE name = 'lgn_tbl'
                        )
                        BEGIN
                            CREATE TABLE dbo.lgn_tbl
                            (
                                Id INT IDENTITY(1,1) PRIMARY KEY,
                                Username NVARCHAR(100) NOT NULL,
                                Email NVARCHAR(150) NOT NULL
                            )
                        END";

                    using (SqlCommand cmdCreate = new SqlCommand(createTable, con))
                    {
                        cmdCreate.ExecuteNonQuery();
                    }

                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM dbo.lgn_tbl
                        WHERE Username = @Username
                        AND Email = @Email";

                    int count;

                    using (SqlCommand cmdCheck = new SqlCommand(checkQuery, con))
                    {
                        cmdCheck.Parameters.AddWithValue("@Username", username);
                        cmdCheck.Parameters.AddWithValue("@Email", email);

                        count = Convert.ToInt32(cmdCheck.ExecuteScalar());
                    }

                    if (count == 0)
                    {
                        string insertQuery = @"
                            INSERT INTO dbo.lgn_tbl
                            (
                                Username,
                                Email
                            )
                            VALUES
                            (
                                @Username,
                                @Email
                            )";

                        using (SqlCommand cmdInsert = new SqlCommand(insertQuery, con))
                        {
                            cmdInsert.Parameters.AddWithValue("@Username", username);
                            cmdInsert.Parameters.AddWithValue("@Email", email);

                            cmdInsert.ExecuteNonQuery();
                        }
                    }

                    // Save session
                    Session["admin"] = username;

                    // Go to Add Company page
                    Response.Redirect("Add_Company.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Database Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');</script>"
                );
            }
        }
    }
}