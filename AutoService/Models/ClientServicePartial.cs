using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoService.Models
{
    partial class ClientService
    {
        public string TimeStart //Столбец - времени осталось
        {
            get
            {
                return $"{(StartTime - DateTime.Now).Hours} часа(ов) {(StartTime - DateTime.Now).Minutes} минут";// Время начала - текущее
            }
        }
        public string сolor //цвет если осталось меньше часа
        {
            get
            {
                if (((StartTime - DateTime.Now).Hours) == 0)
                {
                    return "#FF0000";
                }
                else
                {
                    return "#000000";
                }

            }
        }
    }
}
