using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            refreshdata();
        }
    }

    public void refreshdata()
    {
        SqlConnection con = new SqlConnection(@"Data Source=dbgd.ccbtwzc0fvsf.ap-south-1.rds.amazonaws.com,1433;Initial Catalog=DPF;User ID=aws; Password=skc12345");
        con.Open();
        SqlCommand cmd = new SqlCommand("select Item,ItemDescription,Amount,Remark from tblkpmg", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
 
   }


    protected void chckchanged(object sender, EventArgs e)
    {
        CheckBox chckheader = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox1");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chckrw = (CheckBox)row.FindControl("CheckBox2");

            if (chckheader.Checked == true)
            {
                chckrw.Checked = true;
            }
            else
            {
                chckrw.Checked = false;
            }
        }
    
    }

    protected void Update_Click(object sender, EventArgs e)
    {

        
            foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chckrw = (CheckBox)row.FindControl("CheckBox2");
            TextBox amt = (TextBox)row.FindControl("txtamount");
            TextBox Remark = (TextBox)row.FindControl("txtRemark");
            GridViewRow rows = GridView1.SelectedRow;

            // And you respective cell's value
            string item = row.Cells[1].Text;
            if (chckrw.Checked == true)
            {
                
                update(Convert.ToInt32(amt.Text),Remark.Text,item);
            }
            
        }

    }

    private void update(int amount , string Remark, string Item)
    {
        SqlConnection con = new SqlConnection(@"Data Source=dbgd.ccbtwzc0fvsf.ap-south-1.rds.amazonaws.com,1433;Initial Catalog=DPF;User ID=aws; Password=skc12345");
        con.Open();
        string qry = "update tblkpmg set Amount=" + amount + " , Remark='" + Remark + "' where Item='" + Item + "'";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.ExecuteNonQuery();
        con.Close();

    }
}