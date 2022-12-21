using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для AddDriverWindow.xaml
    /// </summary>
    public partial class AddDriverWindow : Window
    {
        private string imagePath;
        private Users _user;
        public AddDriverWindow(Users user)
        {
            _user = user;
            InitializeComponent();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            using (GIBDDEntities ent = new GIBDDEntities())
            {
                var newGuid = Guid.NewGuid();
                var seriaPas = Passport.Text.Split(' ');
                var driver = new Drivers()
                {
                    IdGuid = Guid.NewGuid(),
                    Surname = Surname.Text,
                    Name = Name.Text,
                    Middlename = Middlename.Text,
                    PassportSerial = Convert.ToInt32(seriaPas.First()),
                    PassportNumber = Convert.ToInt32(seriaPas.Last()),
                    Phone = Phone.Text,
                    Address = Address.Text,
                    AddressLife = AddressLife.Text,
                    Company = Company.Text,
                    Description = Description.Text,
                    Email = Email.Text,
                    Jobname = Jobname.Text,
                    Photo = imagePath
                };
               
                if(driver.Photo == null)
                {
                    MessageBox.Show("Добавьте фото!");
                    return;
                }

                ent.Drivers.Add(driver);
                
                ent.SaveChanges();
                
               
                DriversWindow driversWindow = new DriversWindow(_user);
                driversWindow.Drivers.ItemsSource = ent.Drivers.ToList();
                MessageBox.Show("Успешно");

                driversWindow.Show();
                this.Hide();
            }
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new DriversWindow(_user).Show();
            this.Hide();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
           
            try
            {                   
                OpenFileDialog opFD = new OpenFileDialog();
                opFD.ShowDialog();
                var imag = opFD.FileName;
                string dest = "C:/Users/79196/Source/Repos/boredkzn/PracticeGIBDD/PracticeGIBDD/PracticeGIBDD/Resources/" + System.IO.Path.GetFileName(imag);
                File.Copy(imag, dest);
                imagePath = dest;
                MessageBox.Show("Успешно, фото добавлено");
                AddBut.Visibility = Visibility.Hidden;
                success.Visibility = Visibility.Visible;
                                                     
            }
            catch
            {
                MessageBox.Show("Попробуйте снова, возможно файл с таким именем уже существует!");
            }

            
        }
    }
}
