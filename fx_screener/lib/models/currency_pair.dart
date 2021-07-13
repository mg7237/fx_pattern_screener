class CurrencyPairData {
  late String currencyOne;
  late String currencyTwo;
  DateTime updateTime = DateTime.now();

  CurrencyPairData({required this.currencyOne, required this.currencyTwo}) {}
}

List<CurrencyPairData> getCurrencyData() {
  List<CurrencyPairData> _list = [
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'AUD'),
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'CAD'),
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'GBP'),
    CurrencyPairData(currencyOne: 'EUR', currencyTwo: 'USD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'AUD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'CAD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'USD'),
    CurrencyPairData(currencyOne: 'GBP', currencyTwo: 'CHF'),
  ];
  return (_list);
}
