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
    /// Логика взаимодействия для EditDocumentWindow.xaml
    /// </summary>
    public partial class EditDocumentWindow : Window
    {
        private Licences _licence;
        private Users _user;
        public EditDocumentWindow(Users users, Licences licences)
        {
            GIBDDEntities ent = new GIBDDEntities();
            _licence = licences;
            _user = users;
            InitializeComponent();
            MainW.DataContext = licences;
            LicenceStatus.SelectedItem = _licence.IdStatus;
            Color.SelectedItem = _licence.CarColors.ColorName;
            LicenceStatus.ItemsSource = ent.LicenceStatus.Select(f=>f.Name).ToList();
            Color.ItemsSource = ent.CarColors.Select(f => f.ColorName).ToList();
            LicenceDate.SelectedDate = licences.LicenceDate;
            ExpireDate.SelectedDate = licences.ExpireDate;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new DocumentWindow(_user).Show();
            this.Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                using (GIBDDEntities gIBDD = new GIBDDEntities())
                {
                    var licence = gIBDD.Licences.Find(_licence.Id);
                    var licStatus = gIBDD.LicenceStatus.ToList();
                    var asd = LicenceStatus.SelectedItem.ToString();
                    var colorId = gIBDD.CarColors.ToList().Find(f => f.ColorName == Color.SelectedItem.ToString()).ColorNum;
                    var statusId = licStatus.Find(f => f.Name == asd).Id;
                    licence.LicenceDate = Convert.ToDateTime(LicenceDate.Text);
                    licence.ExpireDate = Convert.ToDateTime(ExpireDate.Text);
                    licence.Categories = Categories.Text;
                    licence.LicenceSeries = Convert.ToInt32(LicenceSeries.Text);
                    licence.LicenceNumber = Convert.ToInt32(LicenceNumber.Text);
                    licence.VIN = VIN.Text;
                    licence.Manufacturer = Manufacturer.Text;
                    licence.Model = Model.Text;
                    licence.Year = Convert.ToInt32(Year.Text);
                    licence.Weight = Convert.ToInt32(Weight.Text);
                    licence.IdStatus = statusId;
                    licence.Color = colorId;

                    gIBDD.SaveChanges();
                    DocumentWindow documentWindow = new DocumentWindow(_user);                  
                    MessageBox.Show("Успешно");

                    documentWindow.Show();
                    this.Hide();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Некорректные данные, проверьте правильность ввода или заполнение обязательных полей");
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {

        }
    }
}
