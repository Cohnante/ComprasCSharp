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
        private List<List<string>> productos = new List<List<string>>();

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
            List<string> productos_one = new List<string>();
            productos_one.Add(txtProducto.Text);
            productos_one.Add(txtCantidad.Text);
            productos_one.Add(subtotal.ToString());
            productos.Add(productos_one);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Ventas objVentas = new Ventas();
            try
            {
                objVentas.Fecha = dateFechaVenta.Value.ToString();
                objVentas.Fk_empleado = txtIdEmpleado.Text;
                objVentas.Fk_cliente = comboCliente.SelectedValue.ToString();
                if (checkIVA.Checked)
                {
                    double iva_subtotal = ((double)(Int32.Parse(txtSubTotal.Text) * 0.19));
                    objVentas.Iva = (float)iva_subtotal;
                }
                else
                {
                    objVentas.Iva = (float)0.00;
                }
                objVentas.Sub_total = (float)(Int32.Parse(txtSubTotal.Text));
                objVentas.Total = (float)(Int32.Parse(txtTotal.Text));
                if (!objVentas.CrearVenta())
                {
                    throw new Exception(objVentas.Error);
                }
                if (!objVentas.AñadirProductosVenta(productos.ToArray()))
                {
                    throw new Exception(objVentas.Error);
                }
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }
    }
}
