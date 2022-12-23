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
    /// Логика взаимодействия для FineWindow.xaml
    /// </summary>
    public partial class FineWindow : Window
    {
        private Users _user;
        public FineWindow(Users userEnt)
        {
            GIBDDEntities ent = new GIBDDEntities();
            _user = userEnt;
            InitializeComponent();
            MainW.DataContext = _user;
            SearchTB.ItemsSource = ent.Drivers.ToList().Select(f => f.SecondSer).ToList();
            ListFine.ItemsSource = ent.Fine.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Main main = new Main(_user);
            main.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            GIBDDEntities ent = new GIBDDEntities();
            var searchText = SearchTB.Text;
            var findFilter = ent.Fine.ToList().FindAll(f => f.Drivers.SecondSer.Contains(searchText));
            ListFine.ItemsSource = findFilter;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            new AddFineWindow(_user).Show();
            this.Hide();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            GIBDDEntities ent = new GIBDDEntities();
            MessageBoxResult result = MessageBox.Show("Вы точно хотите удалить?", "Удаление", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Fine fine = (sender as Button)?.DataContext as Fine;

                var findFine = ent.Fine.ToList().Find(f => f.Id == fine.Id);
                ent.Fine.Remove(findFine);

                ent.SaveChanges();
                ListFine.ItemsSource = ent.Fine.ToList();
            }
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {
            Fine fine = (sender as Button).DataContext as Fine;
            new EditFineWindow(_user, fine).Show();
            this.Hide();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            GIBDDEntities ent = new GIBDDEntities();
            var fines = ent.Fine.ToList();
            Microsoft.Office.Interop.Excel.Application exApp = new Microsoft.Office.Interop.Excel.Application();
            exApp.Workbooks.Add();
            Microsoft.Office.Interop.Excel.Worksheet wsh = (Microsoft.Office.Interop.Excel.Worksheet)exApp.ActiveSheet;
            wsh.Cells[1, 1] = "Водитель";
            wsh.Cells[1, 2] = "Госномер";
            wsh.Cells[1, 3] = "Регион";
            wsh.Cells[1, 4] = "Лицензия";
            wsh.Cells[1, 5] = "Статус";
            int i = 2;
            foreach(var item in fines)
            {
                wsh.Cells[i, 1] = item.Drivers.SecondSer;
                wsh.Cells[i, 2] = item.CarNumber;
                wsh.Cells[i, 3] = item.RegionNameRU;
                wsh.Cells[i, 4] = item.LicenceNumber;
                wsh.Cells[i, 5] = item.FineStatuses.Name;
                i++;
            }
            exApp.Visible = true;
        }


    }
}
