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
    public partial class FrmCrearUsuario : Form
    {
        public FrmCrearUsuario()
        {
            InitializeComponent();
        }

        private void txtFilter_TextChanged(object sender, EventArgs e)
        {

            string columnaFiltro = cboFiltro.SelectedItem.ToString();
            (dgvdata.DataSource as DataTable).DefaultView.RowFilter = string.Format("[" + columnaFiltro + "] like '%{0}%'", txtFilter.Text);

        }

        private void FrmCrearUsuario_Load(object sender, EventArgs e)
        {
            //editar usuario select items
            List<User> oListaUsuario = D_Usuario.Listar();
            cborol.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione " });
            foreach (User row in oListaUsuario)
            {
                cborol.Items.Add(new ComboBoxItem() { Value = row.id_user, Text = row.nombre_completo });
            }
            cborol.DisplayMember = "Text";
            cborol.ValueMember = "Value";
            cborol.SelectedIndex = 0;
            txtidusuario.Text = "0";

            CargarDatos();
        }
        DataTable tabla = new DataTable();
        private void CargarDatos()
        {

            List<User> oListaUsuario= D_Usuario.Listar();
            if (oListaUsuario == null)
                return;

            if (oListaUsuario.Count > 0)
            {
                tabla = new DataTable();
                tabla.Columns.Clear();
                tabla.Rows.Clear();
                cboFiltro.Items.Clear();

                lblTotalRegistros.Text = oListaUsuario.Count.ToString();

                tabla.Columns.Add("id_user", typeof(int));
                tabla.Columns.Add("id_rol", typeof(int));
                tabla.Columns.Add("nombre", typeof(string));
                tabla.Columns.Add("apellido", typeof(string));
                tabla.Columns.Add("usuario", typeof(string));
                tabla.Columns.Add("clave", typeof(string));

                foreach (User row in oListaUsuario)
                {
                    tabla.Rows.Add(row.id_user, row.oRol.id_rol, 
                          row.nombre, row.apellido, row.usuario, row.clave);
                }

                dgvdata.DataSource = tabla;

                dgvdata.Columns["id_user"].Visible = false;
                dgvdata.Columns["id_rol"].Visible = false;
                dgvdata.Columns["clave"].Visible = false;

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
            bool eseditar = Convert.ToInt32(txtidusuario.Text) != 0 ? true : false;

            User ouser= new User()
            {
                id_user= Convert.ToInt32(txtidusuario.Text),
                nombre = txtnombres.Text,
                apellido = txtapellidos.Text,
                usuario = txtusuario.Text,
                clave = txtusuario.Text,
                idRol = int.Parse(((ComboBoxItem)cborol.SelectedItem).Value.ToString())
            };

            bool respuesta = false;

            string msgOk = "";
            string msgError = "";
            if (eseditar)
            {
                respuesta = D_Usuario.Editar(ouser);
                msgOk = "Se guardaron los cambios";
                msgError = "No se puede guardar los cambios";

            }
            else
            {
                respuesta = D_Usuario.Registrar(ouser);
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
        }

        private void btnnuevo_Click(object sender, EventArgs e)
        {
            gbdatos.Enabled = true;

            btnnuevo.Visible = false;
            btnguardar.Visible = true;

            btnEditar.Visible = false;
            btncancelar.Visible = true;

            btneliminar.Visible = false;
            cborol.Enabled = false;
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            gbdatos.Enabled = true;

            btnnuevo.Visible = false;
            btnguardar.Visible = true;

            btnEditar.Visible = false;
            btncancelar.Visible = true;

            btneliminar.Visible = false;
            cborol.Enabled = true;

            if (dgvdata.SelectedRows.Count > 0)
            {
                DataGridViewRow currentRow = dgvdata.SelectedRows[0];
                int index = currentRow.Index;


                txtidusuario.Text = dgvdata.Rows[index].Cells["id_user"].Value.ToString();
                txtnombres.Text = dgvdata.Rows[index].Cells["nombre"].Value.ToString();
                txtapellidos.Text = dgvdata.Rows[index].Cells["apellido"].Value.ToString();
                txtusuario.Text = dgvdata.Rows[index].Cells["usuario"].Value.ToString();
                txtusuario.Text = dgvdata.Rows[index].Cells["usuario"].Value.ToString();


                foreach (ComboBoxItem item in cborol.Items)
                {
                    if ((bool)item.Value == (bool)dgvdata.Rows[index].Cells["id_rol"].Value)
                    {
                        int id = cborol.Items.IndexOf(item);
                        cborol.SelectedIndex = id;
                        break;
                    }
                }


            }
            else
            {
                MessageBox.Show("Selecciona un registro de la lista", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
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

        private void Reestablecer()
        {
            gbdatos.Enabled = false;

            btnnuevo.Visible = true;
            btnguardar.Visible = false;

            btnEditar.Visible = true;
            btncancelar.Visible = false;

            btneliminar.Visible = true;

            txtidusuario.Text = "0";
            txtnombres.Text = "";
            txtapellidos.Text = "";
            txtusuario.Text = "";

            cborol.SelectedIndex = 0;
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
    }

}
