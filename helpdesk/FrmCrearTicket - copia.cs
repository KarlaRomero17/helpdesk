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
using Application = System.Windows.Forms.Application;

namespace helpdesk
{
    public partial class FrmCrearTicket : Form
    {
        int last_id = 0;
        public FrmCrearTicket()
        {
            InitializeComponent();
            last_id = get_last_id();
            txtid_ticket_last.Text=  last_id.ToString();
            //MessageBox.Show(""+txtid_last);

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
        }

        private void btnArchivos_Click(object sender, EventArgs e)
        {
            /*OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter="Imagenes|*.jpg;*.png";
            ofd.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.MyPictures);

            ofd.Title= "Seleccionar imagenes";*/
            //subir info ticket primero
            int my_user = Conf.oUsuario.id_user;
            Ticket oTicket = new Ticket()
            {
                id_prioridad = int.Parse(((ComboBoxItem)cboprioridad.SelectedItem).Value.ToString()),
                id_estado = int.Parse(((ComboBoxItem)cboestado.SelectedItem).Value.ToString()),
                id_categoria = int.Parse(((ComboBoxItem)cbo_categoria.SelectedItem).Value.ToString()),
                id_user = my_user,
                //Clave = txtcontrasenia.Text,
                titulo = txttitulo.Text,
                descripcion = txtdescripcion.Text,
            };
            string id;

            int id_ticke = 0;
            bool respuesta = false;
            string msgOk = "";
            string msgError = "";

            id = D_Ticket.RegistrarTicket(oTicket);
            id_ticke = Convert.ToInt32(id);

            MessageBox.Show(""+id_ticke);

            if (id!="")
            {
                upload_files(id_ticke);
                MessageBox.Show("se envio");

            }

        }
        private int upload_files(int id_espeprado)
        {
            //int id_espeprado = Convert.ToInt32(txtid_ticket_last.Text);
            bool respuesta = false;
            bool respuesta_archivo = false;
            string msgOk = "";
            string msgError = "";

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
                    foreach (String file in openFileDialog1.FileNames)
                    {
                        // dm.UploadFile(DMIDENTITY, file, Path.GetExtension(file), Path.GetFileName(file));
                        MessageBox.Show(file);
                        fileName = Path.GetFileName(file);
                        fileSavePath = Path.Combine(saveDirectory, fileName);
                        extension =Path.GetExtension(file);

                        // File.Copy(openFileDialog1.FileName, fileSavePath, true);
                        Archivo oArchivo = new Archivo()
                        {
                            nombre = fileName,
                            direccion= fileSavePath,
                            id_ticket = id_espeprado
                        };
                        respuesta_archivo = D_Ticket.RegistrarArchivo(oArchivo);

                        //MessageBox.Show("nombre"+ fileName + " direcc" + fileSavePath" extension" + extension);
                        if (respuesta_archivo)
                        {
                            File.Copy(openFileDialog1.FileName, fileSavePath, true);
                            MessageBox.Show(""+id_espeprado);
                        }
                    }
                }
                return id_espeprado;
            }
        }
        private int get_last_id()
        {
            SqlConnection con = Connection.openConnection();

            SqlCommand com = new SqlCommand("SELECT id_ticket id_ticket_last FROM ticket WHERE id_ticket = (SELECT MAX(id_ticket) FROM ticket)", con);
            
            SqlDataAdapter adaptador = new SqlDataAdapter(com);
            con.Open();
            int modified = (int)com.ExecuteScalar();
            int id_end = modified+1;
            con.Close();

            return id_end;

        }
            //end
    }
}
