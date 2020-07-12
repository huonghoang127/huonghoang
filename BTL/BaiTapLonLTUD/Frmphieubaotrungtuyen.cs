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
    public partial class Frmphieubaotrungtuyen : Form
    {
        public Frmphieubaotrungtuyen()
        {
            InitializeComponent();
        }

        KetNoiCSDL ketnoi = new KetNoiCSDL();

        private void Frmphieubaotrungtuyen_Load(object sender, EventArgs e)
        {
            DataTable dta = new DataTable();
            dta = ketnoi.loadDuLieu("Select * from  ThongTin");
            PBTrungTuyen bc = new PBTrungTuyen();
            bc.SetDataSource(dta);
            crpphieubao.ReportSource = bc;
        }
    }
}