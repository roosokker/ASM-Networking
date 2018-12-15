namespace ServerSide
{
    partial class ServerSideForm
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
            this.msgLBL = new System.Windows.Forms.Label();
            this.btnStartServer = new System.Windows.Forms.Button();
            this.messageTextBox = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // msgLBL
            // 
            this.msgLBL.AutoSize = true;
            this.msgLBL.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.msgLBL.Location = new System.Drawing.Point(12, 92);
            this.msgLBL.Name = "msgLBL";
            this.msgLBL.Size = new System.Drawing.Size(179, 20);
            this.msgLBL.TabIndex = 0;
            this.msgLBL.Text = "Received Message: ";
            // 
            // btnStartServer
            // 
            this.btnStartServer.Location = new System.Drawing.Point(487, 210);
            this.btnStartServer.Name = "btnStartServer";
            this.btnStartServer.Size = new System.Drawing.Size(75, 28);
            this.btnStartServer.TabIndex = 1;
            this.btnStartServer.Text = "Start Server";
            this.btnStartServer.UseVisualStyleBackColor = true;
            this.btnStartServer.Click += new System.EventHandler(this.btnStartServer_Click);
            // 
            // messageTextBox
            // 
            this.messageTextBox.Enabled = false;
            this.messageTextBox.Location = new System.Drawing.Point(197, 12);
            this.messageTextBox.Multiline = true;
            this.messageTextBox.Name = "messageTextBox";
            this.messageTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.messageTextBox.Size = new System.Drawing.Size(365, 169);
            this.messageTextBox.TabIndex = 2;
            // 
            // ServerSideForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(590, 250);
            this.Controls.Add(this.messageTextBox);
            this.Controls.Add(this.btnStartServer);
            this.Controls.Add(this.msgLBL);
            this.Name = "ServerSideForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Server Side Form";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label msgLBL;
        private System.Windows.Forms.Button btnStartServer;
        private System.Windows.Forms.TextBox messageTextBox;
    }
}

