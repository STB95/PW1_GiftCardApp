﻿using System;
using System.Globalization;
using System.Windows.Data;

namespace Presentation_WPF {
    public class BoolToSymbolConverter : IValueConverter {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture) {
            return (value is bool b && b) ? "▼" : "►";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) {
            throw new NotSupportedException();
        }
    }
}

//uitbreiding