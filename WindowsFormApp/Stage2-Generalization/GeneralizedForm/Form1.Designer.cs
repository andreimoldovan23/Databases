
namespace GeneralizedForm
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
            this.parentGrid = new System.Windows.Forms.DataGridView();
            this.childGrid = new System.Windows.Forms.DataGridView();
            this.parentLabel = new System.Windows.Forms.Label();
            this.childLabel = new System.Windows.Forms.Label();
            this.insertButton = new System.Windows.Forms.Button();
            this.updateButton = new System.Windows.Forms.Button();
            this.deleteButton = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.parentGrid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.childGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // parentGrid
            // 
            this.parentGrid.AllowUserToAddRows = false;
            this.parentGrid.AllowUserToDeleteRows = false;
            this.parentGrid.AllowUserToResizeColumns = false;
            this.parentGrid.AllowUserToResizeRows = false;
            this.parentGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.parentGrid.Location = new System.Drawing.Point(12, 37);
            this.parentGrid.MultiSelect = false;
            this.parentGrid.Name = "parentGrid";
            this.parentGrid.Size = new System.Drawing.Size(240, 273);
            this.parentGrid.TabIndex = 1;
            // 
            // childGrid
            // 
            this.childGrid.AllowUserToAddRows = false;
            this.childGrid.AllowUserToDeleteRows = false;
            this.childGrid.AllowUserToResizeColumns = false;
            this.childGrid.AllowUserToResizeRows = false;
            this.childGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.childGrid.Location = new System.Drawing.Point(538, 37);
            this.childGrid.MultiSelect = false;
            this.childGrid.Name = "childGrid";
            this.childGrid.Size = new System.Drawing.Size(240, 273);
            this.childGrid.TabIndex = 2;
            // 
            // parentLabel
            // 
            this.parentLabel.AutoSize = true;
            this.parentLabel.Location = new System.Drawing.Point(34, 21);
            this.parentLabel.Name = "parentLabel";
            this.parentLabel.Size = new System.Drawing.Size(35, 13);
            this.parentLabel.TabIndex = 3;
            this.parentLabel.Text = "label1";
            // 
            // childLabel
            // 
            this.childLabel.AutoSize = true;
            this.childLabel.Location = new System.Drawing.Point(562, 20);
            this.childLabel.Name = "childLabel";
            this.childLabel.Size = new System.Drawing.Size(35, 13);
            this.childLabel.TabIndex = 4;
            this.childLabel.Text = "label1";
            // 
            // insertButton
            // 
            this.insertButton.Location = new System.Drawing.Point(155, 346);
            this.insertButton.Name = "insertButton";
            this.insertButton.Size = new System.Drawing.Size(96, 41);
            this.insertButton.TabIndex = 5;
            this.insertButton.Text = "INSERT";
            this.insertButton.UseVisualStyleBackColor = true;
            this.insertButton.Click += new System.EventHandler(this.insertButton_Click_1);
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(352, 346);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(97, 41);
            this.updateButton.TabIndex = 6;
            this.updateButton.Text = "UPDATE";
            this.updateButton.UseVisualStyleBackColor = true;
            this.updateButton.Click += new System.EventHandler(this.updateButton_Click_1);
            // 
            // deleteButton
            // 
            this.deleteButton.Location = new System.Drawing.Point(538, 346);
            this.deleteButton.Name = "deleteButton";
            this.deleteButton.Size = new System.Drawing.Size(84, 41);
            this.deleteButton.TabIndex = 7;
            this.deleteButton.Text = "DELETE";
            this.deleteButton.UseVisualStyleBackColor = true;
            this.deleteButton.Click += new System.EventHandler(this.deleteButton_Click_1);
            // 
            // panel1
            // 
            this.panel1.Location = new System.Drawing.Point(296, 37);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(200, 273);
            this.panel1.TabIndex = 8;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.deleteButton);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.insertButton);
            this.Controls.Add(this.childLabel);
            this.Controls.Add(this.parentLabel);
            this.Controls.Add(this.childGrid);
            this.Controls.Add(this.parentGrid);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.parentGrid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.childGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView parentGrid;
        private System.Windows.Forms.DataGridView childGrid;
        private System.Windows.Forms.Label parentLabel;
        private System.Windows.Forms.Label childLabel;
        private System.Windows.Forms.Button insertButton;
        private System.Windows.Forms.Button updateButton;
        private System.Windows.Forms.Button deleteButton;
        private System.Windows.Forms.Panel panel1;
    }
}

