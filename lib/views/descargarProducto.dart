import 'package:flutter/material.dart';
import '../controllers/productoController.dart';

class Descargarproducto extends StatelessWidget {
  final Productocontroller controlador;

  Descargarproducto({super.key, required this.controlador});

  final TextEditingController idController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID the product'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: amountController,
              decoration:
                  const InputDecoration(labelText: 'quantity to download'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await controlador.descargarProducto(
                    int.parse(idController.text),
                    int.parse(amountController.text),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Product downloaded successfully')));
                  Navigator.pop(context);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'))
                            ],
                          ));
                }
              },
              child: const Text('Dawload'),
            )
          ],
        ),
      ),
    );
  }
}
