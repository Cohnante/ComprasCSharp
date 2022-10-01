using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using LibLNCompras;

namespace AppVentas
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void productoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormProducto formProducto = new FormProducto();
            formProducto.MdiParent = this;
            formProducto.WindowState = FormWindowState.Maximized;
            formProducto.Show();
        }

        private void ventasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormVentas formVentas = new FormVentas();
            formVentas.MdiParent = this;
            formVentas.WindowState = FormWindowState.Maximized;
            formVentas.Show();
        }
    }
}
