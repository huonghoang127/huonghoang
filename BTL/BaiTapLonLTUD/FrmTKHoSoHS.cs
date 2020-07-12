using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using BaiTapLonLTUD;

namespace BTL_LTUD
{
    public partial class FrmTKHoSoHS : Form
    {
        public FrmTKHoSoHS()
        {
            InitializeComponent();
        }

        KetNoiCSDL ketnoi = new KetNoiCSDL();

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult thongbao;
            thongbao = MessageBox.Show("Bạn có muốn thoát không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (thongbao == DialogResult.Yes)
                this.Close();
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            Grid_KQ.DataSource = null;
            if (radMaHS.Checked == true)
            {
                string sqlTK = "Select * From HocSinh where MaHS like '%" + txtMaHS.Text + "%'";
                                                                                                  
                data = ketnoi.loadDuLieu(sqlTK);
                Grid_KQ.DataSource = data;
            }
            if(radCMTND.Checked==true)
            {
                string sqlTK = "Select * From HocSinh where CMND like '%" + txtCMTND.Text + "%'";
                                                                                                
                data = ketnoi.loadDuLieu(sqlTK);
                Grid_KQ.DataSource = data;
            }
        }

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmTKHoSoHS));
            this.label1 = new System.Windows.Forms.Label();
            this.radMaHS = new System.Windows.Forms.RadioButton();
            this.radCMTND = new System.Windows.Forms.RadioButton();
            this.txtMaHS = new System.Windows.Forms.TextBox();
            this.txtCMTND = new System.Windows.Forms.TextBox();
            this.Grid_KQ = new System.Windows.Forms.DataGridView();
            this.btnThoat = new System.Windows.Forms.Button();
            this.btntimkiem = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Grid_KQ)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(506, 27);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(427, 35);
            this.label1.TabIndex = 1;
            this.label1.Text = "TÌM KIẾM HỒ SƠ HỌC SINH";
            // 
            // radMaHS
            // 
            this.radMaHS.AutoSize = true;
            this.radMaHS.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radMaHS.Location = new System.Drawing.Point(193, 118);
            this.radMaHS.Margin = new System.Windows.Forms.Padding(4);
            this.radMaHS.Name = "radMaHS";
            this.radMaHS.Size = new System.Drawing.Size(316, 31);
            this.radMaHS.TabIndex = 2;
            this.radMaHS.TabStop = true;
            this.radMaHS.Text = "Tìm kiếm theo Mã Học Sinh :";
            this.radMaHS.UseVisualStyleBackColor = true;
            // 
            // radCMTND
            // 
            this.radCMTND.AutoSize = true;
            this.radCMTND.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radCMTND.Location = new System.Drawing.Point(193, 167);
            this.radCMTND.Margin = new System.Windows.Forms.Padding(4);
            this.radCMTND.Name = "radCMTND";
            this.radCMTND.Size = new System.Drawing.Size(275, 31);
            this.radCMTND.TabIndex = 3;
            this.radCMTND.TabStop = true;
            this.radCMTND.Text = "Tìm kiếm theo CMTND :";
            this.radCMTND.UseVisualStyleBackColor = true;
            // 
            // txtMaHS
            // 
            this.txtMaHS.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaHS.Location = new System.Drawing.Point(542, 115);
            this.txtMaHS.Margin = new System.Windows.Forms.Padding(4);
            this.txtMaHS.Name = "txtMaHS";
            this.txtMaHS.Size = new System.Drawing.Size(367, 34);
            this.txtMaHS.TabIndex = 4;
            // 
            // txtCMTND
            // 
            this.txtCMTND.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCMTND.Location = new System.Drawing.Point(542, 172);
            this.txtCMTND.Margin = new System.Windows.Forms.Padding(4);
            this.txtCMTND.Name = "txtCMTND";
            this.txtCMTND.Size = new System.Drawing.Size(367, 34);
            this.txtCMTND.TabIndex = 5;
            // 
            // Grid_KQ
            // 
            this.Grid_KQ.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Grid_KQ.Location = new System.Drawing.Point(130, 259);
            this.Grid_KQ.Margin = new System.Windows.Forms.Padding(4);
            this.Grid_KQ.Name = "Grid_KQ";
            this.Grid_KQ.RowHeadersWidth = 51;
            this.Grid_KQ.Size = new System.Drawing.Size(1095, 289);
            this.Grid_KQ.TabIndex = 6;
            // 
            // btnThoat
            // 
            this.btnThoat.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.Location = new System.Drawing.Point(1190, 144);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(132, 37);
            this.btnThoat.TabIndex = 8;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btntimkiem
            // 
            this.btntimkiem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btntimkiem.Location = new System.Drawing.Point(1005, 144);
            this.btntimkiem.Margin = new System.Windows.Forms.Padding(4);
            this.btntimkiem.Name = "btntimkiem";
            this.btntimkiem.Size = new System.Drawing.Size(139, 37);
            this.btntimkiem.TabIndex = 7;
            this.btntimkiem.Text = "Tìm kiếm";
            this.btntimkiem.UseVisualStyleBackColor = true;
            this.btntimkiem.Click += new System.EventHandler(this.btntimkiem_Click);
            // 
            // FrmTKHoSoHS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1385, 598);
            this.ControlBox = false;
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.btntimkiem);
            this.Controls.Add(this.Grid_KQ);
            this.Controls.Add(this.txtCMTND);
            this.Controls.Add(this.txtMaHS);
            this.Controls.Add(this.radCMTND);
            this.Controls.Add(this.radMaHS);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FrmTKHoSoHS";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Tìm Kiếm Hồ Sơ Học Sinh";
            ((System.ComponentModel.ISupportInitialize)(this.Grid_KQ)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
     private System.Windows.Forms.Label label1;
     private System.Windows.Forms.RadioButton radMaHS;
     private System.Windows.Forms.RadioButton radCMTND;
     private System.Windows.Forms.TextBox txtMaHS;
     private System.Windows.Forms.TextBox txtCMTND;
     private System.Windows.Forms.DataGridView Grid_KQ;
     private System.Windows.Forms.Button btnThoat;
     private System.Windows.Forms.Button btntimkiem;

    }

}
