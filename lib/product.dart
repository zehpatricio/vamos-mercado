class Product {
  String name;
  double quantity;
  late String measurementUnity;
  double? unityPrice;
  bool inCar;

  Product(this.name, this.quantity,
      {this.inCar = false, this.measurementUnity = "un", this.unityPrice});
}
