using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UnitedWayInterface
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DropDownList1.SelectedValue = "4";
                Session["CustomSuppressionSession"] = "";
                // changed 5/17/2109
                //took out to have the grid bind in designer mode so that paging works 
                //doesnt load each time a new drop down is selected


                // GridView1.DataSource = getResults();
                //GridView1.DataBind(); 
            }
        }


        /*public List<Data_Layer.Customers> getResults()
        {
            var results = Data_Layer.Class1.GetList("C").ToList();
            return results;
        }
        */

        protected void Button1_Click(object sender, EventArgs e)
        {
            // grid view 2 is set to false, this statement is to change which grid is seen in the user UI
            if (DropDownList1.SelectedValue == "1" )
            {
                //Custom Suppresion
                string selectedSup = "";
                //loop through checkbox list and create a string 
                foreach (ListItem listItem in CheckBoxList1.Items)
                {                  

                    if (listItem.Selected)
                    {
                        selectedSup = selectedSup +","+listItem.Value;
                    }
                    else
                    {
                        //do something else 
                    }
                }
                Session["CustomSuppressionSession"] = selectedSup;
                string testVar = Session["CustomSuppressionSession"].ToString();
                                             
                GridView1.Visible = false;
                GridView2.Visible = true;
            }
            else
            {
              

            }
            
           
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //enable and disable the update button based on dropdowlist value
            if (DropDownList1.SelectedValue == "1")
            {
                //Custom Suppresion
                Button1.Enabled = true;
                GridView1.Visible = false;
            }
            else
            {
                Button1.Enabled = false;
                GridView1.Visible = true;
                GridView2.Visible = false;
            }
        }
    }
}