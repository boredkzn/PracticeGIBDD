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
    /// Логика взаимодействия для DriversWindow.xaml
    /// </summary>
    public partial class DriversWindow : Window
    {
        private Users _user;
        GIBDDEntities entities = new GIBDDEntities();
        
        public DriversWindow(Users userEnt)
        {
            var drivers = entities.Drivers.ToList();
            _user = userEnt;
            InitializeComponent();
            MainW.DataContext = _user;
            SearchTB.ItemsSource = drivers.Select(f => f.Address).ToList();
            Drivers.ItemsSource = drivers;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Main main = new Main(_user);
            main.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var searchText = SearchTB.Text;
            var findFilter = entities.Drivers.ToList().FindAll(f => f.Address.Contains(searchText));
            Drivers.ItemsSource = findFilter;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            new AddDriverWindow(_user).Show();
            this.Hide();
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {
            Drivers driver = (sender as Button)?.DataContext as Drivers;
            new EditDriverWindow(_user, driver).Show();
            this.Hide();

        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы точно хотите удалить?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if(result == MessageBoxResult.Yes)
            {
                Drivers driver = (sender as Button)?.DataContext as Drivers;
                var findDriver = entities.Drivers.ToList().Find(f => f.IdGuid == driver.IdGuid);
                var findLicen = entities.Licences.ToList().Find(f => f.IdGuidDriver == driver.IdGuid);
                if(findLicen != null)
                    entities.Licences.Remove(findLicen);
                entities.Drivers.Remove(findDriver);
                entities.SaveChanges();
                Drivers.ItemsSource = entities.Drivers.ToList();
            }
            

        }
    }
}
