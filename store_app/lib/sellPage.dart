import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:store_app/Widgets/menuDrawer.dart';
import 'package:store_app/Widgets/itemView.dart';
import 'package:store_app/Helpers/priceValidator.dart';
import 'package:store_app/Helpers/mockData.dart';
import 'package:store_app/Helpers/itemModel.dart';
import 'package:store_app/homePage.dart';

import 'Widgets/Inputs/inputBox.dart';
import 'Widgets/Inputs/priceValidationPage.dart';
import 'cartPage.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class DecimalNumberEditingRegexValidator extends RegexValidator {
  DecimalNumberEditingRegexValidator()
      : super(regexSource: "^\$|^(0|([1-9][0-9]{0,3}))(\\.[0-9]{0,2})?\$");
}
class DecimalNumberSubmitValidator implements StringValidator {
  @override
  bool isValid(String value) {
    try {
      final number = double.parse(value);
      return number > 0.0;
    } catch (e) {
      return false;
    }
  }
}

class ImageCapture extends StatefulWidget {
  ImageCapture({Key key}) : super(key: key);
  File _imageFile;
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture>{

  /// Active image file
  //File _imageFile;

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      widget._imageFile = selected;
    });
  }

  void _clear(){
    setState(() {
      widget._imageFile = null;
    });
  }

  /// Cropper
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: widget._imageFile.path,
      );

      setState(() {
        widget._imageFile = cropped ?? widget._imageFile;
      });
  }

  @override
  Widget build(BuildContext context){
    return Column(
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              if(widget._imageFile != null) ...[
                Container(
                  child: Image.file(widget._imageFile),
                  ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.crop),
                          onPressed: _cropImage,
                        ),
                        FlatButton(
                          child: Icon(Icons.refresh),
                          onPressed: _clear,
                        ),
                      ],
                    ),
                    new Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                )
              ]
              else ...[
                Text("No Image Selected"), 
                Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
              ]
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () => _pickImage(ImageSource.camera),
              ),
              IconButton(
                 icon: Icon(Icons.photo_library),
                 onPressed: () => _pickImage(ImageSource.gallery),
              ),
              Text("Take or select a photo"),
            ],
          )
        ],
    );
  }
}


class SellPage extends StatefulWidget {
  SellPage({Key key, @required this.title}) : super(key: key);
  final String title;
  bool isValid = false;

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _formKey = new GlobalKey<FormState>();
  String _currentDropdownItem = "Action";
  bool isValid = false;
  var imageWidget = ImageCapture();
  Item movieInstance = null;

  var titleInput = InputBox(
                            hintText: "Enter the movie title", 
                            labelText: "Movie Title", 
                            errorText: "Please enter in a movie title",
                            width: 325
                          );

  var priceInput =  InputValidationPage(
                                  title: 'Price',
                                  inputDecoration: InputDecoration(
                                    labelText: "Price", 
                                    hintText: '\$0.00', 
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(25.0), borderSide: BorderSide(),),
                                    ),
                                  textFieldStyle: TextStyle(color: Colors.black87),
                                  textAlign: TextAlign.center,
                                  submitText: 'Submit',
                                  keyboardType: TextInputType.number,
                                  inputFormatter: ValidatorInputFormatter(
                                    editingValidator: DecimalNumberEditingRegexValidator(),
                                  ),
                                  submitValidator: DecimalNumberSubmitValidator(),
                                );

  var descriptionInput = InputBox(
                            hintText: "Give a description", 
                            labelText: "Description", 
                            errorText: "Please enter in a description",
                            width: 325
                          );

  createAlertDialog(BuildContext context){
    return showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context){
      return AlertDialog(
        title: Text("Success! Your poster is now listed"),
        content: ItemView(item: movieInstance, showDescription: false),
        // content: Container(
        //   height: 500,
        //   child: ItemView(item: movieInstance, showDescription: false)
        //   ),
        actions: <Widget>[
          FlatButton(
            child: Text("Submit"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Homepage')));
            },
          ),
        ],
        elevation: 24.0,
      );
    });
  }

  _onSubmit() {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      isValid = true;
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.shopping_cart), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(title: 'Shopping Cart')));},),],
      ),
      body: 
        SingleChildScrollView(
          //padding: EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: "Enter poster information",
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ),
                ),
                new Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 70,
                          child: titleInput,
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          //alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 70,
                                width:100,
                                child: priceInput,
                              ),
                              Container(
                                //height: 70,
                                alignment: Alignment.topCenter,
                                width: 225,
                                //padding: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  border: new Border.all(width: 1,color: Colors.grey, style: BorderStyle.solid),
                                  borderRadius: new BorderRadius.circular(25.0),
                                  ),
                                child: DropdownButton<String>(
                                  value: _currentDropdownItem,
                                  onChanged: (String newValue){
                                    setState(() {
                                      _currentDropdownItem = newValue;
                                    });
                                  },
                                  items: <String>['Action', 'Adventure','Comedy', 'Horror', 'Romance', 'Thriller']
                                  .map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(value: value,child: Text(value),);
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          height: 70,
                          child: descriptionInput,
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: new Border.all(width: 1,color: Colors.grey, style: BorderStyle.solid),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                          child: imageWidget,
                        ),
                      ],
                    ),
                  ),
                  
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(10),
                  child: 
                    new FloatingActionButton.extended(
                      heroTag: "SubmitForm",
                      onPressed: () {
                        _onSubmit();      

                        if(isValid){
                          //Create new movie item
                            movieInstance = new Item(
                            description: descriptionInput.userInput,
                            genre: _currentDropdownItem,
                            id: MockData.items.length + 1,
                            imagePath: imageWidget._imageFile.path,
                            isUsed: true,
                            isVerified: false,
                            itemName: titleInput.userInput,
                            quantity: 1,
                            unitPrice: priceInput.userInput,
                          );

                          // Add it to the list of movies
                          MockData.items.add(movieInstance);

                          // call popup
                          createAlertDialog(context);
                        }                  
                      },
                      label: Text("Publish Listing"),
                      icon: Icon(Icons.file_upload),
                    ),
                ),

              ],
            )
          ),
        ),
      drawer: MenuDrawer()
    );
  }
}