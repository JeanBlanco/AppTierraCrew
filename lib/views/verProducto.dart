import 'package:flutter/material.dart';
import '../controllers/productoController.dart';
import '../models/producto.dart';

class Verproducto extends StatelessWidget {
  final Productocontroller controlador;

  const Verproducto({super.key, required this.controlador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('See product')),
      body: FutureBuilder<List<Producto>>(
          future: controlador.obtenerProducto(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(
                child: Text('There is no registered product'),
              );
            } else if (snapshot.hasData) {
              final productos = snapshot.data!;
              return ListView.builder(
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    final producto = productos[index];
                    return ListTile(
                      title: Text(producto.code as String),
                      subtitle: Text(
                          'Name: ${producto.name}, Colors: ${producto.colors},Amount: ${producto.amount}, Size: ${producto.size} Price: \$${producto.price.toStringAsFixed(2)} '),
                    );
                  });
            } else {
              return const Center(
                child: Text('something went wrong'),
              );
            }
          }),
    );
  }
}
