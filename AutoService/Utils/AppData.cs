using AutoService.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoService.Utils
{
    class AppData
    {
        static public AutoServiceEntities db = new AutoServiceEntities(); //подключение к БД
    }
}
