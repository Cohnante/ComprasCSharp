﻿using System;
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
        #endregion

        #region Propiedades
        public string Codigo_producto { get => codigo_producto; set => codigo_producto = value; }
        public string Nombre_producto { get => nombre_producto; set => nombre_producto = value; }
        public float Valor { get => valor; set => valor = value; }
        public string Categoria { get => categoria; set => categoria = value; }
        public string Error { get => error; set => error = value; }
        #endregion

        #region Metodos Publicos

        public bool CrearProducto()
        {
            ClsConexion objConexion = new ClsConexion();
            string sentencia = "execute USP_insert_producto '" + codigo_producto + "', '" +nombre_producto+"', '"+valor+"', '"+categoria+"';";
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
            objConexion = null;
            return true;
        }

        public bool ListarProductos(DataGridView objGrid)
        {
            ClsLlenarGrid objGridView = new ClsLlenarGrid();
            objGridView.NombreTabla = "Datos de los productos";
            objGridView.SQL = "execute USP_select_productos_all";
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
            objLlenarCombo.ColumnaValor = "Codigo delproducto";
            objLlenarCombo.ColumnaTexto = "Nombre del producto";
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
        private string numero_compra;
    }
}