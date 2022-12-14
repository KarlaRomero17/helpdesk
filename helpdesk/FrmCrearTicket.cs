using helpdesk.datos;
using helpdesk.model;
using helpdesk.r;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolBar;
using Application = System.Windows.Forms.Application;

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
            MessageBox.Show("Se guardo correctamente"); 
            Reestablecer();
        }
        private void btnArchivos_Click(object sender, EventArgs e)
        {
            //subir info ticket primero
            int my_user = Conf.oUsuario.id_user;
            //MessageBox.Show(""+my_user);
            Ticket oTicket = new Ticket()
            {
                id_prioridad = int.Parse(((ComboBoxItem)cboprioridad.SelectedItem).Value.ToString()),
                id_estado = int.Parse(((ComboBoxItem)cboestado.SelectedItem).Value.ToString()),
                id_categoria = int.Parse(((ComboBoxItem)cbo_categoria.SelectedItem).Value.ToString()),
                id_user = Conf.oUsuario.id_user,
                titulo = txttitulo.Text,
                descripcion = txtdescripcion.Text,
            };
            string id;
            int id_ticke = 0;
            bool respuesta = false;
            id = D_Ticket.RegistrarTicket(oTicket);
            id_ticke = Convert.ToInt32(id);
            if (id!="")
            {
                upload_files(id_ticke);
                respuesta= true;
            }
            else
            {
                respuesta=false;
            }
        }
        public int upload_files(int id_espeprado)
        {
            //int id_espeprado = Convert.ToInt32(txtid_ticket_last.Text);
            bool respuesta_archivo = false;

            //respuesta = D_Ticket.RegistrarTicket(oTicket);
            string fecha = DateTime.Now.ToString("yyyyMMddHmss");
            string fname = fecha+ ".jpg";
            string saveDirectory = @"C:\SavedImages\";
            using (OpenFileDialog openFileDialog1 = new OpenFileDialog())
            {
                openFileDialog1.Filter = "Images (*.JPG;*.PNG)|";
                // Allow the user to select multiple images.
                openFileDialog1.Multiselect = true;
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    if (!Directory.Exists(saveDirectory))
                    {
                        Directory.CreateDirectory(saveDirectory);
                    }
                    string fileName = "";
                    string fileSavePath = "";
                    string extension;
                    string justname="";
                    string file_name = "";
                    foreach (String file in openFileDialog1.FileNames)
                    {
                        // dm.UploadFile(DMIDENTITY, file, Path.GetExtension(file), Path.GetFileName(file));
                        //MessageBox.Show(file);
                        fileName = Path.GetFileName(file);
                        extension =Path.GetExtension(file);
                        // get file name without extension
                        justname = Path.GetFileNameWithoutExtension(fileName.ToString());
                        file_name = justname+"-"+fecha+extension;
                        fileSavePath = Path.Combine(saveDirectory, file_name);
                        //MessageBox.Show(file_name);
                        // File.Copy(openFileDialog1.FileName, fileSavePath, true);
                        Archivo oArchivo = new Archivo()
                        {
                            nombre = file_name,
                            direccion= fileSavePath,
                            id_ticket = id_espeprado
                        };
                        respuesta_archivo = D_Ticket.RegistrarArchivo(oArchivo);

                        //MessageBox.Show("nombre"+ fileName + " direcc" + fileSavePath" extension" + extension);
                        if (respuesta_archivo)
                        {
                            File.Copy(openFileDialog1.FileName, fileSavePath, true);
                           // MessageBox.Show(""+id_espeprado);
                        }
                    }
                }
                return id_espeprado;
            }
        }
        private void Reestablecer()
        {
            txtdescripcion.Text = "";
            txttitulo.Text = "";
            cboestado.SelectedIndex = 0;
            cboprioridad.SelectedIndex = 0;
            cbo_categoria.SelectedIndex = 0;
        }
        //end
    }
}
