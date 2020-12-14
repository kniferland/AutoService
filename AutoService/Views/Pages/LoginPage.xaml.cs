﻿using System;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AutoService.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void EnterAdminButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (PasswordBox.Text == "0000")
                {
                    Properties.Settings.Default.IsAdmin = "Visible";
                    NavigationService.Navigate(new ServicePage());
                }
                else
                {
                    throw new Exception("Неверный пароль");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }

        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            Properties.Settings.Default.IsAdmin = "Collapsed";
            NavigationService.Navigate(new ServicePage()); //создание перехода на новую страницу
        }
    }
}
