class PriceModel {
  final String text;
  const PriceModel({required this.text});

  static final List<PriceModel> prices = [
    PriceModel(text: 'Any Price'),
    PriceModel(text: 'up to \$100'),
    PriceModel(text: 'up to \$200'),
    PriceModel(text: 'up to \$300'),
    PriceModel(text: 'up to \$400'),
  ];
}
