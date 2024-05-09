using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ZedGraph;

namespace Winform
{
    public partial class Form1 : Form
    {
        // Khai báo những biến sử dụng nội bộ trên C#
        public bool IsConnect = false;
        public int TickStart, intMode = 1;
        byte[] D = new byte [5];
        public int MOTOR;
        // public static string dataIn;
        // Khai báo những biến gửi xuống Arduino
        public int LEVEL = 300;
        public int CV_STM = 0;
        public int SP_STM, T, newData = 0, Data = 0;
        public Form1()
        {
            InitializeComponent();
            COM_cb.SelectedIndex = 1;
            Baudrate_cb.SelectedIndex = 6;
        }

        public void Form1_Load(object sender, EventArgs e)
        {
            // Hiển thị giá trị khởi tạo cho các textbox
            // Khởi tạo ZedGraph
            GraphPane myPane = trend.GraphPane;
            myPane.Title.Text = "Đồ thị";
            myPane.YAxis.Title.Text = "Mực nước(cm)";

            RollingPointPairList SP_list = new RollingPointPairList(60000);
            RollingPointPairList CV_list = new RollingPointPairList(60000);

            LineItem vantocSP_curve = myPane.AddCurve("SP", SP_list, Color.DarkRed, SymbolType.None);
            LineItem vantocCV_curve = myPane.AddCurve("CV", CV_list, Color.Red, SymbolType.None);

            myPane.XAxis.Scale.Min = 0;
            myPane.XAxis.Scale.Max = 5;
            myPane.XAxis.Scale.MinorStep = 1;
            myPane.XAxis.Scale.MajorStep = 5;
            myPane.YAxis.Scale.Min = 0;
            myPane.YAxis.Scale.Max = 350;
            myPane.AxisChange();


        }
 



        private void connect_btn_Click(object sender, EventArgs e)
        {
            if (connect_btn.Text == "Connect")
            {
                serialPort1.PortName = COM_cb.Text;
                serialPort1.BaudRate = Convert.ToInt32(Baudrate_cb.Text);
                serialPort1.Open();
                connect_btn.Text = "DisConnect";
            }
            else
            {
                connect_btn.Text = "Connect";
                serialPort1.Close();
            }
        }


        // Nhận và xử lý string gửi từ Serial
      
        // 0: dưới, xả , 1: trên

        private void timer1_Tick(object sender, EventArgs e)
        {
            CV_STM = (int)Data / 10;
            MOTOR = Data % 10;
            CV.Text = Convert.ToString(CV_STM);
            //
            Draw(CV_STM, SP_STM);
            if (MOTOR == 1)//xả
            {
                MT_OUT.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Opaque;
                MT_IN.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Transparent;
            }

            else if (MOTOR == 2)
            {
                MT_IN.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Opaque;
                MT_OUT.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Transparent;
            }
            else if (MOTOR == 0)
            {
                MT_IN.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Transparent;
                MT_OUT.BackStyle = Microsoft.VisualBasic.PowerPacks.BackStyle.Transparent;
            }
            // textBox1.Text = MOTOR.ToString();
        }

        private void SET_btn_Click(object sender, EventArgs e)
        {
         if (serialPort1.IsOpen)
            {
                if (SP.Text == "") SP.Text = "0";
                SP_STM = Convert.ToInt16(SP.Text);
                ClearZedGraph();
                byte[] arrPathFrame = new byte [1];
                int level1 = (int)(SP_STM / 100)  + 48;
                int level2_2 = (int)(SP_STM % 100) ;
                int level2 = (int)(level2_2 / 10) + 48;
                int level3 = (int)(level2_2 % 10) + 48;
                // int level3 = Convert.ToByte(SP_STM - level1 * 100-level2*10);
               // arrPathFrame[0] = Convert.ToByte(level1); ;
                //arrPathFrame[1] = Convert.ToByte(level2);
                //arrPathFrame[2] = Convert.ToByte(level3);
                //arrPathFrame[6] = Convert.ToByte(SP_STM);
                // Communicator.SerialPort.Write(arrPathFrame.ToArray(), 0, arrPathFrame.ToArray().Length);// send to stm32
                arrPathFrame[0] = Convert.ToByte(level1);
                serialPort1.Write(arrPathFrame.ToArray(), 0, 1);
                System.Threading.Thread.Sleep(50);
                arrPathFrame[0] = Convert.ToByte(level2);
                serialPort1.Write(arrPathFrame.ToArray(), 0, 1);
                //Communicator.SerialPort.Write(arrPathFrame.ToArray(), 0, arrPathFrame.ToArray().Length);// send to stm32
                System.Threading.Thread.Sleep(50);
                arrPathFrame[0] = Convert.ToByte(level3);
                //Communicator.SerialPort.Write(arrPathFrame.ToArray(), 0, arrPathFrame.ToArray().Length);// send to stm32
                serialPort1.Write(arrPathFrame.ToArray(), 0, 1);
                System.Threading.Thread.Sleep(50);

            }
            else MessageBox.Show("Start the connect first!");
        }

        private void ovalShape1_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void MT_IN_Click(object sender, EventArgs e)
        {

        }

        private void SP_TextChanged(object sender, EventArgs e)
        {

        }

        private void CV_TextChanged(object sender, EventArgs e)
        {

        }

        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            serialPort1.Read(D, 0, 1);
            if (D[0] != '|')
            {
                T++;
                newData = newData * 10 + D[0] - 48;
            }
            else
            {
                T = 0;
                if (Data != newData) ClearZedGraph();
                Data = newData;
                newData = 0;
            }
            
        }



        // Vẽ đồ thị
        private void Draw(double CV_STM, double SP_STM)
        {
            double times = 0;

            if (trend.GraphPane.CurveList.Count <= 0)
                return;

            LineItem curve = trend.GraphPane.CurveList[0] as LineItem;
            LineItem curve1 = trend.GraphPane.CurveList[1] as LineItem;

            if (curve == null)
                return;
            if (curve1 == null)
                return;


            IPointListEdit list = curve.Points as IPointListEdit;
            IPointListEdit list1 = curve1.Points as IPointListEdit;

            if (list == null)
                return;
            if (list1 == null)
                return;
            for (int i = 0; i < 500; i++)
            {
                list.Add(times, SP_STM); // Thêm điểm trên đồ thị
                list1.Add(times, CV_STM);
                times = times + 0.01 ;
            }
            

            trend.AxisChange();
            trend.Invalidate();
            trend.Refresh();
        }
        private void ClearZedGraph()
        {
            trend.GraphPane.CurveList.Clear(); // Xóa đường
            GraphPane myPane = trend.GraphPane;
            RollingPointPairList SP_list = new RollingPointPairList(60000);
            RollingPointPairList CV_list = new RollingPointPairList(60000);
            LineItem vantocSP_curve = myPane.AddCurve("SP", SP_list, Color.DarkRed, SymbolType.None);
            LineItem vantocCV_curve = myPane.AddCurve("CV", CV_list, Color.Red, SymbolType.None);
            trend.AxisChange();
            trend.AxisChange();
            trend.Invalidate();
        }

    }
}
