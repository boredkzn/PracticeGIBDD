using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PracticeGIBDD
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoginTB.Text = "inspector";
            PasswordTB.Password = "inspector";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void Image_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Registration registration = new Registration();
            registration.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            using(GIBDDEntities ent = new GIBDDEntities())
            {
                var findUser = ent.Users.Where(f => f.Login == LoginTB.Text && f.Password == PasswordTB.Password).ToList();
                if(findUser.Count > 0)
                {
                    Main main = new Main(findUser.First());
                    MessageBox.Show("Успешно");
                    main.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль!");
                }
            }
        }
    }
}
