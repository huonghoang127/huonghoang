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
using System.Diagnostics;
using BaiTapLonLTUD;

namespace BTL_LTUD
{
    public partial class FrmNguyenVong : Form
    {
        public FrmNguyenVong()
        {
            InitializeComponent();
        }
        KetNoiCSDL KetNoi = new KetNoiCSDL();
        private void btnexit_Click(object sender, EventArgs e)
        {
            DialogResult thongbao;
            thongbao = MessageBox.Show("Bạn có muốn thoát không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (thongbao == DialogResult.Yes)
                this.Close();
        }

        private void btnnew_Click(object sender, EventArgs e)
        {
            txtmanv.Text = "";
            txtmahs.Text = "";
            txttenhs.Text = "";
            txtmanganh.Text = "";
            txttennganh.Text = "";
            txtthutunv.Text = "";
            btnadd.Enabled = true;
        }
        public void Load_NguyenVong()
        {
            DataTable dta = new DataTable();
            dta = KetNoi.loadDuLieu ("Select * From NguyenVong");
            Grid_NguyenVong.DataSource = dta;
            Hienthi_Dulieu();
        }
        private void Hienthi_Dulieu()
        {
            txtmanv.DataBindings.Clear();
            txtmanv.DataBindings.Add("Text", Grid_NguyenVong.DataSource, "MaNV");

            txtmahs.DataBindings.Clear();
            txtmahs.DataBindings.Add("Text", Grid_NguyenVong.DataSource, "MaHS");

            txttenhs.DataBindings.Clear();
            txttenhs.DataBindings.Add("Text", Grid_NguyenVong.DataSource, "TenHS");

            txtmanganh.DataBindings.Clear();
            txtmanganh.DataBindings.Add("Text", Grid_NguyenVong.DataSource, "MaNganh");

            txttennganh.DataBindings.Clear();
            txttennganh.DataBindings.Add("Text", Grid_NguyenVong.DataSource, "TenNganh");

            txtthutunv.DataBindings.Clear();
            txtthutunv.DataBindings.Add("Text", Grid_NguyenVong.DataSource, "ThuTuNV");


        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                KetNoi.excute("Insert into NguyenVong Values('" + txtmanv.Text + "','" + txtmahs.Text + "','" + txttenhs.Text + "','" + txtmanganh.Text + "','" + txttennganh.Text + "','" + txtthutunv.Text + "')");
                Load_NguyenVong();
            }
            catch
            {
                MessageBox.Show("Lỗi, không thêm được!");
            }
        }

        private void btnedit_Click(object sender, EventArgs e)
        {
            try
            {
                KetNoi.excute("Update NguyenVong Set MaHS ='" + txtmahs.Text + "', TenHS ='" + txttenhs.Text + "', MaNganh ='" + txtmanganh.Text + "',TenNganh='" + txttennganh.Text + "', ThuTuNV='" + txtthutunv.Text + "' where MaNV= '" + txtmanv.Text + "'");
                Load_NguyenVong();
            }
            catch
            {
                MessageBox.Show("Lỗi, không sửa được!");
            }
        }

        private void btndelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn có chắc chắn muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
                {
                    Process.Start("Xoa");
                }
                KetNoi.excute("Delete NguyenVong Where MaNV ='" + txtmanv.Text + "'");
                Load_NguyenVong();
            }
            catch
            {
                MessageBox.Show("Lỗi, không xóa được!");
            }
        }

        private void FrmNguyenVong_Load(object sender, EventArgs e)
        {
            Load_NguyenVong();
            btnadd.Enabled = false;
        }
    }
}
