using AutoService.Models;
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

namespace AutoService.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddClientWindow.xaml
    /// </summary>
    public partial class AddClientWindow : Window
    {
        private Service selectedItem;

        public AddClientWindow()
        {
            InitializeComponent();
        }

        public AddClientWindow(Service selectedItem)
        {
            this.selectedItem = selectedItem;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void TimeStartBox_LostFocus(object sender, RoutedEventArgs e)
        {

        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void TimeStartBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {

        }
    }
}
