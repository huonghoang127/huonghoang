using BaiTapLonLTUD;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrmTraDiem
{
    public partial class FrmDS : Form
    {
        public FrmDS()
        {
            InitializeComponent();
        }
        KetNoiCSDL ketnoi = new KetNoiCSDL();
        private void FrmDS_Load(object sender, EventArgs e)
        {
            DataTable dta = new DataTable();
            dta = ketnoi.loadDuLieu("SELECT * FROM DSHS");
            DSHS baocao = new DSHS();
            baocao.SetDataSource(dta);
            CRV.ReportSource = baocao;
        }
    }
}
