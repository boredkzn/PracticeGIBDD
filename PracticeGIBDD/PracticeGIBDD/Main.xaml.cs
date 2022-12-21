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
            
            mainWindow.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            
            DriversWindow driversWindow = new DriversWindow(_user);
            driversWindow.Show();
            this.Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            
            FineWindow fineWindow = new FineWindow(_user);
            fineWindow.Show();
            this.Hide();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            
            DocumentWindow docWindow = new DocumentWindow(_user);
            docWindow.Show();
            this.Hide();
        }
    }
}
