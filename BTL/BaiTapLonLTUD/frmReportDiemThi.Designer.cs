namespace BaiTapLonLTUD
{
    partial class frmReportDiemThi
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmReportDiemThi));
            this.crs_BaoCaoDiem = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.SuspendLayout();
            // 
            // crs_BaoCaoDiem
            // 
            this.crs_BaoCaoDiem.ActiveViewIndex = -1;
            this.crs_BaoCaoDiem.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crs_BaoCaoDiem.Cursor = System.Windows.Forms.Cursors.Default;
            this.crs_BaoCaoDiem.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crs_BaoCaoDiem.Location = new System.Drawing.Point(0, 0);
            this.crs_BaoCaoDiem.Name = "crs_BaoCaoDiem";
            this.crs_BaoCaoDiem.Size = new System.Drawing.Size(800, 450);
            this.crs_BaoCaoDiem.TabIndex = 0;
            // 
            // frmReportDiemThi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.crs_BaoCaoDiem);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmReportDiemThi";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Danh sách điểm thi";
            this.Load += new System.EventHandler(this.frmReportDiemThi_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private CrystalDecisions.Windows.Forms.CrystalReportViewer crs_BaoCaoDiem;
    }
}