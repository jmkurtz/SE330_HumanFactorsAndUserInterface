import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  InputBox({Key key, this.width = 325, this.labelText, this.hintText, this.errorText}) : super(key: key);

  final double width;
  final String labelText;
  final String hintText;
  final String errorText;

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
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
          if(value.isEmpty){
            return widget.errorText;
          }
          return null;
        },
      )
    );
  }
}