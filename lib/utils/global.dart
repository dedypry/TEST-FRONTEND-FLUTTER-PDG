import 'package:flutter/material.dart';

const FRONT_URI =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home';
const URI =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world';
String getUrl(uri) {
  final parts = Uri.parse(uri).pathSegments;
  if (parts.length >= 3) {
    final pokemonNumber = int.tryParse(parts[parts.length - 2]);
    if (pokemonNumber != null) {
      return '$URI/$pokemonNumber.svg';
    } else {
      return '$URI/1.png';
    }
  } else {
    return '$URI/1.png';
  }
}

int getNumber(uri) {
  final parts = Uri.parse(uri).pathSegments;
  var numb = 0;
  if (parts.length >= 3) {
    final pokemonNumber = int.tryParse(parts[parts.length - 2]);
    if (pokemonNumber != null) {
      numb = pokemonNumber;
    } else {
      numb = 0;
    }
  } else {
    numb = 0;
  }
  return numb;
}

MaterialColor getColor(uri) {
  var numb = getNumber(uri);

  if (numb % 6 == 0) {
    return Colors.red;
  } else if (numb % 3 == 0) {
    return Colors.amber;
  } else if (numb % 2 == 0) {
    return Colors.blue;
  } else {
    return Colors.green;
  }
}

MaterialColor getColorById(int numb) {
  if (numb % 6 == 0) {
    return Colors.red;
  } else if (numb % 3 == 0) {
    return Colors.amber;
  } else if (numb % 2 == 0) {
    return Colors.blue;
  } else {
    return Colors.green;
  }
}

String capitalizeWords(String input) {
  List<String> words = input.split(' ');
  List<String> capitalizedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      capitalizedWords
          .add(word[0].toUpperCase() + word.substring(1).toLowerCase());
    }
  }

  return capitalizedWords.join(' ');
}

String formatNumberWithLeadingZeros(int number, int digitCount) {
  return number.toString().padLeft(digitCount, '0');
}

String formatDigit(int number) {
  if (number < 100) {
    return formatNumberWithLeadingZeros(number, 3);
  }
  return number.toString();
}

MaterialColor getColorByNumber(numb) {
  if (numb >= 90) {
    return Colors.green;
  } else if (numb >= 80) {
    return Colors.purple;
  } else if (numb >= 70) {
    return Colors.blue;
  } else if (numb >= 60) {
    return Colors.amber;
  } else {
    return Colors.red;
  }
}
