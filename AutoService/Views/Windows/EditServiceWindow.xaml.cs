using AutoService.Models;
using AutoService.Utils;
using Microsoft.Win32;
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
using System.Windows.Shapes;

namespace AutoService.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditServiceWindow.xaml
    /// </summary>
    public partial class EditServiceWindow : Window
    {
        private string imagePath;
        private List<string> listPhotoes;//полные пути к изображениям
        private List<ServicePhoto> listPhotoesExist;//существующие изображения

        private Service selectedItem;

        public EditServiceWindow()
        {
            InitializeComponent();
        }

        public EditServiceWindow(Service selectedItem)
        {
            InitializeComponent();//для отображения нарисованных компонентов
            this.selectedItem = selectedItem;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if (selectedItem != null) // при редактировании запись имеется
            {
                TitleBox.Text = selectedItem.Title;
                CostBox.Text = selectedItem.Cost.ToString("#.##");
                DurationBox.Text = selectedItem.DurationInSeconds.ToString();
                DiscriptionBox.Text = selectedItem.Description;
                DiscountBox.Text = selectedItem.Discount.ToString();

                if (File.Exists(selectedItem.MainImagePath.Trim()))
                {
                    using (var ms = new MemoryStream(selectedItem.Img))
                    {
                        var img = new BitmapImage();
                        img.BeginInit();
                        img.CacheOption = BitmapCacheOption.OnLoad;
                        img.StreamSource = ms;
                        img.EndInit();
                        Image.Source = img;
                    }

                }
                //работа с дополнительными изображениями
                listPhotoesExist = AppData.db.ServicePhotoes.Where(c => c.ServiceID == selectedItem.ID).ToList();
                if (listPhotoesExist.Count > 0)//если какие-то фото дополнительные есть - будем грузить
                {
                    for (int i = 0; i < listPhotoesExist.Count; i++)
                    {
                        if (File.Exists(listPhotoesExist.ElementAt(i).PhotoPath.Trim())) //пытаемся проверить существует ли доп.фотография в servicephoto в бд
                        {
                            Image img = new Image();
                            img.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/" + listPhotoesExist.ElementAt(i).PhotoPath.Trim()));
                            img.Width = 50;
                            img.Height = 50;
                            newImage.Items.Add(img);

                        }
                    }
                }
            }
        }

        private void LoadImageButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image|*.png";
            if (openFileDialog.ShowDialog() == true) // если нажали на ок
            {
                Image.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                imagePath = openFileDialog.FileName;
            }
        }

        private void loadNewImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();//системный диалог открытия выбора файла
            openFileDialog.Filter = "Image|*.png";
            openFileDialog.Multiselect = true;
            if (openFileDialog.ShowDialog() == true) // если нажали на ок
            {
                listPhotoes = openFileDialog.FileNames.ToList();
                foreach (var item in listPhotoes)
                {
                    Image img = new Image();
                    img.Source = new BitmapImage(new Uri(item));
                    img.Width = 50;
                    img.Height = 50;
                    newImage.Items.Add(img);
                }
            }
        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Convert.ToDouble(DurationBox.Text) / 3600 <= 4) //если меньше 4 часов
                {
                    if (selectedItem != null)//если какое то поле пользователь поменял - оно будет записано, проверка на существование записи
                    {//редактирование записи
                        selectedItem.Title = TitleBox.Text;
                        selectedItem.Cost = Convert.ToDecimal(CostBox.Text);
                        selectedItem.DurationInSeconds = Convert.ToInt32(DurationBox.Text);
                        selectedItem.Description = DiscriptionBox.Text;
                        selectedItem.Discount = Convert.ToDouble(DiscountBox.Text);
                        if (!string.IsNullOrEmpty(imagePath)) //проверяем пустой или нет, когда не пустой
                        {
                            File.Copy(imagePath, Environment.CurrentDirectory + "/" + selectedItem.MainImagePath.Trim(), true); //откуда - куда копируем и разрешаем перезапись. путь до debug (где Exe)
                        }
                        // код для работы с доп изображениями!!
                        AppData.db.SaveChanges();
                        this.DialogResult = true;
                    }
                    else //добавление записи
                    {
                        int repeatService = AppData.db.Services.Where(c => c.Title.ToLower().Trim() == TitleBox.Text.ToLower().Trim()).Count();
                        if (repeatService == 0)
                        {
                            selectedItem = new Service();
                            selectedItem.Title = TitleBox.Text;
                            selectedItem.Cost = Convert.ToDecimal(CostBox.Text);
                            selectedItem.DurationInSeconds = Convert.ToInt32(DurationBox.Text);
                            selectedItem.Description = DiscriptionBox.Text;
                            selectedItem.Discount = Convert.ToDouble(DiscountBox.Text);
                            selectedItem.MainImagePath = System.IO.Path.GetFileName(imagePath); //получаем имя файла
                            Image.Source = null; // очищаем перед копированием, чтобы освободить
                                                 //Файлы нужно брать из другой папки!

                            File.Copy(imagePath, "Услуги автосервиса/" + System.IO.Path.GetFileName(imagePath)); //откуда - куда копируем и разрешаем перезапись. путь до debug (где Exe)
                            AppData.db.Services.Add(selectedItem);
                            AppData.db.SaveChanges();
                            this.DialogResult = true;
                        }
                        else
                        {
                            throw new Exception("Такая запись уже существует");
                        }
                    }
                }
                else
                {
                    throw new Exception("Длительность более 4 часов");
                }
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
    }
}
