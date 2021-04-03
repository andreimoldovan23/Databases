using System;
using System.Data;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace GeneralizedForm
{
    public partial class Form1 : Form
    {
        private SqlConnection connection;
        private SqlDataAdapter parentAdapter, childAdapter;
        private DataSet data;
        private BindingSource parentBinding, childBinding;
        private string selectFromParent = ConfigurationManager.AppSettings["selectFromParent"];
        private string selectFromChild = ConfigurationManager.AppSettings["selectFromChild"];
        private string parentTableName = ConfigurationManager.AppSettings["parentTableName"];
        private string childTableName = ConfigurationManager.AppSettings["childTableName"];
        private string connectString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        private string foreignKeyConstraint = ConfigurationManager.AppSettings["foreignKeyConstraint"];
        private string parentPK = ConfigurationManager.AppSettings["parentPK"];
        private string childFK = ConfigurationManager.AppSettings["childFK"];
        private string insertCommand = ConfigurationManager.AppSettings["insert"];
        private string updateCommand = ConfigurationManager.AppSettings["update"];
        private string deleteCommand = ConfigurationManager.AppSettings["delete"];
        private string childPK = ConfigurationManager.AppSettings["childPK"];
        private List<string> columnNamesList = new List<string>(ConfigurationManager.AppSettings["childColumnNames"].Split(','));


        public Form1()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            GenerateGridLabels();
            GenerateTextBoxes();
            connection = new SqlConnection(connectString);
            parentAdapter = new SqlDataAdapter();
            childAdapter = new SqlDataAdapter();
            data = new DataSet();
            parentBinding = new BindingSource();
            childBinding = new BindingSource();
            LoadChanges();
        }

        private void GenerateTextBoxes()
        {
            int x = 0;
            int y = 0;
            panel1.Controls.Clear();

            foreach(string column in columnNamesList)
            {
                TextBox box = new TextBox();
                Label label = new Label();
                label.Text = column;
                box.Name = column + "TextBox";
                panel1.Controls.Add(label);
                panel1.Controls.Add(box);
                label.Location = new System.Drawing.Point(x, y);
                box.Location = new System.Drawing.Point(x, y + 23);
                label.Visible = true;
                box.Visible = true;
                panel1.Show();
                y += 50;
            }
        }

        private void GenerateGridLabels()
        {
            childLabel.Text = childTableName + " (Child)";
            parentLabel.Text = parentTableName + " (Parent)";
        }

        private void LoadChanges()
        {
            Display();
            DataRelation foreignKey = new DataRelation(foreignKeyConstraint, data.Tables[parentTableName].Columns[parentPK], data.Tables[childTableName].Columns[childFK]);
            data.Relations.Add(foreignKey);

            parentBinding.DataSource = data;
            parentBinding.DataMember = parentTableName;

            childBinding.DataSource = parentBinding;
            childBinding.DataMember = foreignKeyConstraint;

            parentGrid.DataSource = parentBinding;
            childGrid.DataSource = childBinding;

            foreach (string column in columnNamesList)
            {
                TextBox text = (TextBox)panel1.Controls[column + "TextBox"];
                text.DataBindings.Add("Text", childBinding, column);
            }
        }

        private void Display()
        {
            parentAdapter.SelectCommand = new SqlCommand(selectFromParent, connection);
            childAdapter.SelectCommand = new SqlCommand(selectFromChild, connection);
            data.Clear();
            parentAdapter.Fill(data, parentTableName);
            childAdapter.Fill(data, childTableName);
        }

        private void addParameterToCommand(SqlCommand command, string columnName, TextBox box)
        {
            string type = ConfigurationManager.AppSettings[columnName];
            if (type == "text")
                command.Parameters.Add("@" + columnName, SqlDbType.VarChar).Value = box.Text;
            else
                command.Parameters.Add("@" + columnName, SqlDbType.Int).Value = Int32.Parse(box.Text);
        }

        private void insertButton_Click_1(object sender, EventArgs e)
        {
            try
            {
                childAdapter.InsertCommand = new SqlCommand(insertCommand, connection);
                foreach (string column in columnNamesList)
                {
                    TextBox text = (TextBox)panel1.Controls[column + "TextBox"];
                    addParameterToCommand(childAdapter.InsertCommand, column, text);
                }

                connection.Open();
                childAdapter.InsertCommand.ExecuteNonQuery();
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

        private void deleteButton_Click_1(object sender, EventArgs e)
        {
            try
            {
                childAdapter.DeleteCommand = new SqlCommand(deleteCommand, connection);
                TextBox text = (TextBox)panel1.Controls[childPK + "TextBox"];
                addParameterToCommand(childAdapter.DeleteCommand, childPK, text);

                connection.Open();
                childAdapter.DeleteCommand.ExecuteNonQuery();
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

        private void updateButton_Click_1(object sender, EventArgs e)
        {
            try
            {
                childAdapter.UpdateCommand = new SqlCommand(updateCommand, connection);
                foreach (string column in columnNamesList)
                {
                    TextBox text = (TextBox)panel1.Controls[column + "TextBox"];
                    addParameterToCommand(childAdapter.UpdateCommand, column, text);
                }

                connection.Open();
                childAdapter.UpdateCommand.ExecuteNonQuery();
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
