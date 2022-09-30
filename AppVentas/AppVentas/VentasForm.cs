using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using LibLNCompras;

namespace AppVentas
{
    public partial class VentasForm : Form
    {
        public VentasForm()
        {
            InitializeComponent();
        }

        private void btnFormProductos_Click(object sender, EventArgs e)
        {
            FormProductos.Visible = true;
            try
            {
                Producto objProducto = new Producto();
                if (!objProducto.ComboCategoriaProductos(comboCategoriaProducto))
                {
                    MessageBox.Show(objProducto.Error);
                    objProducto = null;
                }
                objProducto = null;
            }
            catch(Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }
    }
}
