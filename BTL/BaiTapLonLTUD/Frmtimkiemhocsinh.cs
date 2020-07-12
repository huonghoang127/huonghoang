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

namespace BaiTapLonLTUD
{
    public partial class Frmtimkiemhocsinh : Form
    {
        public Frmtimkiemhocsinh()
        {
            InitializeComponent();
        }

        KetNoiCSDL kn = new KetNoiCSDL();

        public void load_thisinhtrungtuyen1()
        {
            DataTable dta = new DataTable();
            dta = kn.loadDuLieu("select	p.MaHS as 'Mã HS', p.TenHS as 'Tên HS', Mon1 as 'Môn 1', Mon2 as 'Môn 2', Mon3 as 'Môn 3', DiemUuTien as 'Điểm Ưu Tiên', " +
                "Mon1 + Mon2 + Mon3 + u.DiemUuTien as 'Tổng Điểm', d.MaNganh as 'Mã Ngành', d.TenNganh as 'Tên Ngành', Diem as 'Điểm Chuẩn', ThuTuNV as 'Thứ Tự NV' " +
                "from PhieuBaoDiem as p, DiemChuan as d, NguyenVong as n, DoUuTien u " +
                "where p.MaHS = n.MaHS and p.MaHS = u.MaHS and d.MaNganh = n.MaNganh and Mon1 + Mon2 + Mon3 + u.DiemUuTien >= d.Diem " +
                    "and p.MaHS in (select n.MaHS " +
                                    "from NguyenVong n " +
                                    "group by n.MaHS " +
                                    "having count(n.MaHS) = 1) " +
                "order by p.MaHS;");
            griddanhsach.DataSource = dta;
            griddanhsach.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCells);
            hienthi();
        }

        public void load_thisinhtrungtuyenn()
        {
            DataTable dta = new DataTable();
            dta = kn.loadDuLieu("select	p.MaHS as 'Mã HS', p.TenHS as 'Tên HS', Mon1 as 'Môn 1', Mon2 as 'Môn 2', Mon3 as 'Môn 3', DiemUuTien as 'Điểm Ưu Tiên', " +
                "Mon1 + Mon2 + Mon3 + u.DiemUuTien as 'Tổng Điểm', d.MaNganh as 'Mã Ngành', d.TenNganh as 'Tên Ngành', Diem as 'Điểm Chuẩn', ThuTuNV as 'Thứ Tự NV' " +
                "from PhieuBaoDiem as p, DiemChuan as d, NguyenVong as n, DoUuTien u " +
                "where p.MaHS = n.MaHS and p.MaHS = u.MaHS and d.MaNganh = n.MaNganh and Mon1 + Mon2 + Mon3 + u.DiemUuTien >= d.Diem " +
                    "and p.MaHS in (select n.MaHS " +
                                    "from NguyenVong n " +
                                    "group by n.MaHS " +
                                    "having count(n.MaHS) > 1) " +
                "order by p.MaHS, ThuTuNV;");
            griddanhsach.DataSource = dta;
            griddanhsach.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCells);
            hienthi();
        }

        public void load_thisinhkhongtrungtuyen()
        {
            DataTable dta = new DataTable();
            dta = kn.loadDuLieu("select	p.MaHS as 'Mã HS', p.TenHS as 'Tên HS', Mon1 as 'Môn 1', Mon2 as 'Môn 2', Mon3 as 'Môn 3', DiemUuTien as 'Điểm Ưu Tiên', " +
                "Mon1 + Mon2 + Mon3 + u.DiemUuTien as 'Tổng Điểm', d.MaNganh as 'Mã Ngành', d.TenNganh as 'Tên Ngành', Diem as 'Điểm Chuẩn', ThuTuNV as 'Thứ Tự NV' " +
                "from PhieuBaoDiem as p, DiemChuan as d, NguyenVong as n, DoUuTien u " +
                "where p.MaHS = n.MaHS and p.MaHS = u.MaHS and d.MaNganh = n.MaNganh and Mon1 + Mon2 + Mon3 + u.DiemUuTien < d.Diem " +
                "order by p.MaHS;");
            griddanhsach.DataSource = dta;
            griddanhsach.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCells);
            hienthi();
        }

        public void load_thongtin()
        {
            kn.loadDuLieu("delete from ThongTin; " + 
                "insert into ThongTin " +
                "select h.MaHS, h.TenHS, h.GioiTinh, h.CMND, h.NgaySinh, h.DiaChi, h.KhoiThi, p.Mon1, p.Mon2, p.Mon3, d.DiemUuTien, n.MaNganh, n.TenNganh, n.ThuTuNV " +
                "from HocSinh as h, PhieuBaoDiem as p, DoUuTien as d, NguyenVong as n " +
                "where h.MaHS = '" + txtmahs.Text + "' and p.MaHS = '" + txtmahs.Text + "' and d.MaHS = '" + txtmahs.Text +
                "' and n.MaHS = '" + txtmahs.Text + "' and n.ThuTuNV = '" + txtnguyenvong.Text +
                "' group by h.MaHS, h.TenHS, h.GioiTinh, h.CMND, h.NgaySinh, h.DiaChi, h.KhoiThi, p.Mon1, p.Mon2, p.Mon3, d.DiemUuTien, n.MaNganh, n.TenNganh, n.ThuTuNV; " +
                "select * from ThongTin;");
        }

        private void hienthi()
        {
            txtmahs.DataBindings.Clear();
            txtmahs.DataBindings.Add("text", griddanhsach.DataSource, "Mã HS");

            txthoten.DataBindings.Clear();
            txthoten.DataBindings.Add("text", griddanhsach.DataSource, "Tên HS");

            txtnguyenvong.DataBindings.Clear();
            txtnguyenvong.DataBindings.Add("text", griddanhsach.DataSource, "Thứ Tự NV");
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            if (opttrungtuyen1.Checked == true)
            {
                load_thisinhtrungtuyen1();
                btnin.Enabled = true;
            }
            if (opttrungtuyenn.Checked == true)
            {
                load_thisinhtrungtuyenn();
                btnin.Enabled = true;
            }
            if (optkhong.Checked == true)
            {
                load_thisinhkhongtrungtuyen();
                btnin.Enabled = false;
            }
        }

        private void btnin_Click(object sender, EventArgs e)
        {
            load_thongtin();

            Form frm = new Frmphieubaotrungtuyen();
            frm.Show();
        }

        private void btnthoat_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn có chắc chắn muốn thoát không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
                {
                    Process.Start("thoat");
                }
                this.Close();
            }
            catch
            {
                return;
            }
        }


    }
}
