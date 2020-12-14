using AutoService.Models;
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
            InitializeComponent();
            this.selectedItem = selectedItem;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            ClientBox.ItemsSource = AppData.db.Clients.ToList(); //загрузили в лист клиентов
            if (selectedItem != null)
            {

                TitleBox.Text = selectedItem.Title;
                DurationInMinutesBox.Text = selectedItem.DurationInSeconds.ToString();


            }
        }

        private void TimeStartBox_LostFocus(object sender, RoutedEventArgs e)
        {

        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ClientService clientService = new ClientService();
                clientService.ClientID = Convert.ToInt32(ClientBox.SelectedValue);
                clientService.ServiceID = selectedItem.ID;
                var time = TimeStartBox.Text.Split(':');//время
                clientService.StartTime = DataPickerBox.SelectedDate.Value.Add(new TimeSpan(Convert.ToInt32(time[0]), Convert.ToInt32(time[1]), 0));
                AppData.db.ClientServices.Add(clientService);
                AppData.db.SaveChanges();
                this.DialogResult = true; //диалог успешно выполнен

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = false;
        }

        private void TimeStartBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            
        }
    }
}
