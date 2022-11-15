namespace helpdesk
{
    partial class FrmConsultarTicket
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.btneliminar = new System.Windows.Forms.Button();
            this.btnguardar = new System.Windows.Forms.Button();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btncancelar = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.lblTotalRegistros = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.txtFilter = new System.Windows.Forms.TextBox();
            this.cboFiltro = new System.Windows.Forms.ComboBox();
            this.label10 = new System.Windows.Forms.Label();
            this.dgvdata = new System.Windows.Forms.DataGridView();
            this.gbdatos = new System.Windows.Forms.GroupBox();
            this.txtidticket = new System.Windows.Forms.TextBox();
            this.cboestado = new System.Windows.Forms.ComboBox();
            this.cboprioridad = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cbo_categoria = new System.Windows.Forms.ComboBox();
            this.txttitulo = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtdescripcion = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnasignarme = new System.Windows.Forms.Button();
            this.btn_nuevo_ticket = new System.Windows.Forms.Button();
            this.btn_re_asignar = new System.Windows.Forms.Button();
            this.gb_soporte = new System.Windows.Forms.Panel();
            this.cbo_id_soporte = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btn_guardar2 = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvdata)).BeginInit();
            this.gbdatos.SuspendLayout();
            this.gb_soporte.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btn_guardar2);
            this.panel1.Controls.Add(this.btn_re_asignar);
            this.panel1.Controls.Add(this.btn_nuevo_ticket);
            this.panel1.Controls.Add(this.btnasignarme);
            this.panel1.Controls.Add(this.btneliminar);
            this.panel1.Controls.Add(this.btnguardar);
            this.panel1.Controls.Add(this.btnEditar);
            this.panel1.Controls.Add(this.btncancelar);
            this.panel1.Location = new System.Drawing.Point(475, 205);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(418, 42);
            this.panel1.TabIndex = 48;
            // 
            // btneliminar
            // 
            this.btneliminar.BackColor = System.Drawing.Color.Red;
            this.btneliminar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btneliminar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btneliminar.ForeColor = System.Drawing.Color.White;
            this.btneliminar.Location = new System.Drawing.Point(338, 3);
            this.btneliminar.Name = "btneliminar";
            this.btneliminar.Size = new System.Drawing.Size(75, 23);
            this.btneliminar.TabIndex = 39;
            this.btneliminar.Text = "Eliminar";
            this.btneliminar.UseVisualStyleBackColor = false;
            this.btneliminar.Click += new System.EventHandler(this.btneliminar_Click);
            // 
            // btnguardar
            // 
            this.btnguardar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(0)))));
            this.btnguardar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnguardar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnguardar.ForeColor = System.Drawing.Color.White;
            this.btnguardar.Location = new System.Drawing.Point(176, 3);
            this.btnguardar.Name = "btnguardar";
            this.btnguardar.Size = new System.Drawing.Size(75, 23);
            this.btnguardar.TabIndex = 37;
            this.btnguardar.Text = "Guardar";
            this.btnguardar.UseVisualStyleBackColor = false;
            this.btnguardar.Visible = false;
            this.btnguardar.Click += new System.EventHandler(this.btnguardar_Click);
            // 
            // btnEditar
            // 
            this.btnEditar.BackColor = System.Drawing.Color.RoyalBlue;
            this.btnEditar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnEditar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnEditar.ForeColor = System.Drawing.Color.White;
            this.btnEditar.Location = new System.Drawing.Point(257, 3);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(75, 23);
            this.btnEditar.TabIndex = 38;
            this.btnEditar.Text = "Editar";
            this.btnEditar.UseVisualStyleBackColor = false;
            this.btnEditar.Click += new System.EventHandler(this.btnEditar_Click);
            // 
            // btncancelar
            // 
            this.btncancelar.BackColor = System.Drawing.Color.Red;
            this.btncancelar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btncancelar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btncancelar.ForeColor = System.Drawing.Color.White;
            this.btncancelar.Location = new System.Drawing.Point(257, 3);
            this.btncancelar.Name = "btncancelar";
            this.btncancelar.Size = new System.Drawing.Size(75, 23);
            this.btncancelar.TabIndex = 40;
            this.btncancelar.Text = "Cancelar";
            this.btncancelar.UseVisualStyleBackColor = false;
            this.btncancelar.Visible = false;
            this.btncancelar.Click += new System.EventHandler(this.btncancelar_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.lblTotalRegistros);
            this.groupBox2.Controls.Add(this.label11);
            this.groupBox2.Controls.Add(this.txtFilter);
            this.groupBox2.Controls.Add(this.cboFiltro);
            this.groupBox2.Controls.Add(this.label10);
            this.groupBox2.Controls.Add(this.dgvdata);
            this.groupBox2.Location = new System.Drawing.Point(13, 253);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(880, 275);
            this.groupBox2.TabIndex = 47;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Lista de Cursos";
            this.groupBox2.Enter += new System.EventHandler(this.groupBox2_Enter);
            // 
            // lblTotalRegistros
            // 
            this.lblTotalRegistros.AutoSize = true;
            this.lblTotalRegistros.BackColor = System.Drawing.Color.White;
            this.lblTotalRegistros.ForeColor = System.Drawing.Color.Black;
            this.lblTotalRegistros.Location = new System.Drawing.Point(853, 259);
            this.lblTotalRegistros.Name = "lblTotalRegistros";
            this.lblTotalRegistros.Size = new System.Drawing.Size(13, 13);
            this.lblTotalRegistros.TabIndex = 23;
            this.lblTotalRegistros.Text = "0";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.BackColor = System.Drawing.Color.White;
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(754, 259);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(84, 13);
            this.label11.TabIndex = 22;
            this.label11.Text = "Total Registros :";
            // 
            // txtFilter
            // 
            this.txtFilter.Location = new System.Drawing.Point(212, 19);
            this.txtFilter.Name = "txtFilter";
            this.txtFilter.Size = new System.Drawing.Size(153, 20);
            this.txtFilter.TabIndex = 21;
            this.txtFilter.TextChanged += new System.EventHandler(this.txtFilter_TextChanged);
            // 
            // cboFiltro
            // 
            this.cboFiltro.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cboFiltro.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboFiltro.FormattingEnabled = true;
            this.cboFiltro.Location = new System.Drawing.Point(85, 19);
            this.cboFiltro.Name = "cboFiltro";
            this.cboFiltro.Size = new System.Drawing.Size(121, 21);
            this.cboFiltro.TabIndex = 20;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.ForeColor = System.Drawing.Color.Black;
            this.label10.Location = new System.Drawing.Point(23, 22);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(56, 13);
            this.label10.TabIndex = 19;
            this.label10.Text = "Filtrar  por:";
            // 
            // dgvdata
            // 
            this.dgvdata.AllowUserToAddRows = false;
            this.dgvdata.AllowUserToDeleteRows = false;
            this.dgvdata.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvdata.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvdata.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dgvdata.Location = new System.Drawing.Point(6, 48);
            this.dgvdata.MultiSelect = false;
            this.dgvdata.Name = "dgvdata";
            this.dgvdata.ReadOnly = true;
            this.dgvdata.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvdata.Size = new System.Drawing.Size(859, 200);
            this.dgvdata.TabIndex = 18;
            this.dgvdata.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvdata_CellContentClick);
            // 
            // gbdatos
            // 
            this.gbdatos.Controls.Add(this.gb_soporte);
            this.gbdatos.Controls.Add(this.txtdescripcion);
            this.gbdatos.Controls.Add(this.label5);
            this.gbdatos.Controls.Add(this.cbo_categoria);
            this.gbdatos.Controls.Add(this.txttitulo);
            this.gbdatos.Controls.Add(this.label4);
            this.gbdatos.Controls.Add(this.label3);
            this.gbdatos.Controls.Add(this.cboestado);
            this.gbdatos.Controls.Add(this.cboprioridad);
            this.gbdatos.Controls.Add(this.label1);
            this.gbdatos.Controls.Add(this.label2);
            this.gbdatos.Controls.Add(this.txtidticket);
            this.gbdatos.Enabled = false;
            this.gbdatos.Location = new System.Drawing.Point(12, 12);
            this.gbdatos.Name = "gbdatos";
            this.gbdatos.Size = new System.Drawing.Size(881, 187);
            this.gbdatos.TabIndex = 46;
            this.gbdatos.TabStop = false;
            this.gbdatos.Text = "Ingrese Datos";
            // 
            // txtidticket
            // 
            this.txtidticket.Location = new System.Drawing.Point(852, 10);
            this.txtidticket.Name = "txtidticket";
            this.txtidticket.Size = new System.Drawing.Size(22, 20);
            this.txtidticket.TabIndex = 5;
            this.txtidticket.Visible = false;
            // 
            // cboestado
            // 
            this.cboestado.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cboestado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboestado.FormattingEnabled = true;
            this.cboestado.Location = new System.Drawing.Point(278, 30);
            this.cboestado.Name = "cboestado";
            this.cboestado.Size = new System.Drawing.Size(153, 21);
            this.cboestado.TabIndex = 16;
            // 
            // cboprioridad
            // 
            this.cboprioridad.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cboprioridad.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboprioridad.FormattingEnabled = true;
            this.cboprioridad.Location = new System.Drawing.Point(61, 30);
            this.cboprioridad.Name = "cboprioridad";
            this.cboprioridad.Size = new System.Drawing.Size(141, 21);
            this.cboprioridad.TabIndex = 15;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 33);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 13);
            this.label1.TabIndex = 13;
            this.label1.Text = "Prioridad";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(232, 33);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(40, 13);
            this.label2.TabIndex = 14;
            this.label2.Text = "Estado";
            // 
            // cbo_categoria
            // 
            this.cbo_categoria.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cbo_categoria.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbo_categoria.FormattingEnabled = true;
            this.cbo_categoria.Location = new System.Drawing.Point(542, 25);
            this.cbo_categoria.Name = "cbo_categoria";
            this.cbo_categoria.Size = new System.Drawing.Size(297, 21);
            this.cbo_categoria.TabIndex = 20;
            this.cbo_categoria.SelectedIndexChanged += new System.EventHandler(this.cbo_categoria_SelectedIndexChanged);
            // 
            // txttitulo
            // 
            this.txttitulo.Location = new System.Drawing.Point(61, 69);
            this.txttitulo.Name = "txttitulo";
            this.txttitulo.Size = new System.Drawing.Size(370, 20);
            this.txttitulo.TabIndex = 19;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(7, 72);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(40, 13);
            this.label4.TabIndex = 18;
            this.label4.Text = "Asunto";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(467, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 13);
            this.label3.TabIndex = 17;
            this.label3.Text = "Categoria";
            // 
            // txtdescripcion
            // 
            this.txtdescripcion.Location = new System.Drawing.Point(76, 117);
            this.txtdescripcion.Multiline = true;
            this.txtdescripcion.Name = "txtdescripcion";
            this.txtdescripcion.Size = new System.Drawing.Size(443, 54);
            this.txtdescripcion.TabIndex = 22;
            this.txtdescripcion.TextChanged += new System.EventHandler(this.txtdescripcion_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(7, 105);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(63, 13);
            this.label5.TabIndex = 21;
            this.label5.Text = "Descripcion";
            // 
            // btnasignarme
            // 
            this.btnasignarme.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btnasignarme.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnasignarme.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnasignarme.ForeColor = System.Drawing.Color.White;
            this.btnasignarme.Location = new System.Drawing.Point(95, 3);
            this.btnasignarme.Name = "btnasignarme";
            this.btnasignarme.Size = new System.Drawing.Size(75, 23);
            this.btnasignarme.TabIndex = 41;
            this.btnasignarme.Text = "Asignarme";
            this.btnasignarme.UseVisualStyleBackColor = false;
            this.btnasignarme.Visible = false;
            this.btnasignarme.Click += new System.EventHandler(this.button1_Click);
            // 
            // btn_nuevo_ticket
            // 
            this.btn_nuevo_ticket.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.btn_nuevo_ticket.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_nuevo_ticket.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_nuevo_ticket.ForeColor = System.Drawing.Color.White;
            this.btn_nuevo_ticket.Location = new System.Drawing.Point(176, 3);
            this.btn_nuevo_ticket.Name = "btn_nuevo_ticket";
            this.btn_nuevo_ticket.Size = new System.Drawing.Size(75, 23);
            this.btn_nuevo_ticket.TabIndex = 42;
            this.btn_nuevo_ticket.Text = "Nuevo Ticket";
            this.btn_nuevo_ticket.UseVisualStyleBackColor = false;
            this.btn_nuevo_ticket.Visible = false;
            this.btn_nuevo_ticket.Click += new System.EventHandler(this.btn_nuevo_ticket_Click);
            // 
            // btn_re_asignar
            // 
            this.btn_re_asignar.BackColor = System.Drawing.Color.Green;
            this.btn_re_asignar.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_re_asignar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_re_asignar.ForeColor = System.Drawing.Color.White;
            this.btn_re_asignar.Location = new System.Drawing.Point(95, 3);
            this.btn_re_asignar.Name = "btn_re_asignar";
            this.btn_re_asignar.Size = new System.Drawing.Size(75, 23);
            this.btn_re_asignar.TabIndex = 43;
            this.btn_re_asignar.Text = "Asignar";
            this.btn_re_asignar.UseVisualStyleBackColor = false;
            this.btn_re_asignar.Visible = false;
            this.btn_re_asignar.Click += new System.EventHandler(this.btn_re_asignar_Click);
            // 
            // gb_soporte
            // 
            this.gb_soporte.Controls.Add(this.cbo_id_soporte);
            this.gb_soporte.Controls.Add(this.label6);
            this.gb_soporte.Location = new System.Drawing.Point(542, 72);
            this.gb_soporte.Name = "gb_soporte";
            this.gb_soporte.Size = new System.Drawing.Size(324, 100);
            this.gb_soporte.TabIndex = 23;
            this.gb_soporte.Visible = false;
            // 
            // cbo_id_soporte
            // 
            this.cbo_id_soporte.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cbo_id_soporte.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbo_id_soporte.FormattingEnabled = true;
            this.cbo_id_soporte.Location = new System.Drawing.Point(77, 11);
            this.cbo_id_soporte.Name = "cbo_id_soporte";
            this.cbo_id_soporte.Size = new System.Drawing.Size(141, 21);
            this.cbo_id_soporte.TabIndex = 17;
            this.cbo_id_soporte.SelectedIndexChanged += new System.EventHandler(this.cbo_id_soporte_SelectedIndexChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(23, 14);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(44, 13);
            this.label6.TabIndex = 16;
            this.label6.Text = "Soporte";
            // 
            // btn_guardar2
            // 
            this.btn_guardar2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(128)))), ((int)(((byte)(255)))));
            this.btn_guardar2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btn_guardar2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btn_guardar2.ForeColor = System.Drawing.Color.White;
            this.btn_guardar2.Location = new System.Drawing.Point(176, 3);
            this.btn_guardar2.Name = "btn_guardar2";
            this.btn_guardar2.Size = new System.Drawing.Size(75, 23);
            this.btn_guardar2.TabIndex = 49;
            this.btn_guardar2.Text = "Guardar";
            this.btn_guardar2.UseVisualStyleBackColor = false;
            this.btn_guardar2.Visible = false;
            this.btn_guardar2.Click += new System.EventHandler(this.btn_guardar2_Click);
            // 
            // FrmConsultarTicket
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(910, 540);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.gbdatos);
            this.Name = "FrmConsultarTicket";
            this.Text = "Consultar Ticket";
            this.Load += new System.EventHandler(this.FrmConsultarTicket_Load);
            this.panel1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvdata)).EndInit();
            this.gbdatos.ResumeLayout(false);
            this.gbdatos.PerformLayout();
            this.gb_soporte.ResumeLayout(false);
            this.gb_soporte.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btneliminar;
        private System.Windows.Forms.Button btnguardar;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btncancelar;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label lblTotalRegistros;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtFilter;
        private System.Windows.Forms.ComboBox cboFiltro;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.DataGridView dgvdata;
        private System.Windows.Forms.GroupBox gbdatos;
        private System.Windows.Forms.TextBox txtidticket;
        private System.Windows.Forms.TextBox txtdescripcion;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbo_categoria;
        private System.Windows.Forms.TextBox txttitulo;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cboestado;
        private System.Windows.Forms.ComboBox cboprioridad;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnasignarme;
        private System.Windows.Forms.Button btn_nuevo_ticket;
        private System.Windows.Forms.Button btn_re_asignar;
        private System.Windows.Forms.Panel gb_soporte;
        private System.Windows.Forms.ComboBox cbo_id_soporte;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btn_guardar2;
    }
}