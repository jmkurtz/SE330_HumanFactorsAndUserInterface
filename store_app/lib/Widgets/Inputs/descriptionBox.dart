import 'package:flutter/material.dart';

class DescriptionBox extends StatefulWidget {
  DescriptionBox({Key key, this.height = 50, this.width = 325, this.labelText, this.hintText, this.errorText}) : super(key: key);

  final double width;
  final double height;
  final String labelText;
  final String hintText;
  final String errorText;

  @override
  _DescriptionBoxState createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: widget.width,
      child: new TextFormField(
        maxLines: 5,
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