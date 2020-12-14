using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AutoService.Models
{
    partial class Service
    {
        public int DurationInMinutes
        {
            get
            {
                return DurationInSeconds / 60;
            }
        }
        public double Price
        {
            get
            {
                return Convert.ToDouble(Cost) - (Convert.ToDouble(Cost) * Convert.ToDouble(Discount) / 100);
            }
        }

        public string Visible
        {
            get
            {
                if (Discount == 0)
                {
                    return "Collapsed";
                }
                else
                {
                    return "Visible";
                }
            }
        }
        public string BackgroundColor
        {
            get
            {
                if (Discount != 0)
                {
                    return "#FFE7FABF";
                }
                else
                {
                    return "";
                }
            }
        }

        public byte[] Img
        {
            get
            {
                if (File.Exists(MainImagePath.Trim()))
                {
                    return File.ReadAllBytes(MainImagePath.Trim());
                }
                else
                {
                    return null;
                }
            }
        }


    }
}
