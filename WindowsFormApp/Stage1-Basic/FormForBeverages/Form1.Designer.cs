
namespace FormForBeverages
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.childTable = new System.Windows.Forms.DataGridView();
            this.parentTable = new System.Windows.Forms.DataGridView();
            this.roastNameLabel = new System.Windows.Forms.Label();
            this.roastGradeLabel = new System.Windows.Forms.Label();
            this.roastPriceLabel = new System.Windows.Forms.Label();
            this.roastShopIdLabel = new System.Windows.Forms.Label();
            this.roastNameTextBox = new System.Windows.Forms.TextBox();
            this.roastGradeTextBox = new System.Windows.Forms.TextBox();
            this.roastPriceTextBox = new System.Windows.Forms.TextBox();
            this.roastShopIdTextBox = new System.Windows.Forms.TextBox();
            this.shopLabel = new System.Windows.Forms.Label();
            this.specialtyRoastsLabel = new System.Windows.Forms.Label();
            this.insertButton = new System.Windows.Forms.Button();
            this.updateButton = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.childTable)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.parentTable)).BeginInit();
            this.SuspendLayout();
            // 
            // childTable
            // 
            this.childTable.AllowUserToAddRows = false;
            this.childTable.AllowUserToDeleteRows = false;
            this.childTable.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.childTable.Location = new System.Drawing.Point(504, 28);
            this.childTable.Name = "childTable";
            this.childTable.ReadOnly = true;
            this.childTable.Size = new System.Drawing.Size(284, 297);
            this.childTable.TabIndex = 0;
            // 
            // parentTable
            // 
            this.parentTable.AllowUserToAddRows = false;
            this.parentTable.AllowUserToDeleteRows = false;
            this.parentTable.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.parentTable.Location = new System.Drawing.Point(12, 28);
            this.parentTable.Name = "parentTable";
            this.parentTable.ReadOnly = true;
            this.parentTable.Size = new System.Drawing.Size(283, 297);
            this.parentTable.TabIndex = 1;
            // 
            // roastNameLabel
            // 
            this.roastNameLabel.AutoSize = true;
            this.roastNameLabel.Location = new System.Drawing.Point(312, 12);
            this.roastNameLabel.Name = "roastNameLabel";
            this.roastNameLabel.Size = new System.Drawing.Size(35, 13);
            this.roastNameLabel.TabIndex = 2;
            this.roastNameLabel.Text = "Name";
            // 
            // roastGradeLabel
            // 
            this.roastGradeLabel.AutoSize = true;
            this.roastGradeLabel.Location = new System.Drawing.Point(312, 61);
            this.roastGradeLabel.Name = "roastGradeLabel";
            this.roastGradeLabel.Size = new System.Drawing.Size(36, 13);
            this.roastGradeLabel.TabIndex = 3;
            this.roastGradeLabel.Text = "Grade";
            // 
            // roastPriceLabel
            // 
            this.roastPriceLabel.AutoSize = true;
            this.roastPriceLabel.Location = new System.Drawing.Point(312, 115);
            this.roastPriceLabel.Name = "roastPriceLabel";
            this.roastPriceLabel.Size = new System.Drawing.Size(31, 13);
            this.roastPriceLabel.TabIndex = 4;
            this.roastPriceLabel.Text = "Price";
            // 
            // roastShopIdLabel
            // 
            this.roastShopIdLabel.AutoSize = true;
            this.roastShopIdLabel.Location = new System.Drawing.Point(312, 165);
            this.roastShopIdLabel.Name = "roastShopIdLabel";
            this.roastShopIdLabel.Size = new System.Drawing.Size(41, 13);
            this.roastShopIdLabel.TabIndex = 5;
            this.roastShopIdLabel.Text = "ShopId";
            // 
            // roastNameTextBox
            // 
            this.roastNameTextBox.Location = new System.Drawing.Point(315, 28);
            this.roastNameTextBox.Name = "roastNameTextBox";
            this.roastNameTextBox.Size = new System.Drawing.Size(159, 20);
            this.roastNameTextBox.TabIndex = 6;
            // 
            // roastGradeTextBox
            // 
            this.roastGradeTextBox.Location = new System.Drawing.Point(315, 77);
            this.roastGradeTextBox.Name = "roastGradeTextBox";
            this.roastGradeTextBox.Size = new System.Drawing.Size(159, 20);
            this.roastGradeTextBox.TabIndex = 7;
            // 
            // roastPriceTextBox
            // 
            this.roastPriceTextBox.Location = new System.Drawing.Point(315, 131);
            this.roastPriceTextBox.Name = "roastPriceTextBox";
            this.roastPriceTextBox.Size = new System.Drawing.Size(159, 20);
            this.roastPriceTextBox.TabIndex = 8;
            // 
            // roastShopIdTextBox
            // 
            this.roastShopIdTextBox.Location = new System.Drawing.Point(315, 181);
            this.roastShopIdTextBox.Name = "roastShopIdTextBox";
            this.roastShopIdTextBox.Size = new System.Drawing.Size(159, 20);
            this.roastShopIdTextBox.TabIndex = 9;
            // 
            // shopLabel
            // 
            this.shopLabel.AutoSize = true;
            this.shopLabel.Location = new System.Drawing.Point(43, 9);
            this.shopLabel.Name = "shopLabel";
            this.shopLabel.Size = new System.Drawing.Size(77, 13);
            this.shopLabel.TabIndex = 10;
            this.shopLabel.Text = "Shops (Parent)";
            // 
            // specialtyRoastsLabel
            // 
            this.specialtyRoastsLabel.AutoSize = true;
            this.specialtyRoastsLabel.Location = new System.Drawing.Point(536, 9);
            this.specialtyRoastsLabel.Name = "specialtyRoastsLabel";
            this.specialtyRoastsLabel.Size = new System.Drawing.Size(115, 13);
            this.specialtyRoastsLabel.TabIndex = 11;
            this.specialtyRoastsLabel.Text = "SpecialtyRoasts (Child)";
            // 
            // insertButton
            // 
            this.insertButton.Location = new System.Drawing.Point(210, 358);
            this.insertButton.Name = "insertButton";
            this.insertButton.Size = new System.Drawing.Size(85, 34);
            this.insertButton.TabIndex = 12;
            this.insertButton.Text = "INSERT";
            this.insertButton.UseVisualStyleBackColor = true;
            this.insertButton.Click += new System.EventHandler(this.insertButton_Click);
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(361, 358);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(86, 34);
            this.updateButton.TabIndex = 13;
            this.updateButton.Text = "UPDATE";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.updateButton_Click);
            // 
            // deleteButton
            // 
            this.deleteButton.Location = new System.Drawing.Point(504, 358);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(75, 34);
            this.deleteButton.TabIndex = 14;
            this.deleteButton.Text = "DELETE";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.deleteButton_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.insertButton);
            this.Controls.Add(this.specialtyRoastsLabel);
            this.Controls.Add(this.shopLabel);
            this.Controls.Add(this.roastShopIdTextBox);
            this.Controls.Add(this.roastPriceTextBox);
            this.Controls.Add(this.roastGradeTextBox);
            this.Controls.Add(this.roastNameTextBox);
            this.Controls.Add(this.roastShopIdLabel);
            this.Controls.Add(this.roastPriceLabel);
            this.Controls.Add(this.roastGradeLabel);
            this.Controls.Add(this.roastNameLabel);
            this.Controls.Add(this.parentTable);
            this.Controls.Add(this.childTable);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.childTable)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.parentTable)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView childTable;
        private System.Windows.Forms.DataGridView parentTable;
        private System.Windows.Forms.Label roastNameLabel;
        private System.Windows.Forms.Label roastGradeLabel;
        private System.Windows.Forms.Label roastPriceLabel;
        private System.Windows.Forms.Label roastShopIdLabel;
        private System.Windows.Forms.TextBox roastNameTextBox;
        private System.Windows.Forms.TextBox roastGradeTextBox;
        private System.Windows.Forms.TextBox roastPriceTextBox;
        private System.Windows.Forms.TextBox roastShopIdTextBox;
        private System.Windows.Forms.Label shopLabel;
        private System.Windows.Forms.Label specialtyRoastsLabel;
        private System.Windows.Forms.Button insertButton;
        private System.Windows.Forms.Button updateButton;
        private System.Windows.Forms.Button deleteButton;
    }
}

