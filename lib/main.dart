import 'package:flutter/material.dart';
import 'package:vamos_mercado/product.dart';
import 'package:vamos_mercado/widgets.dart';
import 'package:vamos_mercado/add_product.dart';

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
  List<Product> productsOutCar = [
    Product("Banana", 12),
    Product("Sabão em pó", 1.5, unityPrice: 12, measurementUnity: "kg"),
    Product("Leite", 2, measurementUnity: "kg")
  ];

  List<Product> productsInCar = [];

  void _addProd(Product product) {
    setState(() {
      productsOutCar.add(product);
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
              setState(() {
                // TODO: add confirmation dialog
                productsOutCar.addAll(productsInCar);
                productsInCar = [];
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
              if (index == 0) {
                return const Subtitle("Falta pegar");
              }

              index = index - 1;

              if (index == productsOutCar.length) {
                return const Subtitle("Já peguei");
              }

              late var prod;

              if (index < (productsOutCar.length)) {
                prod = productsOutCar[index];
                prod.inCar = false;
              } else {
                index = index - (productsOutCar.length + 1);
                prod = productsInCar[index];
                prod.inCar = true;
              }

              return ProductWidget(
                prod,
                (inCar) {
                  setState(() {
                    prod.inCar = inCar!;
                    if (prod.inCar) {
                      productsOutCar.remove(prod);
                      productsInCar.add(prod);
                    } else {
                      productsInCar.remove(prod);
                      productsOutCar.add(prod);
                    }
                  });
                },
              );
            },
            itemCount: productsOutCar.length + productsInCar.length + 2,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                return AddProductWidget(_addProd);
              });
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
