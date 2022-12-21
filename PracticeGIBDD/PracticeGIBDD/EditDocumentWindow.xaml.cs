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
            _licence = licences;
            _user = users;
            InitializeComponent();
            MainW.DataContext = licences;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new DocumentWindow(_user).Show();
            this.Hide();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {

        }
    }
}
