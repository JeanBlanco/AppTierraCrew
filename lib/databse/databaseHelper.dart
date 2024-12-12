import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/producto.dart';

class Databasehelper {
  static final Databasehelper intance = Databasehelper._privateConstrustor();
  static Database? _database;

  Databasehelper._privateConstrustor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'inventario.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, intversion) async {
    await db.execute('''
    CREATE TABLE producto(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     code INTEGER NOT NULL,
     name TEXT NOT NULL,
     colors TEXT NOT NULL,
     size INTEGER NOT NULL,
     amount INTEGER NOT NULL,
     price REAL NOT NULL
    )
    ''');
  }

  Future<void> insertProducto(Producto producto) async {
    final db = await database;
    await db!.insert('productos', producto.toMap());
  }

  Future<List<Producto>> getProductos() async {
    final db = await database;
    final productos = await db!.query('productos');
    return productos.map((p) => Producto.fromMap(p)).toList();
  }

  Future<Producto?> getProductoById(int id) async {
    final db = await database;
    final productos =
        await db!.query('productos', where: 'id = ?', whereArgs: [id]);
    if (productos.isNotEmpty) {
      return Producto.fromMap(productos.first);
    }
    return null;
  }

  Future<void> updateProducto(Producto producto) async {
    final db = await database;
    await db!.update('productos', producto.toMap(),
        where: 'id = ?', whereArgs: [producto.id]);
  }
}
