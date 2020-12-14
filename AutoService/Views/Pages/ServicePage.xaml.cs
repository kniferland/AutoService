using AutoService.Models;
using AutoService.Utils;
using AutoService.Views.Windows;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для ServicePage.xaml
    /// </summary>
    public partial class ServicePage : Page
    {
        public ServicePage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            SortBox.SelectedIndex = 0; //Значение по умолчанию для combobox сортировки
            FilterBox.Text = "Все"; //Значение по умолчанию по тексту
            Get_Service(SortBox.Text);
        }

        private void Get_Service(string sort = "По возрастанию", string filter = "Все", string search = "")
        {
            int allCount = 0;
            int count = 0;
            //как будет осуществляться сортировка
            List<Service> listService = AppData.db.Services.ToList();//List куда будем помещать значения, получили список услуг
            allCount = listService.Count;//количество записей

            if (sort == "По возрастанию")
            {
                listService = listService.OrderBy(c => c.Price).ToList(); //отсортировали в порядке возрастания
            }
            else
            {
                listService = listService.OrderByDescending(c => c.Price).ToList(); //отсортировали в порядке убывания
            }
            switch (filter)
            {
                case "от 0 до 5%":
                    listService = listService.Where(c => 0 <= c.Discount && c.Discount < 5).ToList();
                    break;
                case "от 5% до 15%":
                    listService = listService.Where(c => 5 <= c.Discount && c.Discount < 15).ToList();
                    break;
                case "от 15% до 30%":
                    listService = listService.Where(c => 15 <= c.Discount && c.Discount < 30).ToList();
                    break;
                case "от 30% до 70%":
                    listService = listService.Where(c => 30 <= c.Discount && c.Discount < 70).ToList();
                    break;
                case "от 70% до 100%":
                    listService = listService.Where(c => 70 <= c.Discount && c.Discount < 100).ToList();
                    break;



                default:
                    break;
            }
            if (!string.IsNullOrEmpty(search) && !string.IsNullOrWhiteSpace(search))
            {
                listService = listService.Where(c => c.Title.ToLower().Contains(search) || c.Description.ToLower().Contains(search)).ToList();
            }
            ServiceGrid.ItemsSource = listService;//выгрузили список услуг
            count = listService.Count; // количество записей
            Counts.Text = $"{count} из {allCount}";// количество записей из всех записей
        }



        private void SortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Get_Service(((ComboBoxItem)SortBox.SelectedValue).Content.ToString(), FilterBox.Text, SearchBox.Text);//содержимое пунктов в sortbox
        }

        private void FilterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Get_Service(SortBox.Text, ((ComboBoxItem)FilterBox.SelectedValue).Content.ToString(), SearchBox.Text);
        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Get_Service(SortBox.Text, FilterBox.Text, SearchBox.Text);
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var SelectedItem = ServiceGrid.SelectedItem as Service; //взяли выбранную строку в ДатаГриде и привели к типу Service(там услуги)
                if (SelectedItem != null)//непустое значение
                {
                    EditServiceWindow editServiceWindow = new EditServiceWindow(SelectedItem);
                    //открыть окно в диалоге
                    editServiceWindow.ShowDialog();
                    Get_Service(SortBox.Text, FilterBox.Text, SearchBox.Text);
                }
                else
                {
                    throw new Exception("Не выбрана запись");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void RecButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var SelectedItem = ServiceGrid.SelectedItem as Service; //взяли выбранную строку в ДатаГриде и привели к типу Service(там услуги)
                if (SelectedItem != null)//непустое значение
                {
                    AddClientWindow addClientWindow = new AddClientWindow(SelectedItem);
                    //открыть окно в диалоге
                    addClientWindow.ShowDialog();
                    Get_Service(SortBox.Text, FilterBox.Text, SearchBox.Text);
                }
                else
                {
                    throw new Exception("Не выбрана запись");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void RemoveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var SelectedItem = ServiceGrid.SelectedItem as Service; //взяли выбранную строку в ДатаГриде и привели к типу Service(там услуги)
                if (SelectedItem != null)//непустое значение
                {
                    if (MessageBox.Show("Вы действительно хотите удалить запись?", "Предупреждение", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                    {
                        var listPhotoes = AppData.db.ServicePhotoes.Where(c => c.ServiceID == SelectedItem.ID).ToList();
                        foreach (var item in listPhotoes)
                        {
                            if (File.Exists(item.PhotoPath.Trim()))//если данный файл существует - его необходимо удалить
                            {
                                File.Delete(item.PhotoPath);//удалить
                            }
                        }
                        AppData.db.ServicePhotoes.RemoveRange(listPhotoes);

                        AppData.db.Services.Remove(SelectedItem);
                        AppData.db.SaveChanges();
                        Get_Service(SortBox.Text, FilterBox.Text, SearchBox.Text);

                    }
                }
                else
                {
                    throw new Exception("Не выбрана запись");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            EditServiceWindow editServiceWindow = new EditServiceWindow(); //открыть окно
            editServiceWindow.ShowDialog(); //открыть окно editservicewindow
        }

        private void ShowRecButton_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow adminWindow = new AdminWindow();
            //открыть окно в диалоге
            adminWindow.ShowDialog();
        }
    }
}
