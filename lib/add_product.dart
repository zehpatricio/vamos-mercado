import 'package:flutter/material.dart';
import 'package:vamos_mercado/product.dart';
import 'package:vamos_mercado/dialog.dart';

class AddProductWidget extends StatelessWidget {
  void Function(Product product) addProd;
  String? prodName;
  String? prodQuantity;
  String? prodMeasureUnity;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  MeasureUnity mew = MeasureUnity(const ['Kg', 'Un', 'Lt']);

  AddProductWidget(this.addProd);

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      bodyContent: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddProductForm(nameController, quantityController, mew),
          Container(
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(size: 60),
          ),
        ],
      ),
      confirm: () {
        addProd(
          Product(
            nameController.text,
            double.parse(quantityController.text),
            measurementUnity: mew.value,
          ),
        );
      },
    );
  }
}

class AddProductForm extends StatelessWidget {
  TextEditingController emailController;
  TextEditingController quantityController;
  MeasureUnity measurementUnity;

  AddProductForm(
      this.emailController, this.quantityController, this.measurementUnity);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Nome"),
            controller: emailController,
          ),
          Row(children: [
            Flexible(
                child: TextField(
              decoration: const InputDecoration(hintText: "Quantidade"),
              keyboardType: TextInputType.number,
              controller: quantityController,
            )),
            measurementUnity
          ]),
        ],
      ),
    );
  }
}

class MeasureUnity extends StatefulWidget {
  final List<String> items;

  late String value;

  MeasureUnity(this.items) {
    value = items.first;
  }

  @override
  State<MeasureUnity> createState() => _MeasureUnityState();
}

class _MeasureUnityState extends State<MeasureUnity> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue ??= widget.items.first;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            widget.value = dropdownValue!;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
