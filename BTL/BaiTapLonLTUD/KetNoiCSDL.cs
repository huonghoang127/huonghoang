using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace BaiTapLonLTUD
{
    class KetNoiCSDL
    {
        public SqlCommand cmd;
        public SqlConnection cnn;
        public DataTable dta;
        public SqlDataAdapter ada;

        public void ketNoi()
        {
            string strKetNoi = @"Data Source= LAPTOP-TV2ACT72;Initial Catalog=QLTSDH;Integrated Security=True";
            cnn = new SqlConnection(strKetNoi);
            cnn.Open();
        }
        public void huyKetNoi()
        {
            if(cnn.State == ConnectionState.Open)
            {
                cnn.Close();
            }
        }
        public DataTable loadDuLieu(string sql)
        {
            ketNoi();
            ada = new SqlDataAdapter(sql,cnn);
            dta = new DataTable();
            ada.Fill(dta);
            return dta;
        }
        public void excute(string sql)
        {
            ketNoi();
            cmd = new SqlCommand(sql, cnn);
            cmd.ExecuteNonQuery();
            huyKetNoi();
        }

    }
}
