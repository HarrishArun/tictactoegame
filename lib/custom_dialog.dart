import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final url;
  final VoidCallback callback;
  final actionText;
  CustomDialog(this.title, this.url, this.callback,
      [this.actionText = 'Reset']);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(50.0),
      title: Text(title, style: TextStyle(color: Colors.yellow)),
      //  content: Text(url),
      actions: [
        Image.asset(url),
        ElevatedButton.icon(
            icon: Icon(
              Icons.replay,
              color: Colors.red,
            ),
            onPressed: callback,
            label: Text(actionText, style: TextStyle(color: Colors.red)),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0))),
      ],
    );
  }
}

Widget buildImage(String path) => Center(child: Image.asset(path, width: 350));
