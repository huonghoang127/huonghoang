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
using BaiTapLonLTUD;

namespace FrmTraDiem
{
    public partial class FrmDSHS_MaNganh : Form
    {
        public FrmDSHS_MaNganh()
        {
            InitializeComponent();
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();

        private void Load_DSHS()
        {
            DataTable dta = new DataTable();
            dta = ketnoi.loadDuLieu("SELECT p.MaHS AS 'Mã HS', p.TenHS AS 'Tên HS', p.Mon1 AS 'Môn 1', p.Mon2 AS 'Môn 2', p.Mon3 AS 'Môn 3', u.DiemUuTien AS 'Điểm Ưu Tiên', p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien AS 'Tổng Điểm', d.MaNganh AS 'Mã Ngành', d.TenNganh AS 'Tên Ngành', d.Diem AS 'Điểm chuẩn', n.ThuTuNV as 'Thứ tự NV' FROM dbo.PhieuBaoDiem AS p, dbo.DiemChuan AS d, dbo.NguyenVong AS n, dbo.DoUuTien AS u WHERE p.MaHS = n.MaHS AND p.MaHS = u.MaHS AND d.MaNganh = n.MaNganh AND p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien >= d.Diem");
            Grid_DSHS.DataSource = dta;
        }

        private void FrmDSHS_MaNganh_Load(object sender, EventArgs e)
        {
            Load_DSHS();
            load_DSHS();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult thongbao;
            thongbao = MessageBox.Show("Bạn có muốn thoát không?", "Cảnh báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (thongbao == DialogResult.Yes)
                this.Close();
        }

        public void load_DSHS()
        {
            ketnoi.ketNoi();
            DataTable dta = new DataTable();
            dta = ketnoi.loadDuLieu("SELECT p.MaHS AS 'Mã HS', p.TenHS AS 'Tên HS', p.Mon1 AS 'Môn 1', p.Mon2 AS 'Môn 2', p.Mon3 AS 'Môn 3', u.DiemUuTien AS 'Điểm Ưu Tiên', p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien AS 'Tổng Điểm', d.MaNganh AS 'Mã Ngành', d.TenNganh AS 'Tên Ngành', d.Diem AS 'Điểm chuẩn', n.ThuTuNV as 'Thứ tự NV' FROM dbo.PhieuBaoDiem AS p, dbo.DiemChuan AS d, dbo.NguyenVong AS n, dbo.DoUuTien AS u WHERE p.MaHS = n.MaHS AND p.MaHS = u.MaHS AND d.MaNganh = n.MaNganh AND p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien >= d.Diem");
            cboMaNganh.DataSource = dta;
            cboMaNganh.DisplayMember = "Mã Ngành";
            cboMaNganh.ValueMember = "Mã Ngành";
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            Grid_DSHS.DataSource = null;
            string sqlTK = "SELECT p.MaHS AS 'Mã HS', p.TenHS AS 'Tên HS', p.Mon1 AS 'Môn 1', p.Mon2 AS 'Môn 2', p.Mon3 AS 'Môn 3',u.DiemUuTien AS 'Điểm Ưu Tiên', p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien AS 'Tổng Điểm', d.MaNganh AS 'Mã Ngành', d.TenNganh AS 'Tên Ngành', d.Diem AS 'Điểm chuẩn', n.ThuTuNV as 'Thứ tự NV' FROM dbo.PhieuBaoDiem AS p, dbo.DiemChuan AS d, dbo.NguyenVong AS n, dbo.DoUuTien AS u WHERE p.MaHS = n.MaHS AND p.MaHS = u.MaHS AND d.MaNganh = n.MaNganh AND d.MaNganh AND p.Mon1 + p.Mon2 + p.Mon3 + u.DiemUuTien >= d.Diem like '%" + cboMaNganh.Text + "%'";
            data = ketnoi.loadDuLieu(sqlTK);
            Grid_DSHS.DataSource = data;
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            Form FDS = new FrmDS();
            FDS.Show();
        }

    }
}