class LineItem {
  String name;
  int quantity;
  double rate;
  double discount;
  double tax;

  LineItem({
    required this.name,
    required this.quantity,
    required this.rate,
    this.discount = 0.0,
    this.tax = 0.0,
  });

  double get total {
    double discountedRate = rate - discount;
    double baseTotal = discountedRate * quantity;
    return baseTotal + (baseTotal * tax / 100);
  }
}
