// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:vamos_mercado/product.dart';

class ProductWidget extends StatelessWidget {
  Product prod;
  void Function(bool?)? onChanged;

  ProductWidget(this.prod, this.onChanged);

  @override
  Widget build(BuildContext context) {
    var prodQuantity = "${prod.quantity.toString()} ${prod.measurementUnity}";
    var quantityXPrice = "$prodQuantity x R\$ ${prod.unityPrice.toString()}";

    var totalProdValue = prod.unityPrice != null
        ? "R\$ ${(prod.quantity * prod.unityPrice!).toStringAsFixed(2)}"
        : "";

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: const FlutterLogo(),
        ),
        Expanded(
          child: Text(prod.name,
              style: TextStyle(
                  fontSize: 18,
                  decoration: prod.inCar
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
        ),
        Container(
          child: ((!(prod.unityPrice == null))
              ? Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(quantityXPrice, style: const TextStyle(fontSize: 12)),
                  Container(height: 4),
                  Text(totalProdValue, style: const TextStyle(fontSize: 16)),
                ])
              : Text(prodQuantity, style: const TextStyle(fontSize: 16))),
        ),
        Checkbox(value: prod.inCar, onChanged: onChanged),
      ],
    );
  }
}
