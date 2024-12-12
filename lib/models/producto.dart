class Producto {
  late final int? id;
  late final int code;
  late final String name;
  late final String colors;
  late final int size;
  late final int amount;
  late final double price;

  Producto(
      {this.id,
      required this.code,
      required this.name,
      required this.colors,
      required this.size,
      required this.amount,
      required this.price});

// Convert a Product to Map for the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'colors': colors,
      'size': size,
      'amount': amount,
      'price': price
    };
  }

  // Create a Product from a Map (from the database)
  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
        id: map['id'],
        code: map['code'],
        name: map['name'],
        colors: map['colors'],
        size: map['size'],
        amount: map['amount'],
        price: map['price']);
  }
}
