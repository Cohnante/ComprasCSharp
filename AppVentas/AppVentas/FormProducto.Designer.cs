namespace AppVentas
{
    partial class FormProducto
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
            this.txtIdProducto = new System.Windows.Forms.TextBox();
            this.txtValorProducto = new System.Windows.Forms.TextBox();
            this.txtNombreProducto = new System.Windows.Forms.TextBox();
            this.comboCategoriaProducto = new System.Windows.Forms.ComboBox();
            this.btnGuardarProducto = new System.Windows.Forms.Button();
            this.btnConsultarPr = new System.Windows.Forms.Button();
            this.gridProductos = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnActualizarProducto = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.gridProductos)).BeginInit();
            this.SuspendLayout();
            // 
            // txtIdProducto
            // 
            this.txtIdProducto.Location = new System.Drawing.Point(288, 85);
            this.txtIdProducto.Name = "txtIdProducto";
            this.txtIdProducto.Size = new System.Drawing.Size(100, 22);
            this.txtIdProducto.TabIndex = 0;
            // 
            // txtValorProducto
            // 
            this.txtValorProducto.Location = new System.Drawing.Point(659, 85);
            this.txtValorProducto.Name = "txtValorProducto";
            this.txtValorProducto.Size = new System.Drawing.Size(100, 22);
            this.txtValorProducto.TabIndex = 1;
            // 
            // txtNombreProducto
            // 
            this.txtNombreProducto.Location = new System.Drawing.Point(288, 144);
            this.txtNombreProducto.Name = "txtNombreProducto";
            this.txtNombreProducto.Size = new System.Drawing.Size(100, 22);
            this.txtNombreProducto.TabIndex = 2;
            // 
            // comboCategoriaProducto
            // 
            this.comboCategoriaProducto.FormattingEnabled = true;
            this.comboCategoriaProducto.Location = new System.Drawing.Point(659, 144);
            this.comboCategoriaProducto.Name = "comboCategoriaProducto";
            this.comboCategoriaProducto.Size = new System.Drawing.Size(121, 24);
            this.comboCategoriaProducto.TabIndex = 3;
            // 
            // btnGuardarProducto
            // 
            this.btnGuardarProducto.Location = new System.Drawing.Point(313, 235);
            this.btnGuardarProducto.Name = "btnGuardarProducto";
            this.btnGuardarProducto.Size = new System.Drawing.Size(140, 30);
            this.btnGuardarProducto.TabIndex = 4;
            this.btnGuardarProducto.Text = "Guardar Producto";
            this.btnGuardarProducto.UseVisualStyleBackColor = true;
            this.btnGuardarProducto.Click += new System.EventHandler(this.btnGuardarProducto_Click);
            // 
            // btnConsultarPr
            // 
            this.btnConsultarPr.Location = new System.Drawing.Point(640, 235);
            this.btnConsultarPr.Name = "btnConsultarPr";
            this.btnConsultarPr.Size = new System.Drawing.Size(140, 30);
            this.btnConsultarPr.TabIndex = 5;
            this.btnConsultarPr.Text = "Consultar Producto";
            this.btnConsultarPr.UseVisualStyleBackColor = true;
            this.btnConsultarPr.Click += new System.EventHandler(this.btnConsultarPr_Click);
            // 
            // gridProductos
            // 
            this.gridProductos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridProductos.Location = new System.Drawing.Point(256, 350);
            this.gridProductos.Name = "gridProductos";
            this.gridProductos.RowHeadersWidth = 51;
            this.gridProductos.RowTemplate.Height = 24;
            this.gridProductos.Size = new System.Drawing.Size(618, 173);
            this.gridProductos.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(207, 88);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 16);
            this.label1.TabIndex = 7;
            this.label1.Text = "Id Producto";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(614, 88);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 16);
            this.label2.TabIndex = 8;
            this.label2.Text = "Valor\r\n";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(147, 147);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(135, 16);
            this.label3.TabIndex = 9;
            this.label3.Text = "Nombre del Producto";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(587, 150);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(66, 16);
            this.label4.TabIndex = 10;
            this.label4.Text = "Categoría";
            // 
            // btnActualizarProducto
            // 
            this.btnActualizarProducto.Location = new System.Drawing.Point(478, 277);
            this.btnActualizarProducto.Name = "btnActualizarProducto";
            this.btnActualizarProducto.Size = new System.Drawing.Size(140, 30);
            this.btnActualizarProducto.TabIndex = 11;
            this.btnActualizarProducto.Text = "Actualizar Producto";
            this.btnActualizarProducto.UseVisualStyleBackColor = true;
            this.btnActualizarProducto.Click += new System.EventHandler(this.btnActualizarProducto_Click);
            // 
            // FormProducto
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1116, 601);
            this.ControlBox = false;
            this.Controls.Add(this.btnActualizarProducto);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.gridProductos);
            this.Controls.Add(this.btnConsultarPr);
            this.Controls.Add(this.btnGuardarProducto);
            this.Controls.Add(this.comboCategoriaProducto);
            this.Controls.Add(this.txtNombreProducto);
            this.Controls.Add(this.txtValorProducto);
            this.Controls.Add(this.txtIdProducto);
            this.MinimizeBox = false;
            this.Name = "FormProducto";
            this.ShowIcon = false;
            this.Text = "Productos";
            this.Load += new System.EventHandler(this.Form2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridProductos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtIdProducto;
        private System.Windows.Forms.TextBox txtValorProducto;
        private System.Windows.Forms.TextBox txtNombreProducto;
        private System.Windows.Forms.ComboBox comboCategoriaProducto;
        private System.Windows.Forms.Button btnGuardarProducto;
        private System.Windows.Forms.Button btnConsultarPr;
        private System.Windows.Forms.DataGridView gridProductos;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnActualizarProducto;
    }
}