
namespace Winform
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.trend = new ZedGraph.ZedGraphControl();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label13 = new System.Windows.Forms.Label();
            this.connect_btn = new System.Windows.Forms.Button();
            this.Baudrate_cb = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.COM_cb = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.SET_btn = new System.Windows.Forms.Button();
            this.label12 = new System.Windows.Forms.Label();
            this.CV = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.SP = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.MT_IN = new Microsoft.VisualBasic.PowerPacks.OvalShape();
            this.discoveryClientProtocol1 = new System.Web.Services.Discovery.DiscoveryClientProtocol();
            this.discoveryClientProtocol2 = new System.Web.Services.Discovery.DiscoveryClientProtocol();
            this.discoveryClientProtocol3 = new System.Web.Services.Discovery.DiscoveryClientProtocol();
            this.MT_OUT = new Microsoft.VisualBasic.PowerPacks.OvalShape();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.shapeContainer1 = new Microsoft.VisualBasic.PowerPacks.ShapeContainer();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // trend
            // 
            this.trend.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.trend.AutoSize = true;
            this.trend.Location = new System.Drawing.Point(16, 177);
            this.trend.Margin = new System.Windows.Forms.Padding(27, 0, 27, 25);
            this.trend.Name = "trend";
            this.trend.ScrollGrace = 0D;
            this.trend.ScrollMaxX = 0D;
            this.trend.ScrollMaxY = 0D;
            this.trend.ScrollMaxY2 = 0D;
            this.trend.ScrollMinX = 0D;
            this.trend.ScrollMinY = 0D;
            this.trend.ScrollMinY2 = 0D;
            this.trend.Size = new System.Drawing.Size(1033, 277);
            this.trend.TabIndex = 0;
            this.trend.Load += new System.EventHandler(this.Form1_Load);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.connect_btn);
            this.groupBox1.Controls.Add(this.Baudrate_cb);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.COM_cb);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.groupBox1.Location = new System.Drawing.Point(16, 6);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(357, 167);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Cấu hình kết nối";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label13.Location = new System.Drawing.Point(8, 23);
            this.label13.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(135, 20);
            this.label13.TabIndex = 21;
            this.label13.Text = "Serial Parameter";
            // 
            // connect_btn
            // 
            this.connect_btn.BackColor = System.Drawing.Color.Gainsboro;
            this.connect_btn.Location = new System.Drawing.Point(8, 85);
            this.connect_btn.Margin = new System.Windows.Forms.Padding(4);
            this.connect_btn.Name = "connect_btn";
            this.connect_btn.Size = new System.Drawing.Size(153, 34);
            this.connect_btn.TabIndex = 4;
            this.connect_btn.Text = "Connect";
            this.connect_btn.UseVisualStyleBackColor = false;
            this.connect_btn.Click += new System.EventHandler(this.connect_btn_Click);
            // 
            // Baudrate_cb
            // 
            this.Baudrate_cb.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.Baudrate_cb.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.Baudrate_cb.FormattingEnabled = true;
            this.Baudrate_cb.Items.AddRange(new object[] {
            "50",
            "300",
            "600",
            "1200",
            "2400",
            "4800",
            "9600",
            "19200",
            "38400",
            "57600",
            "115200"});
            this.Baudrate_cb.Location = new System.Drawing.Point(252, 48);
            this.Baudrate_cb.Margin = new System.Windows.Forms.Padding(4);
            this.Baudrate_cb.Name = "Baudrate_cb";
            this.Baudrate_cb.Size = new System.Drawing.Size(93, 28);
            this.Baudrate_cb.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label2.Location = new System.Drawing.Point(193, 53);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 20);
            this.label2.TabIndex = 2;
            this.label2.Text = "Baud";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(8, 53);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 20);
            this.label1.TabIndex = 1;
            this.label1.Text = "COM";
            // 
            // COM_cb
            // 
            this.COM_cb.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.COM_cb.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.COM_cb.FormattingEnabled = true;
            this.COM_cb.Items.AddRange(new object[] {
            "COM1",
            "COM2",
            "COM3",
            "COM4",
            "COM5",
            "COM6",
            "COM7",
            "COM8",
            "COM9",
            "COM10",
            "COM11",
            "COM12",
            "COM13",
            "COM14",
            "COM15"});
            this.COM_cb.Location = new System.Drawing.Point(67, 48);
            this.COM_cb.Margin = new System.Windows.Forms.Padding(4);
            this.COM_cb.Name = "COM_cb";
            this.COM_cb.Size = new System.Drawing.Size(93, 28);
            this.COM_cb.TabIndex = 0;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.SET_btn);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.CV);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.SP);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.groupBox2.Location = new System.Drawing.Point(393, 6);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox2.Size = new System.Drawing.Size(226, 167);
            this.groupBox2.TabIndex = 2;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Cấu hình điều khiển";
            // 
            // SET_btn
            // 
            this.SET_btn.BackColor = System.Drawing.Color.LimeGreen;
            this.SET_btn.ForeColor = System.Drawing.Color.Black;
            this.SET_btn.Location = new System.Drawing.Point(65, 125);
            this.SET_btn.Margin = new System.Windows.Forms.Padding(4);
            this.SET_btn.Name = "SET_btn";
            this.SET_btn.Size = new System.Drawing.Size(143, 34);
            this.SET_btn.TabIndex = 20;
            this.SET_btn.Text = "Select";
            this.SET_btn.UseVisualStyleBackColor = false;
            this.SET_btn.Click += new System.EventHandler(this.SET_btn_Click);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label12.Location = new System.Drawing.Point(18, 93);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(32, 20);
            this.label12.TabIndex = 19;
            this.label12.Text = "CV";
            // 
            // CV
            // 
            this.CV.Location = new System.Drawing.Point(65, 89);
            this.CV.Margin = new System.Windows.Forms.Padding(4);
            this.CV.Name = "CV";
            this.CV.ReadOnly = true;
            this.CV.Size = new System.Drawing.Size(141, 26);
            this.CV.TabIndex = 18;
            this.CV.Text = "0";
            this.CV.TextChanged += new System.EventHandler(this.CV_TextChanged);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label11.Location = new System.Drawing.Point(18, 57);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(31, 20);
            this.label11.TabIndex = 17;
            this.label11.Text = "SP";
            // 
            // SP
            // 
            this.SP.Location = new System.Drawing.Point(65, 53);
            this.SP.Margin = new System.Windows.Forms.Padding(4);
            this.SP.Name = "SP";
            this.SP.Size = new System.Drawing.Size(141, 26);
            this.SP.TabIndex = 16;
            this.SP.Text = "0";
            this.SP.TextChanged += new System.EventHandler(this.SP_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label5.Location = new System.Drawing.Point(18, 27);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(122, 20);
            this.label5.TabIndex = 8;
            this.label5.Text = "Mức nước (cm)";
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // MT_IN
            // 
            this.MT_IN.BackColor = System.Drawing.Color.Lime;
            this.MT_IN.Location = new System.Drawing.Point(27, 10);
            this.MT_IN.Name = "MT_IN";
            this.MT_IN.Size = new System.Drawing.Size(43, 39);
            this.MT_IN.Click += new System.EventHandler(this.MT_IN_Click);
            // 
            // discoveryClientProtocol1
            // 
            this.discoveryClientProtocol1.Credentials = null;
            this.discoveryClientProtocol1.UseDefaultCredentials = false;
            // 
            // discoveryClientProtocol2
            // 
            this.discoveryClientProtocol2.Credentials = null;
            this.discoveryClientProtocol2.UseDefaultCredentials = false;
            // 
            // discoveryClientProtocol3
            // 
            this.discoveryClientProtocol3.Credentials = null;
            this.discoveryClientProtocol3.UseDefaultCredentials = false;
            // 
            // MT_OUT
            // 
            this.MT_OUT.BackColor = System.Drawing.Color.Lime;
            this.MT_OUT.Location = new System.Drawing.Point(27, 63);
            this.MT_OUT.Name = "MT_OUT";
            this.MT_OUT.Size = new System.Drawing.Size(43, 39);
            this.MT_OUT.Click += new System.EventHandler(this.ovalShape1_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label3.Location = new System.Drawing.Point(118, 48);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(120, 20);
            this.label3.TabIndex = 21;
            this.label3.Text = "Motor bơm vào";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label4.Location = new System.Drawing.Point(118, 115);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(94, 20);
            this.label4.TabIndex = 22;
            this.label4.Text = "Motor xả ra";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.shapeContainer1);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.groupBox3.Location = new System.Drawing.Point(693, 6);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox3.Size = new System.Drawing.Size(301, 167);
            this.groupBox3.TabIndex = 21;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Giám sát máy bơm";
            // 
            // shapeContainer1
            // 
            this.shapeContainer1.Location = new System.Drawing.Point(4, 23);
            this.shapeContainer1.Margin = new System.Windows.Forms.Padding(0);
            this.shapeContainer1.Name = "shapeContainer1";
            this.shapeContainer1.Shapes.AddRange(new Microsoft.VisualBasic.PowerPacks.Shape[] {
            this.MT_OUT,
            this.MT_IN});
            this.shapeContainer1.Size = new System.Drawing.Size(293, 140);
            this.shapeContainer1.TabIndex = 0;
            this.shapeContainer1.TabStop = false;
            // 
            // serialPort1
            // 
            this.serialPort1.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort1_DataReceived);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1063, 465);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.trend);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private ZedGraph.ZedGraphControl trend;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox COM_cb;
        private System.Windows.Forms.ComboBox Baudrate_cb;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button connect_btn;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox CV;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox SP;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button SET_btn;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Timer timer1;
        private Microsoft.VisualBasic.PowerPacks.OvalShape MT_IN;
        private System.Web.Services.Discovery.DiscoveryClientProtocol discoveryClientProtocol1;
        private System.Web.Services.Discovery.DiscoveryClientProtocol discoveryClientProtocol2;
        private System.Web.Services.Discovery.DiscoveryClientProtocol discoveryClientProtocol3;
        private Microsoft.VisualBasic.PowerPacks.OvalShape MT_OUT;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox3;
        private Microsoft.VisualBasic.PowerPacks.ShapeContainer shapeContainer1;
        private System.IO.Ports.SerialPort serialPort1;
    }
}

