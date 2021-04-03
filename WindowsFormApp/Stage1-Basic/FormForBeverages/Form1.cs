using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace FormForBeverages
{
    public partial class Form1 : Form
    {
        private SqlConnection connection;
        private SqlDataAdapter shopsAdapter, roastsAdapter;
        private DataSet data;
        private BindingSource shopsBinding, roastsBinding;

        public Form1()
        {
            InitializeComponent();
            LoadData();
        }
        
        private void LoadData()
        {
            connection = new SqlConnection(@"Data Source = DESKTOP-QGJ7006\SQLEXPRESS; Initial Catalog = CoffeeTrade; Integrated Security=True");
            shopsAdapter = new SqlDataAdapter();
            roastsAdapter = new SqlDataAdapter();
            data = new DataSet();
            shopsBinding = new BindingSource();
            roastsBinding = new BindingSource();
            LoadChanges();
        }

        private void LoadChanges()
        {
            Display();
            DataRelation foreignKey = new DataRelation("FK_SpecialtyRoast", data.Tables["Shop"].Columns["id"], data.Tables["SpecialtyRoast"].Columns["shopId"]);
            data.Relations.Add(foreignKey);
           
            shopsBinding.DataSource = data;
            shopsBinding.DataMember = "Shop";

            roastsBinding.DataSource = shopsBinding;
            roastsBinding.DataMember = "FK_SpecialtyRoast";

            parentTable.DataSource = shopsBinding;
            childTable.DataSource = roastsBinding;

            roastNameTextBox.DataBindings.Add("Text", roastsBinding, "name");
            roastGradeTextBox.DataBindings.Add("Text", roastsBinding, "roastingGrade");
            roastPriceTextBox.DataBindings.Add("Text", roastsBinding, "price");
            roastShopIdTextBox.DataBindings.Add("Text", roastsBinding, "shopId");
        }

        private void Display()
        {
            shopsAdapter.SelectCommand = new SqlCommand("select * from Shop", connection);
            roastsAdapter.SelectCommand = new SqlCommand("select * from SpecialtyRoast", connection);
            data.Clear();
            shopsAdapter.Fill(data, "Shop");
            roastsAdapter.Fill(data, "SpecialtyRoast");
        }

        private void insertButton_Click(object sender, EventArgs e)
        {
            try
            {
                roastsAdapter.InsertCommand = new SqlCommand("INSERT INTO SpecialtyRoast (name, roastingGrade, price, shopId) values (@name, @grade, @price, @shopId)",
                    connection);
                roastsAdapter.InsertCommand.Parameters.Add("@name", SqlDbType.VarChar).Value = roastNameTextBox.Text;
                roastsAdapter.InsertCommand.Parameters.Add("@grade", SqlDbType.Int).Value = Int32.Parse(roastGradeTextBox.Text);
                roastsAdapter.InsertCommand.Parameters.Add("@price", SqlDbType.Int).Value = Int32.Parse(roastPriceTextBox.Text);
                roastsAdapter.InsertCommand.Parameters.Add("@shopId", SqlDbType.Int).Value = Int32.Parse(roastShopIdTextBox.Text);

                connection.Open();
                roastsAdapter.InsertCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                connection.Close();
                Display();
            }
        }

        private void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                roastsAdapter.UpdateCommand = new SqlCommand("UPDATE SpecialtyRoast SET roastingGrade=@grade, price=@price, shopId=@shopId WHERE name=@name",
                    connection);
                roastsAdapter.UpdateCommand.Parameters.Add("@name", SqlDbType.VarChar).Value = roastNameTextBox.Text;
                roastsAdapter.UpdateCommand.Parameters.Add("@grade", SqlDbType.Int).Value = Int32.Parse(roastGradeTextBox.Text);
                roastsAdapter.UpdateCommand.Parameters.Add("@price", SqlDbType.Int).Value = Int32.Parse(roastPriceTextBox.Text);
                roastsAdapter.UpdateCommand.Parameters.Add("@shopId", SqlDbType.Int).Value = Int32.Parse(roastShopIdTextBox.Text);

                connection.Open();
                roastsAdapter.UpdateCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                connection.Close();
                Display();
            }
        }

        private void deleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                roastsAdapter.DeleteCommand = new SqlCommand("DELETE FROM SpecialtyRoast WHERE name=@name", connection);
                roastsAdapter.DeleteCommand.Parameters.Add("@name", SqlDbType.VarChar).Value = roastNameTextBox.Text;

                connection.Open();
                roastsAdapter.DeleteCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                connection.Close();
                Display();
            }
        }

    }
}
