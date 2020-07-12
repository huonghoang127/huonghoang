using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.Data.SqlClient;
using BaiTapLonLTUD;

namespace QLTSDH
{
    public partial class FrmDiemChuan : Form
    {
        public FrmDiemChuan()
        {
            InitializeComponent();
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();

        public void Load_DuLieu_DiemChuan()
        {
            DataTable dta = new DataTable();
            dta = ketnoi.loadDuLieu("Select * From DiemChuan");
            DataGridView_DiemChuan.DataSource = dta;
            Hienthi_Dulieu();
        }

        private void Hienthi_Dulieu()
        {
            txtMaNganh.DataBindings.Clear();
            txtMaNganh.DataBindings.Add("Text", DataGridView_DiemChuan.DataSource, "MaNganh");

            txtTenNganh.DataBindings.Clear();
            txtTenNganh.DataBindings.Add("Text", DataGridView_DiemChuan.DataSource, "TenNganh");

            txtDiemChuan.DataBindings.Clear();
            txtDiemChuan.DataBindings.Add("Text", DataGridView_DiemChuan.DataSource, "Diem");

        }


        private void FrmDiemChuan_Load(object sender, EventArgs e)
        {
            Load_DuLieu_DiemChuan();
            btnChen.Enabled = false;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult tb;
            tb = MessageBox.Show("Bạn có muốn thoát không?", "Cản Báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnTaoMoi_Click(object sender, EventArgs e)
        {
            txtMaNganh.Text = "";
            txtTenNganh.Text = "";
            txtDiemChuan.Text = "";
            txtMaNganh.Focus();
            btnChen.Enabled = true;
        }

        private void btnChen_Click(object sender, EventArgs e)
        {
            ketnoi.excute("INSERT INTO DiemChuan Values('" + txtMaNganh.Text + "','" + txtTenNganh.Text + "','" + txtDiemChuan.Text + "')");
            Load_DuLieu_DiemChuan();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                ketnoi.excute("Update DiemChuan Set TenNganh='" + txtTenNganh.Text + "',Diem='" + txtDiemChuan.Text + "' WHERE MaNganh='" + txtMaNganh.Text + "'");
                Load_DuLieu_DiemChuan();
            }
            catch
            {
                MessageBox.Show("Lỗi, không sửa được!");

            }
        }

       
    }
}
