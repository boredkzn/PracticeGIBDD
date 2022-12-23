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
    /// Логика взаимодействия для DocumentWindow.xaml
    /// </summary>
    public partial class DocumentWindow : Window
    {
        private Users _user;
        
        public DocumentWindow(Users userEnt)
        {
            GIBDDEntities ent = new GIBDDEntities();
            var document = ent.Licences.ToList();
            var drivers = ent.Drivers.ToList();
            _user = userEnt;
            InitializeComponent();
            MainW.DataContext = _user;
            SearchTB.ItemsSource = drivers.Select(f => f.SecondSer).ToList();
            ListDocument.ItemsSource = ent.Licences.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Main main = new Main(_user);
            main.Show();
            this.Hide();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            GIBDDEntities ent = new GIBDDEntities();
            MessageBoxResult result = MessageBox.Show("Вы точно хотите удалить?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Licences licence = (sender as Button)?.DataContext as Licences;
           
                var findLicen = ent.Licences.ToList().Find(f => f.Id == licence.Id);
                ent.Licences.Remove(findLicen);
             
                ent.SaveChanges();
                ListDocument.ItemsSource = ent.Licences.ToList();
            }
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {

            Licences licence = (sender as Button).DataContext as Licences;
            new EditDocumentWindow(_user, licence).Show();
            this.Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            new AddDocumentWindow(_user).Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            GIBDDEntities ent = new GIBDDEntities();
            var searchText = SearchTB.Text;
            var findFilter = ent.Licences.ToList().FindAll(f => f.Drivers.SecondSer.Contains(searchText));
            ListDocument.ItemsSource = findFilter;
        }
    }
}
