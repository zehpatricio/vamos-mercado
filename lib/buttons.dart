import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 39, 39, 39)),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Cancelar"),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  VoidCallback? confirm;
  String text;

  ConfirmButton(this.text, this.confirm);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: confirm,
      child: Text(text),
    );
  }
}
