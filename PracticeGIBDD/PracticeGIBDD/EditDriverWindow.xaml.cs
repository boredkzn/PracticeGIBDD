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
    /// Логика взаимодействия для EditDriverWindow.xaml
    /// </summary>
    public partial class EditDriverWindow : Window
    {
        private Users _user;
        private Drivers _driver;
        GIBDDEntities entities = new GIBDDEntities();
        public EditDriverWindow(Users user, Drivers driver)
        {
            _user = user;
            _driver = driver;
            InitializeComponent();
            na.DataContext = _user.Name;
            MainW.DataContext = driver;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                using (GIBDDEntities gIBDD = new GIBDDEntities())
                {
                    var driver = gIBDD.Drivers.ToList().Find(f => f.IdGuid == _driver.IdGuid);
                    var seriaPas = Passport.Text.Split(' ');
                    driver.Surname = Surname.Text;
                    driver.Name = Name.Text;
                    driver.Middlename = Middlename.Text;
                    driver.PassportSerial = Convert.ToInt32(seriaPas.First());
                    driver.PassportNumber = Convert.ToInt32(seriaPas.Last());
                    driver.Phone = Phone.Text;
                    driver.Address = Address.Text;
                    driver.AddressLife = AddressLife.Text;
                    driver.Company = Company.Text;
                    driver.Description = Description.Text;
                    driver.Email = Email.Text;
                    driver.Jobname = Jobname.Text;
                    gIBDD.SaveChanges();
                    DriversWindow driversWindow = new DriversWindow(_user);                  
                    MessageBox.Show("Успешно");

                    driversWindow.Show();
                    this.Hide();
                }
            }
            catch
            {
                MessageBox.Show("Некорректные данные, проверьте правильность ввода или заполнение обязательных полей");
            }
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new DriversWindow(_user).Show();
            this.Hide();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            using(GIBDDEntities ent = new GIBDDEntities())
            {
                
                try
                {
                    var driver = ent.Drivers.ToList().Find(f => f.IdGuid == _driver.IdGuid);
                    var Picture = driver.Photo;
                    OpenFileDialog opFD = new OpenFileDialog();
                    opFD.ShowDialog();
                    var imag = opFD.FileName;
                    string dest = "C:/Users/79196/Source/Repos/boredkzn/PracticeGIBDD/PracticeGIBDD/PracticeGIBDD/Resources/" + System.IO.Path.GetFileName(imag);
                    File.Copy(imag, dest);
                    driver.Photo = opFD.SafeFileName;
                    ent.SaveChanges();
                    MainW.DataContext = driver;
                }
                catch
                {
                    MessageBox.Show("Попробуйте снова, возможно файл с таким именем уже существует!");
                }
                
            }
        }
    }
}
