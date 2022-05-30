import 'package:flutter/material.dart';
import 'package:vamos_mercado/product.dart';
import 'package:vamos_mercado/dialog.dart';

class AddProductWidget extends StatelessWidget {
  void Function(Product product) addProd;
  String? prodName;
  String? prodQuantity;
  String? prodMeasureUnity;

  AddProductWidget(this.addProd);

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      body_content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddProductForm(),
          Container(
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(size: 60),
          ),
        ],
      ),
    );
  }
}

class AddProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Nome"),
            // onChanged: (value) => prodName = value,
          ),
          Row(children: [
            Flexible(
                child: TextField(
              decoration: const InputDecoration(hintText: "Quantidade"),
              keyboardType: TextInputType.number,
              // onChanged: (value) => prodQuantity = value,
            )),
            MeasureUnity(['Kg', 'Un', 'Lt'])
          ]),
        ],
      ),
    );
  }
}

class MeasureUnity extends StatefulWidget {
  List<String> items;

  MeasureUnity(this.items, {Key? key}) : super(key: key);

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
