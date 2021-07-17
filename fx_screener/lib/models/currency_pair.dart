class CurrencyPairData {
  late String currencyOne;
  late String currencyTwo;
  DateTime updateTime = DateTime.now();

  CurrencyPairData({required this.currencyOne, required this.currencyTwo});
}

class Currency {
  late String currencyCode;
  late String currencyDescription;
  Currency({required this.currencyCode, required this.currencyDescription});
}

List<CurrencyPairData> getCurrencyPairData() {
  List<CurrencyPairData> _list = [
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'AUD'),
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'CAD'),
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'GBP'),
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'USD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'AUD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'CAD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'USD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'CHF'),
    CurrencyPairData(currencyOne: 'USD', currencyTwo: 'AUD'),
    CurrencyPairData(currencyOne: 'USD', currencyTwo: 'CAD'),
    CurrencyPairData(currencyOne: 'USD', currencyTwo: 'EUR'),
    CurrencyPairData(currencyOne: 'USD', currencyTwo: 'CHF'),
  ];
  return (_list);
}

Map<String, Currency> getCurrencyData() {
  Map<String, Currency> _map = {};

  _map['EUR'] = Currency(currencyCode: 'EUR', currencyDescription: 'Euro');
  _map['USD'] =
      Currency(currencyCode: 'USD', currencyDescription: 'U.S. Dollar');
  _map['AUD'] =
      Currency(currencyCode: 'AUD', currencyDescription: 'Australian Dollar');
  _map['NZD'] =
      Currency(currencyCode: 'NZD', currencyDescription: 'New Zealand Dollar');
  _map['CHF'] =
      Currency(currencyCode: 'CHF', currencyDescription: 'Swiss Francs');
  _map['JPY'] =
      Currency(currencyCode: 'JPY', currencyDescription: 'Japanese Yen');
  _map['GBP'] =
      Currency(currencyCode: 'GBP', currencyDescription: 'Great Britain Pound');
  _map['CAD'] =
      Currency(currencyCode: 'CAD', currencyDescription: 'Canadian Dollar');

  return (_map);
}
