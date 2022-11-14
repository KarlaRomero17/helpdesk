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

namespace helpdesk
{
    public partial class FrmCrearTicket : Form
    {
        public FrmCrearTicket()
        {
            InitializeComponent();
        }

        private void FrmCrearTicket_Load(object sender, EventArgs e)
        {
            //cargamos listado de prioridad
            List<Prioridad> oListaPrioridad= D_Prioridad.Listar();

            cboprioridad.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione" });
            foreach (Prioridad row in oListaPrioridad)
            {
                cboprioridad.Items.Add(new ComboBoxItem() { Value = row.id_prioridad, Text = row.prioridad });
            }
            cboprioridad.DisplayMember = "Text";
            cboprioridad.ValueMember = "Value";
            cboprioridad.SelectedIndex = 0;

            //cargamos listado de estado
            List<Estado> oListaEstado= D_Estado.Listar();

            cboestado.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione" });
            foreach (Estado row in oListaEstado)
            {
                cboestado.Items.Add(new ComboBoxItem() { Value = row.id_estado, Text = row.nombre });
            }
            cboestado.DisplayMember = "Text";
            cboestado.ValueMember = "Value";
            cboestado.SelectedIndex = 0;

            //cargamos listado de categoria
            List<Categoria> oListaCategoria= D_Categoria.Listar();

            cbo_categoria.Items.Add(new ComboBoxItem() { Value = 0, Text = "Seleccione" });
            foreach (Categoria row in oListaCategoria)
            {
                cbo_categoria.Items.Add(new ComboBoxItem() { Value = row.id_categoria, Text = row.categoria });
            }
            cbo_categoria.DisplayMember = "Text";
            cbo_categoria.ValueMember = "Value";
            cbo_categoria.SelectedIndex = 0;

        }
        private void button2_Click(object sender, EventArgs e)//guardar
        {
            int my_user = Conf.oUsuario.id_user;
            Ticket oTicket = new Ticket()
            {
                //id_ticket = Convert.ToInt32(txtidticket.Text),
                id_prioridad = int.Parse(((ComboBoxItem)cboprioridad.SelectedItem).Value.ToString()),
                id_estado = int.Parse(((ComboBoxItem)cboestado.SelectedItem).Value.ToString()),
                id_categoria = int.Parse(((ComboBoxItem)cbo_categoria.SelectedItem).Value.ToString()),
                id_user = my_user,
                //Clave = txtcontrasenia.Text,
                titulo = txttitulo.Text,
                descripcion = txtdescripcion.Text,
            };
            bool respuesta = false; 
            string msgOk = "";
            string msgError = "";
            //respuesta = D_Ticket.RegistrarTicket(oTicket);
            if (respuesta)
            {
                MessageBox.Show(msgOk, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show(msgError, "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

        }
    }
}
