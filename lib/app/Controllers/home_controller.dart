import '../Models/currency_model.dart';

class HomeController {
  //buscando a lista de currencies inteira do model
  List<CurrancyModel> currencies;

  //selecionando as moedas no model
  late CurrancyModel fromCoin;
  late CurrancyModel toCoin;

  final String nameFromCoin;
  final String nameToCoin;

  //criando o construtor
  HomeController({required this.nameFromCoin, required this.nameToCoin})
      : currencies = CurrancyModel.getCurrencies() {
    fromCoin = currencies.firstWhere((element) => element.name == nameFromCoin,
        orElse: () => currencies[0]);
    toCoin = currencies.firstWhere((element) => element.name == nameToCoin,
        orElse: () => currencies[0]);
  }

  //criando o método de conversão
  double convert(double value1, double value2) {
    switch (nameFromCoin) {
      case 'Real':
        return realConversion(value1, value2);
      case 'Dolar':
        return dolarConversion(value1, value2);
      default:
        return 0;
    }
  }

  double realConversion(double value1, double value2) {
    switch (nameToCoin) {
      case 'Real':
        return value1;
      case 'Dolar':
        return value1 / fromCoin.real;
      case 'Euro':
        return value1 / fromCoin.euro;
      case 'Bitcoin':
        return value1 / fromCoin.bitcoins;
      default:
        return 0;
    }
  }

  double dolarConversion(double value1, double value2) {
    switch (nameToCoin) {
      case 'Real':
        return value1 * fromCoin.real;
      case 'Dolar':
        return value1;
      case 'Euro':
        return value1 * fromCoin.euro;
      case 'Bitcoin':
        return value1 * fromCoin.bitcoins;
      default:
        return 0;
    }
  }
}
