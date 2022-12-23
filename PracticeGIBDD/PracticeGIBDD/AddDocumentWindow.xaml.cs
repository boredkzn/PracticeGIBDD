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
    /// Логика взаимодействия для AddDocumentWindow.xaml
    /// </summary>
    public partial class AddDocumentWindow : Window
    {
        public Users _user;
        public AddDocumentWindow(Users user)
        {
            GIBDDEntities ent = new GIBDDEntities();
            _user = user;

            var drivers = ent.Drivers.ToList().Where(f => !f.Licences.Any()).ToList();
            InitializeComponent();
            LicenceStatus.ItemsSource = ent.LicenceStatus.Select(f => f.Name).ToList();
            Color.ItemsSource = ent.CarColors.Select(f => f.ColorName).ToList();
            Driver.ItemsSource = drivers.ToList();
            Driver.DisplayMemberPath = "SecondSer";

            Region.ItemsSource = ent.Regions.ToList();
            Region.DisplayMemberPath = "RegionNameRU";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new DocumentWindow(_user).Show();
            this.Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (CarNum.Text != "")
            {
                MessageBox.Show("Номер уже сгенерирован");
                return;
            }
            Random rand = new Random();
            int num = rand.Next(001, 999);
            char[] letters = "АВЕКМНОРСТУХ".ToCharArray();
            var word = "";
            for (int j = 1; j <= 4; j++)
            {                
                int letter_num = rand.Next(0, letters.Length - 1);
                if (j == 2)
                {
                    word += num;
                    continue;
                }
                word += letters[letter_num];
            }
            using(GIBDDEntities ent = new GIBDDEntities())
            {
                var isHaveNum = ent.Licences.ToList().Select(f => f.CarNumber).Contains(word);
                if (!isHaveNum)
                {
                    this.CarNum.Text = word;
                    this.carNumb.Content = word;
                }
                else
                {
                    Button_Click_2(sender, e);
                }
            }
            
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            try
            {
                using (GIBDDEntities gIBDD = new GIBDDEntities())
                {
                    //var licence = gIBDD.Licences.Find(_licence.Id);
                    var driver = ((Drivers)(Driver.SelectedItem));
                    var region = ((Regions)(Region.SelectedItem));
                    var maxIdLic = gIBDD.Licences.ToList().Select(f => f.Id).Max();
                    var licStatus = gIBDD.LicenceStatus.ToList();
                    var asd = LicenceStatus.SelectedItem.ToString();
                    var colorId = gIBDD.CarColors.ToList().Find(f => f.ColorName == Color.SelectedItem.ToString()).ColorNum;
                    var statusId = licStatus.Find(f => f.Name == asd).Id;

                    var newLicence = new Licences()
                    {
                        
                        Id = maxIdLic + 1,
                        IdGuidDriver = driver.IdGuid,
                       
                        LicenceDate = Convert.ToDateTime(LicenceDate.Text),
                        ExpireDate = Convert.ToDateTime(ExpireDate.Text),
                        Categories = Categories.Text,
                        LicenceSeries = Convert.ToInt32(LicenceSeries.Text),
                        LicenceNumber = Convert.ToInt32(LicenceNumber.Text),
                        VIN = VIN.Text,
                        Manufacturer = Manufacturer.Text,
                        Model = Model.Text,
                        Year = Convert.ToInt32(Year.Text),
                        Weight = Convert.ToInt32(Weight.Text),
                        IdStatus = statusId,
                        Color = colorId,
                        IdRegion = region.Id,
                        CarNumber = CarNum.Text
                        
                    };

                    gIBDD.Licences.Add(newLicence);
                    gIBDD.SaveChanges();
                    DocumentWindow documentWindow = new DocumentWindow(_user);
                    MessageBox.Show("Успешно");

                    documentWindow.Show();
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
            Photo.Source = new ImageSourceConverter().ConvertFromString(driver.Photo) as ImageSource;
            Name.Content = driver.Surname;
            SurMid.Content = driver.nameMiddle;
        }

        private void Categories_TextChanged(object sender, TextChangedEventArgs e)
        {
            TextBox textBox = (TextBox)sender;
            Cat.Content = textBox.Text;
        }

        private void Region_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Regions reg = (sender as ComboBox).SelectedItem as Regions;
            Cod.Content = reg.Code;
            Code.Content = reg.Code;
            RegName.Content = reg.RegionNameRU;
        }

        private void LicenceDate_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            DateTime reg = (sender as DatePicker).DisplayDate;
            licD.Content = reg.ToShortDateString();
            licDa.Content = reg.ToShortDateString();
        }

        private void ExpireDate_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            DateTime reg = (sender as DatePicker).DisplayDate.Date;
            endD.Content = reg.ToShortDateString();
            
        }

        private void LicenceSeries_TextChanged(object sender, TextChangedEventArgs e)
        {
            TextBox textBox = (TextBox)sender;
            ser.Content = textBox.Text;
        }

        private void LicenceNumber_TextChanged(object sender, TextChangedEventArgs e)
        {
            TextBox textBox = (TextBox)sender;
            serN.Content = textBox.Text;
        }
    }
}
