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
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Window
    {
        MainWindow mainWindow = new MainWindow();
        
        private Users _user;
        
        public Main(Users userEnt)
        {
            _user = userEnt;           
            InitializeComponent();
            MainW.DataContext = _user;            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            mainWindow.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Hide();
            DriversWindow driversWindow = new DriversWindow(_user);
            driversWindow.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            this.Hide();
            FineWindow fineWindow = new FineWindow(_user);
            fineWindow.Show();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            this.Hide();
            DocumentWindow docWindow = new DocumentWindow(_user);
            docWindow.Show();
        }
    }
}
