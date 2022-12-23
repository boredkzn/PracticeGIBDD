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
    /// Логика взаимодействия для AddFineWindow.xaml
    /// </summary>
    public partial class AddFineWindow : Window
    {
        private byte[] _imageBytes;
        public Users _user;
        public AddFineWindow(Users user)
        {
            GIBDDEntities ent = new GIBDDEntities();
            _user = user;
            InitializeComponent();
            Driver.ItemsSource = ent.Drivers.ToList();
            Driver.DisplayMemberPath = "SecondSer";
            Region.ItemsSource = ent.Regions.ToList();
            Region.DisplayMemberPath = "RegionNameRU";
            Stat.ItemsSource = ent.FineStatuses.ToList();
            Stat.DisplayMemberPath = "Name";
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new FineWindow(_user).Show();
            this.Hide();
        }

        private void AddPhoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.ShowDialog();
            var imag = openFileDialog.FileName;
            _imageBytes = File.ReadAllBytes(openFileDialog.FileName);
            AddPhoto.Visibility = Visibility.Hidden;
            success.Visibility = Visibility.Visible;
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                using (GIBDDEntities gIBDD = new GIBDDEntities())
                {

                    var driver = ((Drivers)(Driver.SelectedItem));
                    var region = ((Regions)(Region.SelectedItem));
                    var status = ((FineStatuses)(Stat.SelectedItem));
                    var maxId = gIBDD.Fine.Select(f => f.Id).ToList(); ;
                    var newFine = new Fine()
                    {
                        Id = maxId.Count == 0 ? 1 : maxId.Max() + 1,
                        IdDriver = driver.IdGuid,
                        CarNumber = gosNum.Text,
                        RegionNameRU = region.RegionNameRU,
                        LicenceNumber = Convert.ToInt32(licNum.Text),
                        CreateDate = LicenceDate.SelectedDate,
                        IdStatus = status.Id,
                        Photo = _imageBytes


                    };

                    gIBDD.Fine.Add(newFine);
                    gIBDD.SaveChanges();
                    FineWindow fineWindow = new FineWindow(_user);
                    MessageBox.Show("Успешно");

                    fineWindow.Show();
                    this.Hide();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Некорректные данные, проверьте правильность ввода или заполнение обязательных полей");
            }
        }

        private void Driver_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Drivers driver = (sender as ComboBox).SelectedItem as Drivers;
            gosNum.Text = driver.Licences.Select(f=>f.CarNumber).First();
            licNum.Text = driver.Licences.Select(f => f.LicenceNumber.ToString()).First();


        }

        private void Region_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Status_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
