using AutoService.Utils;
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
using System.Windows.Threading;

namespace AutoService.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        DispatcherTimer timer;  // объявляем переменную таймера для обновления экрана
        public AdminWindow()
        {
            InitializeComponent();
            timer = new DispatcherTimer();//обновление страницы
            timer.Interval = new TimeSpan(0, 0, 30);//таймер
            timer.Tick += Timer_Tick; //новый метод
            timer.Start(); //запускаем таймер
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            DateTime nextDay = DateTime.Now.AddDays(1.0);
            ClientGrid.ItemsSource = AppData.db.ClientServices.Where(c => c.StartTime >= DateTime.Now && c.StartTime <= nextDay).OrderBy(c => c.StartTime).ToList(); //и сортировка
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            DateTime nextDay = DateTime.Now.AddDays(1.0); //переменная текущий день + 1 день
            ClientGrid.ItemsSource = AppData.db.ClientServices.Where(c => c.StartTime >= DateTime.Now && c.StartTime <= nextDay).OrderBy(c => c.StartTime).ToList(); //и сортировка
        }
    }
}
