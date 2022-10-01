using LibLNCompras;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AppVentas
{
    public partial class FormVentas : Form
    {

        private int SubtotalVenta;
        private int TotalVenta;
        private int IdVenta;
        private DataTable dt;

        public FormVentas()
        {
            InitializeComponent();
        }

        private void FormVentas_Load(object sender, EventArgs e)
        {
            dt = new DataTable();
            dt.Columns.Add("ProductoId");
            dt.Columns.Add("Cantidad");
            dt.Columns.Add("SubTotal");
            gridProductosVenta.DataSource = dt;
        }

        private void btnAddProducto_Click(object sender, EventArgs e)
        {
            DataRow row = dt.NewRow();
            row["ProductoId"] = txtProducto.Text;
            row["Cantidad"] = txtCantidad.Text;
            int subtotal = Int32.Parse(txtCantidad.Text) * Int32.Parse(txtValorUnit.Text);
            row["SubTotal"] = subtotal;
            dt.Rows.Add(row);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Ventas objVentas = new Ventas();
            try
            {
                objVentas.Fecha = dateFechaVenta.Value.ToString();
                objVentas.Fk_empleado = txtIdEmpleado.Text;
                objVentas.Fk_cliente = comboCliente.SelectedValue.ToString();

            }
        }
    }
}
