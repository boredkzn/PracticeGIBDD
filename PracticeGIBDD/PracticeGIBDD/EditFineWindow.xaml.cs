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
    /// Логика взаимодействия для EditFineWindow.xaml
    /// </summary>
    public partial class EditFineWindow : Window
    {
        public Users _users;
        public Fine _fine;
        public EditFineWindow(Users user, Fine fine)
        {
            GIBDDEntities ent = new GIBDDEntities();
            
            _users = user;
            _fine = fine;
            var fineStatus = ent.FineStatuses.ToList().Find(f => f.Id == _fine.IdStatus);
            InitializeComponent();
            Stat.ItemsSource = ent.FineStatuses.ToList();
            Stat.DisplayMemberPath = "Name";
            Stat.SelectedItem = fineStatus;
            MainW.DataContext = _fine;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            var status = ((FineStatuses)(Stat.SelectedItem));
            try
            {
                using(GIBDDEntities ent = new GIBDDEntities())
                {
                    var fine = ent.Fine.ToList().Find(f => f.Id == _fine.Id);
                    fine.IdStatus = status.Id;
                    ent.SaveChanges();
                    new FineWindow(_users).Show();
                    this.Hide();
                }
            }
            catch
            {
                MessageBox.Show("Ошибка, попробуйте снова");
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new FineWindow(_users).Show();
            this.Hide();
        }
    }
}
