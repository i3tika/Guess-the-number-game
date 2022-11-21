import 'dart:io';
import 'dart:math';

void main() {
  print(
      'Привет это игра угадай число \n Вам нужно выбрат режим игры: \n 1)Угадать число  \n 2)Программа будет угадывать вами загадоное число \n 3)Челендж \n 4)Угадать число, имея ограничыными попытоками ');
  int choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      userFind();
      break;
    case 2:
      pcFind();
      break;
    case 3:
      challange();
      break;
    case 4:
      choiceGame();
      break;
    default:
      main();
  }
}

userFind() {
  int number = Random().nextInt(100);
  int counter = 0;

  while (true) {
    counter++;
    print('ПК выбрал число от 0 до 100');
    int answer = int.parse(stdin.readLineSync()!);
    if (answer == number) {
      print('Yes you Win $counter попытки');
      break;
    } else if (answer < number) {
      print('Чисдо большо');
    } else if (answer > number) {
      print('Число меньше');
    }
  }
}

pcFind() {
  double min = 0;
  double max = 100;
  int counter = 0;

  while (true) {
    counter++;

    print('Загадайте число от 1 до 100');
    double answerNumber = min + (max - min) / 2;
    print('''Ваше число ${answerNumber.round()}
    1)Больше
    2)Меньше
    3) Да это мое число
''');
    String answer = stdin.readLineSync()!;
    if (answer == '1') {
      min = answerNumber;
    } else if (answer == '2') {
      max = answerNumber;
    } else if (answer == '3') {
      print('Ты угадал за $counter попыток');
      break;
    }
  }
  return counter;
}

challange() {
  int pc = pcFind();
  int user = userFind();

  if (pc < user) {
    print('Выйграл пк');
  } else if (pc == user) {
    print('Ничья');
  } else {
    print('выйграл человек');
  }
}

choiceGame() {
  print('Вам нужно угадать число имея ограничыными попытоками \n 1)Угадать число ПК \n 2)ПК будет угадывать вами загадонное число');
  var choce = int.parse(stdin.readLineSync()!);
  switch (choce) {
    case 1:
      userGame();
      break;
    case 2:
      pcGame();
      break;
    default:
  }
}

userGame() {
  int number = Random().nextInt(100);
  int counter = 0;

  print('Условия игры у вас только 5 попуток угадать число');
  while (true) {
    counter++;
    if (counter > 5) {
      print('Конец игры ваши попытки 5 истекли \n Моим числом был $counter');
      break;
    } else {}
    print('ПК выбрал число от 0 до 100');
    int answer = int.parse(stdin.readLineSync()!);
    if (answer == number) {
      print('Yes you Win $counter попытки');
      break;
    } else if (answer < number) {
      print('Чисдо большо');
    } else if (answer > number) {
      print('Число меньше');
    }
  }
}

pcGame() {
  double min = 0;
  double max = 100;
  int counter = 0;

  while (true) {
    counter++;
    if (counter > 5) {
      print('Конец игры мои 5 попытки истекли');
      break;
    }
    print('Загадайте число от 1 до 100');
    double answerNumber = min + (max - min) / 2;
    print('''Ваше число ${answerNumber.round()}
    1)Больше
    2)Меньше
    3) Да это мое число
''');

    String answer = stdin.readLineSync()!;
    if (answer == '1') {
      min = answerNumber;
    } else if (answer == '2') {
      max = answerNumber;
    } else if (answer == '3') {
      print('Ты угадал за $counter попыток');
      break;
    }
  }
  return counter;
}
