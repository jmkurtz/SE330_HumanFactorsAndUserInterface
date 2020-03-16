import 'package:flutter/material.dart';

class EmailBox extends StatefulWidget {
  EmailBox({Key key, this.width = 325, this.labelText, this.hintText, this.errorText}) : super(key: key);

  final double width;
  final String labelText;
  final String hintText;
  final String errorText;
  @override
  _EmailBoxState createState() => _EmailBoxState();
}

class _EmailBoxState extends State<EmailBox> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: widget.width,
      child: new TextFormField(
        decoration: new InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),
        ),
        validator: (value) {
          if(value.isEmpty || !value.contains('@')){
            return widget.errorText;
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
      )
    );
  }
}