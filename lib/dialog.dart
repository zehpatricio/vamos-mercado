import 'package:flutter/material.dart';
import 'package:vamos_mercado/buttons.dart';

class DefaultDialog extends StatelessWidget {
  final Widget bodyContent;
  final Function confirm;

  const DefaultDialog(
      {Key? key, required this.bodyContent, required this.confirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: IntrinsicHeight(
          child: Column(
            children: [
              _Body(bodyContent),
              _BottomButtons(() {
                Navigator.of(context).pop();
                confirm();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Widget bodyContent;

  const _Body(this.bodyContent);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: bodyContent,
      );
}

class _BottomButtons extends StatelessWidget {
  final VoidCallback? confirm;
  final String text;

  const _BottomButtons(this.confirm, {this.text = "Ok"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CancelButton(),
        Container(width: 20),
        ConfirmButton(text, confirm),
      ],
    );
  }
}

void confirmDialog(BuildContext context, Function confirm) {
  showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return DefaultDialog(
          bodyContent: Text('Texto'),
          confirm: confirm,
        );
      });
}
