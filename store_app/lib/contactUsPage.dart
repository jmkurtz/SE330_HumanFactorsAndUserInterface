import 'package:flutter/material.dart';
import 'package:store_app/Widgets/menuDrawer.dart';

import 'Widgets/Inputs/descriptionBox.dart';
import 'Widgets/Inputs/emailBox.dart';
import 'Widgets/Inputs/inputBox.dart';
import 'homePage.dart';

class ContactUsPage extends StatefulWidget {
  ContactUsPage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    image: new AssetImage('assets/images/contactUs.jpg')
                  ),
                  new Container(width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 5),),
                  new Container( width: 325, child: new Text(
                      'Please fill out this form with either a comment or concern and our team will respond as soon as possible',  textAlign: TextAlign.center,),),
                  new Container( width: 325, child: new Text(
                      '___________________________________________________', textAlign: TextAlign.center,),),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter your name", 
                    labelText: "Name", 
                    errorText: "Please enter in a name",
                    width: 325
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  EmailBox(
                    hintText: "Enter your email address", 
                    labelText: "Email Address", 
                    errorText: "Please enter in a valid email address",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  InputBox(
                    hintText: "Enter the subject", 
                    labelText: "Subject", 
                    errorText: "Please enter a subject",
                  ),
                  new Padding(padding: EdgeInsets.only(top: 30),),
                  DescriptionBox(
                    hintText: "Enter the description", 
                    labelText: "Description", 
                    errorText: "Please enter a description",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric( vertical: 16.0 ),
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Homepage')),
                        );
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
      drawer: MenuDrawer()
    );
  }
}