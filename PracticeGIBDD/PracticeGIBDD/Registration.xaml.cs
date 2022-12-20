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
using System.Windows.Shapes;

namespace PracticeGIBDD
{
    /// <summary>
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Window
    {
        MainWindow mw = new MainWindow();
        public Registration()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                using (GIBDDEntities ent = new GIBDDEntities())
                {
                    var allUsers = ent.Users.ToList();
                    
                    var newUsers = new Users()
                    {
                        Id = allUsers.Select(f => f.Id).Max() + 1,
                        Name = NameTB.Text,
                        Login = LoginTB.Text,
                        Password = PasswordTB.Password
                    };
                    if (allUsers.Select(f => f.Login).Contains(newUsers.Login))
                    {
                        MessageBox.Show("Пользователь с таким логином уже существует");
                    }
                    else
                    {
                        ent.Users.Add(newUsers);
                        ent.SaveChanges();
                        MessageBox.Show("Успешно!");
                        mw.Show();
                        this.Hide();
                    }                  
                }
            }
            catch
            {
                MessageBox.Show("Некорректный ввод, попробуйте еще раз!");
            }
        }
    }
}
