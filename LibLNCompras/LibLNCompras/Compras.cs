using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibConexionBD;
using LibLlenarCombos;
using LibLlenarGrid;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace LibLNCompras
{
    public class Producto
    {

        #region Atributos 
        private string codigo_producto;
        private string nombre_producto;
        private float valor;
        private string categoria;
        private string error;
        private SqlDataReader reader;
        #endregion

        #region Propiedades
        public string Codigo_producto { get => codigo_producto; set => codigo_producto = value; }
        public string Nombre_producto { get => nombre_producto; set => nombre_producto = value; }
        public float Valor { get => valor; set => valor = value; }
        public string Categoria { get => categoria; set => categoria = value; }
        public string Error { get => error; set => error = value; }
        public SqlDataReader Reader { get => reader; set => reader = value; }
        #endregion

        #region Metodos Publicos

        public bool CrearProducto()
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "execute USP_insert_producto '" + codigo_producto + "', '" +nombre_producto+"', "+valor+", '"+categoria+"';";
            if (!objConexion.EjecutarSentencia(sentencia, false))
            {
                Error = objConexion.Error;
                objConexion = null;
                return false;
            }
            objConexion = null;
            return true;

        }

        public bool ActualizarProducto()
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "execute USP_update_producto '" + codigo_producto + "', '" + nombre_producto + "', " + valor + ", '" + categoria + "';";
            if (!objConexion.EjecutarSentencia(sentencia, false))
            {
                Error = objConexion.Error;
                objConexion = null;
                return false;
            }
            objConexion = null;
            return true;

        }

        public bool ConsultarProducto ()
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "execute USP_select_producto_uno '"+codigo_producto+"';";
            if (!objConexion.Consultar(sentencia, false)) {
                Error = objConexion.Error;
                objConexion = null;
                return false;
            }
            reader = objConexion.Reader;
            objConexion = null;
            return true;
        }

        public bool ListarProductos(DataGridView objGrid)
        {
            ClsLlenarGrid objGridView = new ClsLlenarGrid();
            objGridView.NombreTabla = "Datos de los productos";
            objGridView.SQL = "execute USP_select_productos_list";
            if (!objGridView.LlenarGrid(objGrid))
            {
                Error = objGridView.Error;
                objGridView = null;
                return false;
            }
            objGridView = null;
            return true;
        }

        public bool ComboProducto (ComboBox comboBox)
        {
            ClsLlenarCombos objLlenarCombo = new ClsLlenarCombos();
            objLlenarCombo.SQL = "execute USP_combo_producto";
            objLlenarCombo.NombreTabla = "Producto";
            objLlenarCombo.ColumnaValor = "id";
            objLlenarCombo.ColumnaTexto = "producto";
            if (!objLlenarCombo.LlenarCombo(comboBox))
            {
                Error = objLlenarCombo.Error;
                objLlenarCombo = null;
                return false;
            }
            objLlenarCombo = null;
            return true;
        }
        public bool ComboCategoriaProductos(ComboBox comboBox)
        {
            ClsLlenarCombos objLlenarCombo = new ClsLlenarCombos();
            objLlenarCombo.SQL = "execute USP_combo_categoria";
            objLlenarCombo.NombreTabla = "Categoria";
            objLlenarCombo.ColumnaValor = "id";
            objLlenarCombo.ColumnaTexto = "categoria";
            if (!objLlenarCombo.LlenarCombo(comboBox))
            {
                Error = objLlenarCombo.Error;
                objLlenarCombo = null;
                return false;
            }
            objLlenarCombo = null;
            return true;
        }

        #endregion
    }
    public class Ventas
    {
        #region Atributos
        private int numero_compra;
        private string fecha;
        private string fk_empleado;
        private string fk_cliente;
        private float iva;
        private float sub_total;
        private float total;
        private string error;
        private SqlDataReader reader;
        #endregion

        #region Propiedades
        public int Numero_compra { get => numero_compra; set => numero_compra = value; }
        public string Fecha { get => fecha; set => fecha = value; }
        public string Fk_empleado { get => fk_empleado; set => fk_empleado = value; }
        public string Fk_cliente { get => fk_cliente; set => fk_cliente = value; }
        public float Iva { get => iva; set => iva = value; }
        public float Sub_total { get => sub_total; set => sub_total = value; }
        public float Total { get => total; set => total = value; }
        public SqlDataReader Reader { get => reader; set => reader = value; }
        public string Error { get => error; set => error = value; }
        #endregion

        #region Metodos Publicos
        public bool CrearVenta()
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "execute USP_Agregar_Ventas '" + fecha + "' , '" + fk_empleado + "' , '" + fk_cliente + "' , " + iva + " , " + sub_total + " , " + total ;
            if(!objConexion.Consultar(sentencia, false))
            {
                error = objConexion.Error;
                objConexion = null;
                return false;
            }
            reader = objConexion.Reader;
            if (reader.HasRows)
            {
                reader.Read();
                numero_compra = reader.GetInt32(0);
                reader.Close();
                objConexion = null;
                return true;
            }
            objConexion = null;
            return false;
        }

        public bool ConsultarVenta()
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "execute USP_Cosultar_Ventas " + numero_compra;
            if(!objConexion.ConsultarValorUnico(sentencia, false))
            {
                error = objConexion.Error;
                objConexion = null;
                return false;
            }
            reader = objConexion.Reader;
            objConexion = null;
            return true;
        }
        
        public bool ListarVenta(DataGridView objGrid)
        {
            ClsLlenarGrid objLlenarGrid = new ClsLlenarGrid();
            objLlenarGrid.SQL = "execute USP_Listar_Ventas";
            objLlenarGrid.NombreTabla = "Ventas";
            if (!objLlenarGrid.LlenarGrid(objGrid))
            {
                error = objLlenarGrid.Error;
                objLlenarGrid = null;
                return false;
            }
            objLlenarGrid = null;
            return true;
        }

        public bool AñadirProductosVenta(Array Productos)
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia;
            for(int i = 0; i < Productos.Length; i++)
            {
                sentencia = "USP_agregar_ProductosVentas '" + Productos.GetValue(i, 0) + "' , '" + numero_compra + " , " + Productos.GetValue(i, 1) + " , " + Productos.GetValue(i, 2);
                if(!objConexion.EjecutarSentencia(sentencia, false))
                {
                    error = objConexion.Error;
                    objConexion = null;
                    return false;
                }
            }
            objConexion = null;
            return true;
        }

        public bool ConsultarProductosVenta(String Venta)
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "USP_Consultar_ProductosVentas '" + Venta + "'";
            if(!objConexion.ConsultarValorUnico(sentencia, false))
            {
                error = objConexion.Error;
                objConexion = null;
                return false;
            }
            reader = objConexion.Reader;
            objConexion = null;
            return true;
        }

        public bool ListarVentaProducto(DataGridView objGrid)
        {
            ClsLlenarGrid objLlenarGrid = new ClsLlenarGrid();
            objLlenarGrid.SQL = "execute USP_Listar_ProductosVentas";
            objLlenarGrid.NombreTabla = "Detalles Venta";
            if (!objLlenarGrid.LlenarGrid(objGrid))
            {
                error = objLlenarGrid.Error;
                objLlenarGrid = null;
                return false;
            }
            objLlenarGrid = null;
            return true;
        }

        public bool ComboCliente(ComboBox comboBox)
        {
            ClsLlenarCombos objCombo = new ClsLlenarCombos();
            objCombo.SQL = "execute USP_combo_Cliente";
            objCombo.NombreTabla = "Clientes";
            objCombo.ColumnaTexto = "cliente";
            objCombo.ColumnaValor = "id";
            if (!objCombo.LlenarCombo(comboBox))
            {
                error = objCombo.Error;
                objCombo = null;
                return false;
            }
            objCombo = null;
            return true;
        }

        #endregion
    }
}
