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
    public partial class frmReportDiemThi : Form
    {
        public frmReportDiemThi()
        {
            InitializeComponent();
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();
        private void frmReportDiemThi_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = ketnoi.loadDuLieu("Select * from PhieuBaoDiem");
            BaoCaoDiem bc = new BaoCaoDiem();
            bc.SetDataSource(dt);
            crs_BaoCaoDiem.ReportSource = bc; 
        }
    }
}
