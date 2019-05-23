using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace UnitedWayInterface
{
    public partial class TestPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = getResults();
            GridView1.DataBind();

        }

        public List<Data_Layer.Customers> getResults() {
            var results = Data_Layer.Class1.GetList("C").ToList();
            return results;
        }
    }
}