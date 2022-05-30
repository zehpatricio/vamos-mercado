import 'package:flutter/material.dart';
import 'package:vamos_mercado/product.dart';
import 'package:vamos_mercado/buttons.dart';

class DefaultDialog extends StatelessWidget {
  late Widget body_content;

  DefaultDialog({Key? key, required this.body_content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: IntrinsicHeight(
          child: Column(
            children: [
              _Body(body_content),
              _BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  late Widget body_content;

  _Body(this.body_content);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: body_content,
      );
}

class _BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CancelButton(),
        Container(width: 20),
        ElevatedButton(
          onPressed: () {
            // addProd(Product(prodName!, double.parse(prodQuantity!)));
            // Navigator.of(context).pop();
          },
          child: const Text("Adicionar"),
        )
      ],
    );
  }
}
