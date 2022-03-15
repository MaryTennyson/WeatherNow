import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageGenerator {
  getPath(String imagePath) => 'assets/images/$imagePath.png';

  getImage(String weather) {
    switch (weather) {
      case 'Clouds':
        return getPath('Clouds');

      case 'Clear':
        return getPath('Clear');

      case 'Thunderstorm':
        return getPath('Thunderstorm');

      case 'Drizzle':
        return getPath('Drizzle');

      case 'Snow':
        return getPath('Snow');

      case 'Mist':
        return getPath('Mist');

      case 'Fog':
        return getPath('Fog');
      case 'Haze':
        return getPath('Fog');

      default:
        return 'assets/images/Clear.png';
    }
  }
}
