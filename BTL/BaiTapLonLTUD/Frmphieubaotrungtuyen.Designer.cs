namespace BaiTapLonLTUD
{
    partial class Frmphieubaotrungtuyen
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Frmphieubaotrungtuyen));
            this.crpphieubao = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.SuspendLayout();
            // 
            // crpphieubao
            // 
            this.crpphieubao.ActiveViewIndex = -1;
            this.crpphieubao.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crpphieubao.Cursor = System.Windows.Forms.Cursors.Default;
            this.crpphieubao.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crpphieubao.Location = new System.Drawing.Point(0, 0);
            this.crpphieubao.Name = "crpphieubao";
            this.crpphieubao.Size = new System.Drawing.Size(800, 450);
            this.crpphieubao.TabIndex = 0;
            // 
            // Frmphieubaotrungtuyen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.crpphieubao);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Frmphieubaotrungtuyen";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Phiếu báo trúng tuyển";
            this.Load += new System.EventHandler(this.Frmphieubaotrungtuyen_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private CrystalDecisions.Windows.Forms.CrystalReportViewer crpphieubao;
    }
}