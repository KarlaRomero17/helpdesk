using helpdesk.datos;
using helpdesk.model;
using helpdesk.r;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace helpdesk
{
    public partial class FrmCrearPrioridad : Form
    {
        public FrmCrearPrioridad()
        {
            InitializeComponent();
        }
        DataTable tabla = new DataTable();
        private void FrmCrearPrioridad_Load(object sender, EventArgs e)
        {

            txtidprioridad.Text = "0";
            cboestado.Items.Add(new ComboBoxItem() { Value = true, Text = "Activo" });
            cboestado.Items.Add(new ComboBoxItem() { Value = false, Text = "No Activo" });
            cboestado.DisplayMember = "Text";
            cboestado.ValueMember = "Value";
            cboestado.SelectedIndex = 0;

            CargarDatos();
        }

        private void CargarDatos()
        {

            List<Prioridad> oListaPrioridad = D_Prioridad.Listar();
            if (oListaPrioridad == null)
                return;

            if (oListaPrioridad.Count > 0)
            {
                tabla = new DataTable();
                tabla.Columns.Clear();
                tabla.Rows.Clear();
                cboFiltro.Items.Clear();

                lblTotalRegistros.Text = oListaPrioridad.Count.ToString();

                tabla.Columns.Add("id_prioridad", typeof(int));
                tabla.Columns.Add("prioridad", typeof(string));
                tabla.Columns.Add("estado", typeof(string));
                tabla.Columns.Add("activo", typeof(bool));

                foreach (Prioridad row in oListaPrioridad)
                {
                    tabla.Rows.Add(row.id_prioridad, row.prioridad,
                          row.activo == true ? "Activo" : "No Activo", row.activo);
                }

                dgvdata.DataSource = tabla;

                dgvdata.Columns["id_prioridad"].Visible = false;
                dgvdata.Columns["activo"].Visible = false;

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

        private void btnguardar_Click(object sender, EventArgs e)
        {
            bool eseditar = Convert.ToInt32(txtidprioridad.Text) != 0 ? true : false;

            Prioridad oPrioridad = new Prioridad()
            {
                id_prioridad = Convert.ToInt32(txtidprioridad.Text),
                prioridad = txtprioridad.Text,
                activo = Convert.ToBoolean(((ComboBoxItem)cboestado.SelectedItem).Value)
            };

            bool respuesta = false;

            string msgOk = "";
            string msgError = "";
            if (eseditar)
            {
                respuesta = D_Prioridad.Editar(oPrioridad);
                msgOk = "Se guardaron los cambios";
                msgError = "No se puede guardar los cambios";

            }
            else
            {
                respuesta = D_Prioridad.Registrar(oPrioridad);
                msgOk = "Registro exitoso";
                msgError = "No se puede registrar";
            }

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
            //MessageBox.Show();

        }

        private void btnnuevo_Click(object sender, EventArgs e)
        {

            //MessageBox.Show("1");
            gbdatos.Enabled = true;

            btnnuevo.Visible = false;
            btnguardar.Visible = true;

            btnEditar.Visible = false;
            btncancelar.Visible = true;

            btneliminar.Visible = false;
            cboestado.Enabled = false;
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            gbdatos.Enabled = true;

            btnnuevo.Visible = false;
            btnguardar.Visible = true;

            btnEditar.Visible = false;
            btncancelar.Visible = true;

            btneliminar.Visible = false;
            cboestado.Enabled = true;

            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;


                txtidprioridad.Text = dgvdata.Rows[index].Cells["id_prioridad"].Value.ToString();
                txtprioridad.Text = dgvdata.Rows[index].Cells["prioridad"].Value.ToString();
               

                foreach (ComboBoxItem item in cboestado.Items)
                {
                    if ((bool)item.Value == (bool)dgvdata.Rows[index].Cells["activo"].Value)
                    {
                        int id = cboestado.Items.IndexOf(item);
                        cboestado.SelectedIndex = id;
                        break;
                    }
                }


            }
            else
            {
                MessageBox.Show("Selecciona un registro de la lista", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void btncancelar_Click(object sender, EventArgs e)
        {

            gbdatos.Enabled = false;

            btnnuevo.Visible = true;
            btnguardar.Visible = false;

            btnEditar.Visible = true;
            btncancelar.Visible = false;

            btneliminar.Visible = true;
            Reestablecer();
        }

        private void Reestablecer()
        {
            gbdatos.Enabled = false;

            btnnuevo.Visible = true;
            btnguardar.Visible = false;

            btnEditar.Visible = true;
            btncancelar.Visible = false;

            btneliminar.Visible = true;

            txtidprioridad.Text = "0";
            txtprioridad.Text = "";

            cboestado.SelectedIndex = 0;
        }

        private void btneliminar_Click(object sender, EventArgs e)
        {
            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;
                if (MessageBox.Show("¿Desea eliminar la prioridad  '" + dgvdata.Rows[index].Cells["prioridad"].Value.ToString() + "'?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    int id_prioridad = Convert.ToInt32(dgvdata.Rows[index].Cells["id_prioridad"].Value.ToString());

                    bool respuesta = D_Prioridad.Eliminar(id_prioridad);
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
<<<<<<< HEAD
=======

        private void txtFilter_TextChanged(object sender, EventArgs e)
        {
            string columnaFiltro = cboFiltro.SelectedItem.ToString();
            (dgvdata.DataSource as DataTable).DefaultView.RowFilter = string.Format("[" + columnaFiltro + "] like '%{0}%'", txtFilter.Text);

        }
>>>>>>> 0957c61 (prioridad,estado,categoria actualizado)
    }
}
