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
    public partial class FormProducto : Form
    {
        public FormProducto()
        {
            InitializeComponent();
            LlenarComboCategoria();
            LlenarGridProducto();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        #region Productos
        private void LlenarComboCategoria()
        {
            Producto objProducto = new Producto();
            try
            {
                if (!objProducto.ComboCategoriaProductos(comboCategoriaProducto))
                {
                    MessageBox.Show(objProducto.Error);
                    objProducto = null;
                }
                objProducto = null;
                return;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void LlenarGridProducto()
        {
            Producto objProducto = new Producto();
            try
            {
                if (!objProducto.ListarProductos(gridProductos))
                {
                    MessageBox.Show(objProducto.Error);
                    objProducto = null;
                    return;
                }
                objProducto = null;
                return;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void btnGuardarProducto_Click(object sender, EventArgs e)
        {
            Producto objProducto = new Producto();
            try
            {
                objProducto.Codigo_producto = txtIdProducto.Text;
                objProducto.Nombre_producto = txtNombreProducto.Text;
                objProducto.Valor = float.Parse(txtValorProducto.Text);
                objProducto.Categoria = comboCategoriaProducto.SelectedValue.ToString();
                if (objProducto.Categoria == "0")
                {
                    throw new Exception("Ingrese una categoría");
                }
                if (!objProducto.CrearProducto())
                {
                    MessageBox.Show(objProducto.Error);
                    objProducto = null;
                    return;
                }
                LlenarGridProducto();
                MessageBox.Show("Producto Guardado Exitosamente");
                return;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        private void btnConsultarPr_Click(object sender, EventArgs e)
        {
            Producto objProducto = new Producto();
            try
            {
                objProducto.Codigo_producto = txtIdProducto.Text;
                if (!objProducto.ConsultarProducto())
                {
                    throw new Exception(objProducto.Error);
                }
                SqlDataReader reader = objProducto.Reader;
                reader.Read();
                txtNombreProducto.Text = reader.GetString(1);
                txtValorProducto.Text = reader.GetDouble(2).ToString();
                comboCategoriaProducto.SelectedValue = reader.GetString(3);
                reader.Close();
                reader = null;
                objProducto = null;
                return;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }

        #endregion

        private void btnActualizarProducto_Click(object sender, EventArgs e)
        {
            Producto objProducto = new Producto();
            try
            {
                objProducto.Codigo_producto = txtIdProducto.Text;
                objProducto.Nombre_producto = txtNombreProducto.Text;
                objProducto.Valor = float.Parse(txtValorProducto.Text);
                objProducto.Categoria = comboCategoriaProducto.SelectedValue.ToString();
                if (objProducto.Categoria == "0")
                {
                    throw new Exception("Ingrese una categoría");
                }
                if (!objProducto.ActualizarProducto())
                {
                    MessageBox.Show(objProducto.Error);
                    objProducto = null;
                    return;
                }
                LlenarGridProducto();
                MessageBox.Show("Producto Actualizado Exitosamente");
                return;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
        }
    }
}
