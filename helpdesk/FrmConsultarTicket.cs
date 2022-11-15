using helpdesk.datos;
using helpdesk.model;
using helpdesk.r;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace helpdesk
{
    public partial class FrmConsultarTicket : Form
    {
        public FrmConsultarTicket()
        {
            InitializeComponent();
        }
        int rol = Conf.oUsuario.oRol.id_rol;
        private void FrmConsultarTicket_Load(object sender, EventArgs e)
        {

            //editar estado select items
            List<Estado> oListaEstado= D_Estado.Listar();
            cboestado.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione " });
            foreach (Estado row in oListaEstado.Where(x => x.activo == true))
            {
                cboestado.Items.Add(new ComboBoxItem() { Value = row.id_estado, Text = row.nombre });
            }
            cboestado.DisplayMember = "Text";
            cboestado.ValueMember = "Value";
            cboestado.SelectedIndex = 0;

            //editar prioridad select items
            List<Prioridad> oListaPrioridad = D_Prioridad.Listar();
            cboprioridad.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione " });
            foreach (Prioridad row in oListaPrioridad.Where(x => x.activo == true))
            {
                cboprioridad.Items.Add(new ComboBoxItem() { Value = row.id_prioridad, Text = row.prioridad });
            }
            cboprioridad.DisplayMember = "Text";
            cboprioridad.ValueMember = "Value";
            cboprioridad.SelectedIndex = 0;

            //editar categoria select items
            List<Categoria> oListaCatwgoria= D_Categoria.Listar();
            cbo_categoria.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione " });
            foreach (Categoria row in oListaCatwgoria.Where(x => x.activo == true))
            {
                cbo_categoria.Items.Add(new ComboBoxItem() { 
                    Value = row.id_categoria, Text = row.categoria });
            }
            cbo_categoria.DisplayMember = "Text";
            cbo_categoria.ValueMember = "Value";
            cbo_categoria.SelectedIndex = 0;

            //editar usuario select items
            List<User> oListaUsuario= D_Usuario.Listar();
            cbo_id_soporte.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione " });
            foreach (User row in oListaUsuario)
            {
                cbo_id_soporte.Items.Add(new ComboBoxItem() { Value = row.id_user, Text = row.nombre_completo });
            }
            cbo_id_soporte.DisplayMember = "Text";
            cbo_id_soporte.ValueMember = "Value";
            cbo_id_soporte.SelectedIndex = 0;

            gbdatos.Enabled=false;
            CargarDatos();
            if (rol == 1)//soporte
            {
                btnasignarme.Visible = true;
                btneliminar.Visible=false;
            }
            else if(rol == 2)//empleado
            {
                btn_nuevo_ticket.Visible =true;
                btneliminar.Visible=false;
                btnEditar.Text="Ver";
                btncancelar.Visible=false;

            }
            else if (rol==3)//admin
            {
                btneliminar.Visible=true;
                btn_re_asignar.Visible=true;
                btnguardar.Visible=false; 
            }
        }
        DataTable tabla = new DataTable();

        private void btncancelar_Click(object sender, EventArgs e)
        {
            gbdatos.Enabled = false;
            gb_soporte.Visible=false;

            btnguardar.Visible = false;
            btn_guardar2.Visible=false;

            btnEditar.Visible = true;
            btncancelar.Visible = false;
            if (rol==3)
            {
                btneliminar.Visible=true;
                btn_re_asignar.Visible=true;
            }

            Reestablecer();
        }
        private void Reestablecer()
        {
            gbdatos.Enabled = false;
            gb_soporte.Visible=false;

            btnguardar.Visible = false;
            btn_guardar2.Visible=false;

            btnEditar.Visible = true;
            btncancelar.Visible = false;

            if (rol==3)
            {
                btneliminar.Visible=true;
                btn_re_asignar.Visible=true;
            }

            //txtidprioridad.Text = "0";
            //txtprioridad.Text = "";

            cboestado.SelectedIndex = 0;
            cboprioridad.SelectedIndex = 0;
            cbo_categoria.SelectedIndex = 0;
        }
        private void CargarDatos()
        {

            List<Ticket> oListaTicket= D_Ticket.Listar();
            if (oListaTicket == null)
                return;

            if (oListaTicket.Count > 0)
            {
                tabla = new DataTable();
                tabla.Columns.Clear();
                tabla.Rows.Clear();
                cboFiltro.Items.Clear();

                lblTotalRegistros.Text = oListaTicket.Count.ToString();

                tabla.Columns.Add("id_ticket", typeof(int));
                tabla.Columns.Add("id_prioridad", typeof(int));
                tabla.Columns.Add("prioridad", typeof(string));
                tabla.Columns.Add("id_estado", typeof(int));
                tabla.Columns.Add("estado", typeof(string));
                tabla.Columns.Add("id_categoria", typeof(int));
                tabla.Columns.Add("categoria", typeof(string));
                tabla.Columns.Add("usuario", typeof(string));
                tabla.Columns.Add("titulo", typeof(string));
                tabla.Columns.Add("descripcion", typeof(string));
                tabla.Columns.Add("soporte_nombre", typeof(string));
                tabla.Columns.Add("id_soporte", typeof(int));
                tabla.Columns.Add("fecha_ingreso", typeof(DateTime));
                //tabla.Columns.Add("estado", typeof(bool));

                foreach (Ticket row in oListaTicket)
                {
                    tabla.Rows.Add(row.id_ticket, row.id_prioridad,
                        row.oPrioridad.prioridad, row.id_estado, row.oEstado.nombre, 
                        row.id_categoria, row.oCategoria.categoria,
                        row.oUsuario.nombre_completo, row.titulo, row.descripcion, 
                        row.oUsuario.soporte_nombre, row.id_soporte,
                        row.fecha_ingreso);
                }

                dgvdata.DataSource = tabla;

                dgvdata.Columns["id_ticket"].Visible = false;
                dgvdata.Columns["descripcion"].Visible = false;
                dgvdata.Columns["id_prioridad"].Visible = false;
                dgvdata.Columns["id_estado"].Visible = false;
                dgvdata.Columns["id_categoria"].Visible = false;
                dgvdata.Columns["id_soporte"].Visible = false;
                //dgvdata.Columns["activo"].Visible = false;
                foreach (DataGridViewColumn cl in dgvdata.Columns)
                {
                    if (cl.Visible == true)
                    {
                        cboFiltro.Items.Add(cl.HeaderText);
                    }
                }
                cboFiltro.SelectedIndex = 0;
            }
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void dgvdata_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void txtdescripcion_TextChanged(object sender, EventArgs e)
        {

        }

        private void cbo_categoria_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {    
            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;
                if (MessageBox.Show("¿Asignarme ticket #'" + dgvdata.Rows[index].Cells["id_ticket"].Value.ToString() + "'?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    int id_ticket = Convert.ToInt32(dgvdata.Rows[index].Cells["id_ticket"].Value.ToString());

                    bool respuesta = D_Ticket.Asignar(id_ticket);
                    if (respuesta)
                    {
                        MessageBox.Show("Asignado correctamente", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        CargarDatos();
                    }
                    else
                    {
                        MessageBox.Show("No se pudo asignar", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
            }
            else
            {
                MessageBox.Show("Selecciona un registro de la lista", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btnguardar_Click(object sender, EventArgs e)
        {

            Ticket oTicket = new Ticket()
            {
                id_ticket= Convert.ToInt32(txtidticket.Text),
                id_prioridad = int.Parse(((ComboBoxItem)cboprioridad.SelectedItem).Value.ToString()),
                id_estado = int.Parse(((ComboBoxItem)cboestado.SelectedItem).Value.ToString()),
                id_categoria = int.Parse(((ComboBoxItem)cbo_categoria.SelectedItem).Value.ToString()),
               
            };

            bool respuesta = false;
                respuesta = D_Ticket.ModificarTicket(oTicket);

            string msgOk = "Se guardo exitosamente";
            string msgError = "Error al ingresar";

            if (respuesta)
            {
                MessageBox.Show(msgOk, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Reestablecer();
                CargarDatos();
            }
            else
            {
                MessageBox.Show(msgError, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btn_nuevo_ticket_Click(object sender, EventArgs e)
        {

            FrmCrearTicket crear_ticket = new FrmCrearTicket();
            crear_ticket.Show();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            gbdatos.Enabled = true;
            gb_soporte.Visible=false;
            btnguardar.Visible = true;
            btn_guardar2.Visible=false;
            btn_re_asignar.Visible=false;

            btnEditar.Visible = false;
            btncancelar.Visible = true;
            /* if (rol==2)
             {

                 btnEditar.Visible = true;
                 btncancelar.Visible = false;
             }*/

            btneliminar.Visible = false;
            cboestado.Enabled = true;
            cboprioridad.Enabled = true;    
            cbo_categoria.Enabled = true;   
            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;


                txtidticket.Text = dgvdata.Rows[index].Cells["id_ticket"].Value.ToString();
                txtdescripcion.Text = dgvdata.Rows[index].Cells["descripcion"].Value.ToString();
                txttitulo.Text = dgvdata.Rows[index].Cells["titulo"].Value.ToString();
                if(rol== 2)
                {
                    cboestado.Enabled=false;
                    cboprioridad.Enabled=false;
                    cbo_categoria.Enabled=false;
                    txtdescripcion.Enabled=false;
                    txttitulo.Enabled=false;
                }
                txtdescripcion.Enabled=false;
                txttitulo.Enabled=false;

                foreach (ComboBoxItem item in cboprioridad.Items)
                {
                    if ((int)item.Value == (int)dgvdata.Rows[index].Cells["id_prioridad"].Value)
                    {
                        int id = cboprioridad.Items.IndexOf(item);
                        cboprioridad.SelectedIndex = id;
                        break;
                    }
                }

                foreach (ComboBoxItem item in cboestado.Items)
                {
                    if ((int)item.Value == (int)dgvdata.Rows[index].Cells["id_estado"].Value)
                    {
                        int id = cboestado.Items.IndexOf(item);
                        cboestado.SelectedIndex = id;
                        break;
                    }
                }
                foreach (ComboBoxItem item in cbo_categoria.Items)
                {
                    if ((int)item.Value == (int)dgvdata.Rows[index].Cells["id_categoria"].Value)
                    {
                        int id = cbo_categoria.Items.IndexOf(item);
                        cbo_categoria.SelectedIndex = id;
                        break;
                    }
                }
            }
            else
            {
                MessageBox.Show("Selecciona un registro de la lista", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void txtFilter_TextChanged(object sender, EventArgs e)
        {
            string columnaFiltro = cboFiltro.SelectedItem.ToString();
            (dgvdata.DataSource as DataTable).DefaultView.RowFilter = string.Format("[" + columnaFiltro + "] like '%{0}%'", txtFilter.Text);

        }

        private void btneliminar_Click(object sender, EventArgs e)
        {
            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;
                if (MessageBox.Show("¿Desea eliminar el ticket # '" + dgvdata.Rows[index].Cells["id_ticket"].Value.ToString() + "'?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    int id_ticket= Convert.ToInt32(dgvdata.Rows[index].Cells["id_ticket"].Value.ToString());

                    bool respuesta = D_Ticket.Eliminar(id_ticket);
                    if (respuesta)
                    {
                        MessageBox.Show("Eliminado correctamente", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        CargarDatos();
                    }
                    else
                    {
                        MessageBox.Show("No se pudo eliminar", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
            }
            else
            {
                MessageBox.Show("Selecciona un registro de la lista", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void cbo_id_soporte_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_re_asignar_Click(object sender, EventArgs e)
        {
            gbdatos.Enabled = true;

            btnguardar.Visible = false;
            btn_guardar2.Visible = true;

            btnEditar.Visible = false;
            btncancelar.Visible = true;
            gb_soporte.Visible=true;
            btn_guardar2.Visible=true;
            cboestado.Enabled=false;
            cbo_categoria.Enabled=false;
            cboprioridad.Enabled=false;


            btn_re_asignar.Visible=false;
            btneliminar.Visible = false;
            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;


                txtidticket.Text = dgvdata.Rows[index].Cells["id_ticket"].Value.ToString();
                
                txtdescripcion.Enabled=false;
                txttitulo.Enabled=false;

                foreach (ComboBoxItem item in cbo_id_soporte.Items)
                {
                    if ((int)item.Value == (int)dgvdata.Rows[index].Cells["id_soporte"].Value)
                    {
                        int id = cbo_id_soporte.Items.IndexOf(item);
                        cbo_id_soporte.SelectedIndex = id;
                        break;
                    }
                }
            }
            else
            {
                MessageBox.Show("Selecciona un registro de la lista", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btn_guardar2_Click(object sender, EventArgs e)
        {

            Ticket oTicket = new Ticket()
            {
                id_ticket= Convert.ToInt32(txtidticket.Text),/*
                id_prioridad = int.Parse(((ComboBoxItem)cboprioridad.SelectedItem).Value.ToString()),
                id_estado = int.Parse(((ComboBoxItem)cboestado.SelectedItem).Value.ToString()),
                id_categoria = int.Parse(((ComboBoxItem)cbo_categoria.SelectedItem).Value.ToString()),*/
                id_soporte= int.Parse(((ComboBoxItem)cbo_id_soporte.SelectedItem).Value.ToString()),

            };

            bool respuesta = false;
            respuesta = D_Ticket.Reasignar_Ticket(oTicket);

            string msgOk = "Se guardo exitosamente";
            string msgError = "Error al ingresar";

            if (respuesta)
            {
                MessageBox.Show(msgOk, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Reestablecer();
                CargarDatos();
            }
            else
            {
                MessageBox.Show(msgError, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btn_editar2_Click(object sender, EventArgs e)
        {

        }

        //end
    }
}
