import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/Helpers/priceValidator.dart';

class InputValidationPage extends StatefulWidget {
  InputValidationPage({
    @required this.title,
     // @required this.valKey,
    this.inputDecoration = const InputDecoration(),
    this.textFieldStyle,
    this.textAlign = TextAlign.start,
    @required this.submitText,
    @required this.keyboardType,
    @required this.inputFormatter,
    @required this.submitValidator,
    this.onSubmit,
  });
  //final GlobalKey<FormState> valKey;
  final String title;
  final InputDecoration inputDecoration;
  TextStyle textFieldStyle;
  final TextAlign textAlign;
  final String submitText;
  final TextInputType keyboardType;
  final TextInputFormatter inputFormatter;
  final StringValidator submitValidator;
  final ValueChanged<String> onSubmit;
  
  String finalInput = "\$0.00";
  double userInput = 0;

  @override
  _InputValidationPageState createState() => _InputValidationPageState();
}

class _InputValidationPageState extends State<InputValidationPage> {
  FocusNode _focusNode = FocusNode();
  String _value = '';

  void _submit() async {
    bool valid = widget.submitValidator.isValid(_value);
    if (valid) {
      _focusNode.unfocus();
    } else {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: widget.inputDecoration,
      style: widget.textFieldStyle,
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      autofocus: false,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        widget.inputFormatter,
      ],
      focusNode: _focusNode,
      onChanged: (value) {
        setState(() => _value = value);
      },
      onEditingComplete: _submit,
      validator: (value) {
        if(value.isEmpty){
          return "Enter a price";
        }
        setState(() {
          widget.userInput = double.parse(value);
          if(value.contains('.'))
          {
            var newval = value.split('.');
            if(newval.length <= 1){
              widget.userInput = double.parse(newval.first + '.00');
            }
            else{
              if(newval.last.length <= 2){
                if(newval.last.length <= 1)
                  newval.last += '00';
                else
                  newval.last += '0';
              }
              widget.userInput = double.parse(newval.first + '.' + newval.last);
            }
            
          }
        });
        return null;
      },
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      decoration: widget.inputDecoration,
      style: widget.textFieldStyle,
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      autofocus: true,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        widget.inputFormatter,
      ],
      focusNode: _focusNode,
      onChanged: (value) {
        setState(() => _value = value);
      },
      onEditingComplete: _submit,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
          child: Center(child: _buildTextField()),
        ),
        Expanded(child: Container()),
        _buildDoneButton(context),
      ],
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    bool valid = widget.submitValidator.isValid(_value);
    return Opacity(
      opacity: valid ? 1.0 : 0.0,
      child: Container(
        constraints:
            BoxConstraints.expand(width: double.infinity, height: 60.0),
        child: FlatButton(
          color: Colors.green[400],
          child: Text(widget.submitText, style: TextStyle(fontSize: 20.0)),
          onPressed: _submit,
        ),
      ),
    );
  }
}