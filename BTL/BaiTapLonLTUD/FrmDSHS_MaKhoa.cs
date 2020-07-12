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
using System.Diagnostics;
using BaiTapLonLTUD;

namespace FrmTraDiem
{
    public partial class FrmDSHS_MaKhoa : Form
    {
        public FrmDSHS_MaKhoa()
        {
            InitializeComponent();
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();

        private void Load_DSHS()
        {
            DataTable dta = new DataTable();
            dta = ketnoi.loadDuLieu("SELECT p.MaHS AS 'Mã HS', p.TenHS AS 'Tên HS', p.Mon1 AS 'Môn 1', p.Mon2 AS 'Môn 2', p.Mon3 AS 'Môn 3', u.DiemUuTien AS 'Điểm Ưu Tiên', p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien AS 'Tổng Điểm', d.MaNganh AS 'Mã Ngành', d.TenNganh AS 'Tên Ngành', d.Diem AS 'Điểm chuẩn', n.ThuTuNV as 'Thứ tự NV' FROM dbo.PhieuBaoDiem AS p, dbo.DiemChuan AS d, dbo.NguyenVong AS n, dbo.DoUuTien AS u WHERE p.MaHS = n.MaHS AND p.MaHS = u.MaHS AND d.MaNganh = n.MaNganh AND p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien >= d.Diem ");
            Grid_DSHS.DataSource = dta;
            HienThi_DuLieu();
        }
        private void FrmDSHS_MaKhoa_Load(object sender, EventArgs e)
        {
            Load_DSHS();
        }
        private void HienThi_DuLieu()
        {
            txtMaHS.DataBindings.Clear();
            txtMaHS.DataBindings.Add("Text", Grid_DSHS.DataSource, "Mã HS");

            txtThuTuNV.DataBindings.Clear();
            txtThuTuNV.DataBindings.Add("Text", Grid_DSHS.DataSource, "Thứ tự NV");
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            ketnoi.excute("DELETE NguyenVong WHERE MaHS ='" + txtMaHS.Text + "' AND ThuTuNV='" + txtThuTuNV.Text + "'");
            Load_DSHS();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult thongbao;
            thongbao = MessageBox.Show("Bạn có muốn thoát không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (thongbao == DialogResult.Yes)
                this.Close();
        }

        private void btnDS_Click(object sender, EventArgs e)
        {
            Form FDSHS = new FrmDSHS_MaNganh();
            FDSHS.Show();
        }
    }
}
