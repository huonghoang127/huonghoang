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
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();

        private void frmLogin_Load(object sender, EventArgs e)
        {

        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            ketnoi.ketNoi();
            try
            {
                string tenDN = txtTenDN.Text;
                string mk = txtMatKhau.Text;

                string sql_login = "Select TenDangNhap,MatKhau From DangNhap Where TenDangNhap = '" + tenDN + "' and MatKhau='" + mk + "'";
                SqlCommand cmd = new SqlCommand(sql_login, ketnoi.cnn);
                SqlDataReader datRed = cmd.ExecuteReader();
                if (datRed.Read() == true)
                {
                    MessageBox.Show("Đăng nhập thành công!");
                    Form frm = new frmMain();
                    frm.Show();
                }
                else
                {
                    MessageBox.Show("Sai tài khoản hoặc mật khẩu!", "Lỗi !", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Lỗi kết nối với CSDL");

            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult tb;
            tb = MessageBox.Show("Bạn có muốn thoát không?", "Cảnh báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
