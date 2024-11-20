class CurrancyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoins;

  CurrancyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoins});

  static List<CurrancyModel> getCurrencies() {
    return <CurrancyModel>[
      CurrancyModel(
          name: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoins: 0.000016),
      CurrancyModel(
          name: 'Dolar',
          real: 5.65,
          dolar: 1.0,
          euro: 0.85,
          bitcoins: 0.000088),
      CurrancyModel(
          name: 'Euro', real: 5.62, dolar: 1.17, euro: 1.0, bitcoins: 0.00010),
      CurrancyModel(
          name: 'Bitcoin',
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.54,
          bitcoins: 1),
    ];
  }
}
