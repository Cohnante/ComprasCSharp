using LibLNCompras;
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

namespace AppVentas
{
    public partial class FormVentas : Form
    {

        private double SubtotalVenta;
        private double TotalVenta;
        private DataTable dt;
        private List<List<string>> productos = new List<List<string>>();
        private SqlDataReader reader;

        public FormVentas()
        {
            InitializeComponent();
            ComboCliente();
        }

        private void ComboCliente()
        {
            Ventas objVentas = new Ventas();
            try
            {
                if (!objVentas.ComboCliente(comboCliente))
                {
                    throw new Exception(objVentas.Error);
                }
                objVentas = null;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void FormVentas_Load(object sender, EventArgs e)
        {
            dt = new DataTable();
            dt.Columns.Add("ProductoId");
            dt.Columns.Add("Cantidad");
            dt.Columns.Add("SubTotal");
            gridProductosVenta.DataSource = dt;
        }

        private void Actualizar()
        {
            SubtotalVenta += Double.Parse(txtSubTotalProducto.Text);
            txtSubTotal.Text = SubtotalVenta.ToString();
            if (checkIVA.Checked)
            {
                TotalVenta = Double.Parse(txtSubTotal.Text) * 0.19;
                txtTotal.Text = TotalVenta.ToString();
            }
            else
            {
                TotalVenta = Double.Parse(txtSubTotal.Text);
                txtTotal.Text = TotalVenta.ToString();
            }
        }

        private void btnAddProducto_Click(object sender, EventArgs e)
        {
            Producto objProducto = new Producto();
            try
            {
                objProducto.Codigo_producto = txtProducto.Text;
                if (!objProducto.ConsultarProducto())
                {
                    throw new Exception(objProducto.Error);
                }
                reader = objProducto.Reader;
                reader.Read();
                txtValorUnit.Text = reader.GetDouble(2).ToString();
                reader.Close();
                txtSubTotalProducto.Text = (Double.Parse(txtCantidad.Text) * Double.Parse(txtValorUnit.Text)).ToString();
                DataRow row = dt.NewRow();
                row["ProductoId"] = txtProducto.Text;
                row["Cantidad"] = txtCantidad.Text;
                double subtotal = Double.Parse(txtCantidad.Text) * Double.Parse(txtValorUnit.Text);
                row["SubTotal"] = subtotal;
                dt.Rows.Add(row);
                List<string> productos_one = new List<string>();
                productos_one.Add(txtProducto.Text);
                productos_one.Add(txtCantidad.Text);
                productos_one.Add(subtotal.ToString());
                productos.Add(productos_one);
                Actualizar();
            }
            catch(Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Ventas objVentas = new Ventas();
            //try
            //{
                objVentas.Fecha = dateFechaVenta.Value.Date.Year.ToString() + '/' +dateFechaVenta.Value.Date.Month.ToString() +'/' + dateFechaVenta.Value.Date.Day.ToString();
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
                MessageBox.Show("Venta agregada Exitosamente");
            //}
            //catch (Exception err)
            //{
            //    MessageBox.Show(err.Message);
            //}
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            
        }
    }
}
