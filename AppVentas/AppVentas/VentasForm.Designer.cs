namespace AppVentas
{
    partial class VentasForm
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(VentasForm));
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnFormVentas = new System.Windows.Forms.Button();
            this.btnFormProductos = new System.Windows.Forms.Button();
            this.FormProductos = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnGuardarProducto = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.comboCategoriaProducto = new System.Windows.Forms.ComboBox();
            this.txtValorProducto = new System.Windows.Forms.TextBox();
            this.txtNombreProducto = new System.Windows.Forms.TextBox();
            this.txtIdProducto = new System.Windows.Forms.TextBox();
            this.navProductos = new System.Windows.Forms.Panel();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.FormProductos.SuspendLayout();
            this.panel2.SuspendLayout();
            this.navProductos.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnFormVentas);
            this.panel1.Controls.Add(this.btnFormProductos);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Padding = new System.Windows.Forms.Padding(5);
            this.panel1.Size = new System.Drawing.Size(1023, 45);
            this.panel1.TabIndex = 0;
            // 
            // btnFormVentas
            // 
            this.btnFormVentas.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnFormVentas.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnFormVentas.Location = new System.Drawing.Point(107, 5);
            this.btnFormVentas.Margin = new System.Windows.Forms.Padding(10000, 3, 3, 3);
            this.btnFormVentas.Name = "btnFormVentas";
            this.btnFormVentas.Size = new System.Drawing.Size(102, 35);
            this.btnFormVentas.TabIndex = 1;
            this.btnFormVentas.Text = "Ventas";
            this.btnFormVentas.UseVisualStyleBackColor = true;
            // 
            // btnFormProductos
            // 
            this.btnFormProductos.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnFormProductos.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnFormProductos.Location = new System.Drawing.Point(5, 5);
            this.btnFormProductos.Name = "btnFormProductos";
            this.btnFormProductos.Size = new System.Drawing.Size(102, 35);
            this.btnFormProductos.TabIndex = 0;
            this.btnFormProductos.Text = "Productos";
            this.btnFormProductos.UseVisualStyleBackColor = true;
            this.btnFormProductos.Click += new System.EventHandler(this.btnFormProductos_Click);
            // 
            // FormProductos
            // 
            this.FormProductos.Controls.Add(this.panel2);
            this.FormProductos.Controls.Add(this.navProductos);
            this.FormProductos.Dock = System.Windows.Forms.DockStyle.Fill;
            this.FormProductos.Location = new System.Drawing.Point(0, 45);
            this.FormProductos.Name = "FormProductos";
            this.FormProductos.Size = new System.Drawing.Size(1023, 511);
            this.FormProductos.TabIndex = 1;
            this.FormProductos.Visible = false;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnGuardarProducto);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.comboCategoriaProducto);
            this.panel2.Controls.Add(this.txtValorProducto);
            this.panel2.Controls.Add(this.txtNombreProducto);
            this.panel2.Controls.Add(this.txtIdProducto);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(200, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(823, 511);
            this.panel2.TabIndex = 1;
            // 
            // btnGuardarProducto
            // 
            this.btnGuardarProducto.Location = new System.Drawing.Point(326, 318);
            this.btnGuardarProducto.Name = "btnGuardarProducto";
            this.btnGuardarProducto.Size = new System.Drawing.Size(151, 23);
            this.btnGuardarProducto.TabIndex = 10;
            this.btnGuardarProducto.Text = "Guardar Producto";
            this.btnGuardarProducto.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(461, 184);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(66, 16);
            this.label5.TabIndex = 9;
            this.label5.Text = "Categoría";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(51, 190);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(135, 16);
            this.label3.TabIndex = 7;
            this.label3.Text = "Nombre del Producto";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(488, 70);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 16);
            this.label2.TabIndex = 6;
            this.label2.Text = "Valor";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(89, 71);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 16);
            this.label1.TabIndex = 5;
            this.label1.Text = "Id del Producto";
            // 
            // comboCategoriaProducto
            // 
            this.comboCategoriaProducto.FormattingEnabled = true;
            this.comboCategoriaProducto.Location = new System.Drawing.Point(548, 184);
            this.comboCategoriaProducto.Name = "comboCategoriaProducto";
            this.comboCategoriaProducto.Size = new System.Drawing.Size(161, 24);
            this.comboCategoriaProducto.TabIndex = 4;
            // 
            // txtValorProducto
            // 
            this.txtValorProducto.Location = new System.Drawing.Point(552, 67);
            this.txtValorProducto.Name = "txtValorProducto";
            this.txtValorProducto.Size = new System.Drawing.Size(161, 22);
            this.txtValorProducto.TabIndex = 2;
            // 
            // txtNombreProducto
            // 
            this.txtNombreProducto.Location = new System.Drawing.Point(207, 184);
            this.txtNombreProducto.Name = "txtNombreProducto";
            this.txtNombreProducto.Size = new System.Drawing.Size(161, 22);
            this.txtNombreProducto.TabIndex = 1;
            // 
            // txtIdProducto
            // 
            this.txtIdProducto.Location = new System.Drawing.Point(207, 68);
            this.txtIdProducto.Name = "txtIdProducto";
            this.txtIdProducto.Size = new System.Drawing.Size(161, 22);
            this.txtIdProducto.TabIndex = 0;
            // 
            // navProductos
            // 
            this.navProductos.Controls.Add(this.button3);
            this.navProductos.Controls.Add(this.button2);
            this.navProductos.Controls.Add(this.button1);
            this.navProductos.Dock = System.Windows.Forms.DockStyle.Left;
            this.navProductos.Location = new System.Drawing.Point(0, 0);
            this.navProductos.Name = "navProductos";
            this.navProductos.Padding = new System.Windows.Forms.Padding(20);
            this.navProductos.Size = new System.Drawing.Size(200, 511);
            this.navProductos.TabIndex = 0;
            // 
            // button3
            // 
            this.button3.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button3.Dock = System.Windows.Forms.DockStyle.Top;
            this.button3.Location = new System.Drawing.Point(20, 116);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(160, 48);
            this.button3.TabIndex = 2;
            this.button3.Text = "Listar los Productos";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button2.Dock = System.Windows.Forms.DockStyle.Top;
            this.button2.Location = new System.Drawing.Point(20, 68);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(160, 48);
            this.button2.TabIndex = 1;
            this.button2.Text = "Consultar Producto";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Dock = System.Windows.Forms.DockStyle.Top;
            this.button1.Location = new System.Drawing.Point(20, 20);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(160, 48);
            this.button1.TabIndex = 0;
            this.button1.Text = "Crear Producto";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // VentasForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1023, 556);
            this.Controls.Add(this.FormProductos);
            this.Controls.Add(this.panel1);
            this.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "VentasForm";
            this.Tag = "";
            this.Text = "Ventas";
            this.TransparencyKey = System.Drawing.Color.Gainsboro;
            this.panel1.ResumeLayout(false);
            this.FormProductos.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.navProductos.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnFormVentas;
        private System.Windows.Forms.Button btnFormProductos;
        private System.Windows.Forms.Panel FormProductos;
        private System.Windows.Forms.Panel navProductos;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnGuardarProducto;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboCategoriaProducto;
        private System.Windows.Forms.TextBox txtValorProducto;
        private System.Windows.Forms.TextBox txtNombreProducto;
        private System.Windows.Forms.TextBox txtIdProducto;
    }
}

