import 'package:flutter/material.dart';
import 'package:vamos_mercado/product.dart';
import 'package:vamos_mercado/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos ao mercado',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Vamos ao mercado'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var allInCar = false;

  var products = [
    Product("Banana", 12),
    Product("Sabão em pó", 1.5, unityPrice: 12, measurementUnity: "kg"),
    Product("Leite", 2, measurementUnity: "kg")
  ];

  void _addItems() {
    setState(() {
      var product = Product("name", 1.3);
      products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.checklist),
            tooltip: 'Remove products from car',
            onPressed: () {
              allInCar = !allInCar;
              setState(() {
                products.forEach((element) {
                  element.inCar = allInCar;
                });
              });
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              var prod = products[index];

              return ProductWidget(
                prod,
                (inCar) {
                  setState(() {
                    prod.inCar = inCar!;
                    products.remove(prod);
                    products.add(prod);
                  });
                },
              );
            },
            itemCount: products.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItems,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
