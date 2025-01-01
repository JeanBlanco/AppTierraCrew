import 'package:flutter/material.dart';
import '../controllers/productoController.dart';
import '../models/producto.dart';

class AgregarProducto extends StatelessWidget {
  final Productocontroller controlador;

  AgregarProducto({super.key, required this.controlador});

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController colorsController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: 'Code'),
                keyboardType: TextInputType.number),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: colorsController,
              decoration: const InputDecoration(labelText: 'Colors'),
            ),
            TextField(
                controller: sizeController,
                decoration: const InputDecoration(labelText: 'Size'),
                keyboardType: TextInputType.number),
            TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'amount'),
                keyboardType: TextInputType.number),
            TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final producto = Producto(
                    code: int.parse(codeController.text),
                    name: nameController.text,
                    colors: colorsController.text,
                    size: int.parse(sizeController.text),
                    amount: int.parse(amountController.text),
                    price: double.parse(priceController.text));
                await controlador.agregarProducto(producto);
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
