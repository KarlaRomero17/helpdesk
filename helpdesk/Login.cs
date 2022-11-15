using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
//add class
using helpdesk.datos;

namespace helpdesk
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            /*SqlConnection con = Connection.openConnection();

            SqlCommand com = new SqlCommand("select usuario, clave from usuario where usuario=('"+ textBox1.Text +"') and clave=('"+ textBox2.Text +"')", con);
            com.Parameters.AddWithValue("usuario", textBox1.Text);
            com.Parameters.AddWithValue("clave", textBox2.Text);
            SqlDataAdapter adaptador = new SqlDataAdapter(com);
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);

            if (tabla.Rows.Count==1)
            {
                MessageBox.Show("Usuario y contra validos.");
                Form Form2 = new Form2();
                Form2.ShowDialog();
            }
            else
            {
                MessageBox.Show("Usuario y/o contrase;a incorrecto ");
            }*/
            int id_usuario = D_Usuario.Loguear(textBox1.Text, textBox2.Text);
            if(id_usuario != 0)
            {

                //MessageBox.Show("Usuario y contraseña validos.");
                
                Dashboard form2 = new Dashboard(id_usuario);//enviamos el usuario esperado al form2
                form2.Show(); 
                this.Hide();
                form2.FormClosing += Frm_Closing;
            }
            else
            {
                MessageBox.Show("Usuario y/o contraseña incorrecto ");
            }


        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Frm_Closing(object sender, FormClosingEventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox1.Focus();
            this.Show();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
