import '../databse/databaseHelper.dart';
import '../models/producto.dart';

class Productocontroller {
  final dbHelper = Databasehelper.intance;

  get price => null;

  get size => null;

  get colors => null;

  get code => null;

  get name => null;

  //add product
  Future<void> agregarProducto(Producto producto) async {
    await dbHelper.insertProducto(producto);
  }

  // Get all products
  Future<List<Producto>> obtenerProducto() async {
    return dbHelper.getProductos();
  }

  // Download product
  Future<void> descargarProducto(int id, int amount) async {
    Producto? producto = await dbHelper.getProductoById(id);
    if (producto != null && producto.amount >= amount) {
      producto = Producto(
          code: code,
          name: name,
          colors: colors,
          size: size,
          amount: amount,
          price: price);
      await dbHelper.updateProducto(producto);
    } else {
      throw Exception('Insufficient quantity or product not found.');
    }
  }

// Generate report
  Future<Map<String, dynamic>> generarInforme() async {
    List<Producto> productos = await dbHelper.getProductos();
    int totalCantidad = productos.fold(0, (sum, item) => sum + item.amount);
    double valorInventario =
        productos.fold(0.0, (sum, item) => sum + (item.amount * item.price));
    return {
      'totalProductos': productos.length,
      'totalCantidad': totalCantidad,
      'valorInventario': valorInventario
    };
  }
}
