using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BaiTapLonLTUD
{
    public partial class frmNhapThiSinh : Form
    {
        public frmNhapThiSinh()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult tb;
            tb = MessageBox.Show("Bạn có muốn thoát không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                this.Close();
            }
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                string sql1, sql2;
                sql1 = "INSERT INTO HocSinh VALUES (";
                sql2 = sql1 + "N'" + txtMaSV.Text + "',N'" + txtHoTen.Text + "',N'" + cboGioiTinh.Text + "',N'" + txtCMTND.Text + "',CAST(N'" + txtNgaysinh.Text + "' AS Date),N'" + txtNoiSinh.Text + "',N'" + txtDanToc.Text + "',N'" + txtHoKhau.Text + "',N'" + txtSoDT.Text + "',N'" + txtMaTinh.Text + "',N'" + txtMaHuyen.Text + "',N'" + txtMaTruong.Text + "',N'" + txtKhoiThi.Text + "',N'" + txtNamTotNghiep.Text + "',CAST(N'" + txtNgayNopDon.Text + "' AS Date))";
                ketnoi.excute(sql2);
                MessageBox.Show("Đã thêm học sinh "+txtHoTen.Text +" thành công!");
            }
            catch (Exception)
            {
                MessageBox.Show("Học sinh"+txtHoTen.Text+ "đã tồn tại");
            }
        }

    }
}