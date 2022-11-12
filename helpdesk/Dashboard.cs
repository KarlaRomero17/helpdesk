using helpdesk.datos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using helpdesk.model;
using System.IO;
using System.Reflection;

namespace helpdesk
{
    public partial class Dashboard : Form
    {
        private int idusuario;
        public Dashboard(int id_usuario_esperado = 0)
        {
            InitializeComponent();
            idusuario = id_usuario_esperado;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            List<model.Menu> permisos_esperados = D_Usuario.ObtenerPermisos(idusuario);

            MenuStrip menu_user = new MenuStrip();

            foreach(model.Menu objMenu in permisos_esperados)
            {
                ToolStripMenuItem menuPadre = new ToolStripMenuItem(objMenu.Nombre);
                menuPadre.Font = new System.Drawing.Font("Segoe UI", 11F, FontStyle.Bold);
                menuPadre.TextImageRelation = TextImageRelation.ImageAboveText;
                string ruta_img = Path.GetFullPath(Path.Combine(Application.StartupPath, @"../../") + @objMenu.Icono);
                menuPadre.Image = new Bitmap(ruta_img);
                menuPadre.ImageScaling = ToolStripItemImageScaling.None;

                foreach(Submenu objSubmenu in objMenu.ListaSubmenu)
                {
                    ToolStripMenuItem menuHijo = new ToolStripMenuItem(objSubmenu.Nombre, null, click_menu, objSubmenu.NombreFormulario);
                    menuHijo.Font = new System.Drawing.Font("Segoe UI", 12F, FontStyle.Bold); 
                    string pathImage2 = Path.GetFullPath(Path.Combine(Application.StartupPath, @"../../") + @"\icon\icon_item.png");
                    menuHijo.Image = new Bitmap(pathImage2);
                    menuPadre.DropDownItems.Add(menuHijo);  
                }

                menu_user.Items.Add(menuPadre);

            }
            ToolStripMenuItem MnuStripItemExit = new ToolStripMenuItem("Salir", null, ToolStripMenuItemSalir_Click, "");
            MnuStripItemExit.Font = new System.Drawing.Font("Segoe UI", 11F, FontStyle.Bold);
            MnuStripItemExit.TextImageRelation = TextImageRelation.ImageAboveText;
            string pathImage3 = Path.GetFullPath(Path.Combine(Application.StartupPath, @"../../") + @"\icon\Salir.png");
            MnuStripItemExit.Image = new Bitmap(pathImage3);
            MnuStripItemExit.ImageScaling = ToolStripItemImageScaling.None;
            menu_user.Items.Add(MnuStripItemExit);



            this.MainMenuStrip = menu_user;
            Controls.Add(menu_user);

        }

        private void ToolStripMenuItemSalir_Click(object sender, System.EventArgs e)
        {
            if (MessageBox.Show("¿Desea cerrar sesión?", "Mensaje", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {

                this.Close();
            }
        }

        private void click_menu(object sender, System.EventArgs e)
        {
            ToolStripMenuItem menu_seleccionado = (ToolStripMenuItem)sender;
            Assembly asem = Assembly.GetEntryAssembly();
            Type elemento = asem.GetType(asem.GetName().Name + "." + menu_seleccionado.Name);
            if(elemento == null)
            {
                MessageBox.Show("Not found");
            }
            else
            {
                /*
                 * NOTA: cuando se cree un windows form debe tener el mismo nombre que en la base 
                 * para desplegar bien el menu_hijo 
                 * */
                Form FormularioCreado = (Form)Activator.CreateInstance(elemento);

                int encontrado = this.MdiChildren.Where(x => x.Name == FormularioCreado.Name).ToList().Count();
                if(encontrado != 0)
                {
                    //abrir el formulario normal  sin importar si esta minizado o maximizado
                    ((Form)(this.MdiChildren.Where(x => x.Name == FormularioCreado.Name)).FirstOrDefault()).WindowState = FormWindowState.Normal;
                    ((Form)(this.MdiChildren.Where(x => x.Name == FormularioCreado.Name)).FirstOrDefault()).Activate();

                }
                else
                {
                    FormularioCreado.MdiParent = this;
                    FormularioCreado.Show();
                }

            }

           // MessageBox.Show(menu_seleccionado.Name);
        }


    }
}
