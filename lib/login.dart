import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:streamingservice/RLConsole.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:streamingservice/main.dart';
//import 'package:streamingservice/ui/widgets/bezierContainer.dart';
//import 'package:streamingservice/ui/widgets/route.dart';
//import 'package:streamingservice/core/models/customicon.dart';
//void main(List<String> arguments) {

class MyLoginPage extends StatefulWidget{
//  MyHomePage({Key key, this.title}) : super(key: key);
  final String title = "Login";



  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage>{
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController pwdInputController;


  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 5) {
      return 'Password must be at least 5 characters';
    } else {
      return null;
    }
  }

  bool _isHid = true;
  void _toggleVisibility(){
    setState(() {
      _isHid = !_isHid;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child:Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("images/EPL_Trophy.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child:Form(
            key: _loginFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'E-mail', hintText: "john.doe@gmail.com"),
                  controller: emailInputController,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHid ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                    ),
                  ),
                  controller: pwdInputController,

                  obscureText: _isHid,
                  validator: pwdValidator,
                ),
                MaterialButton(
                  minWidth: 1000,
                  
//                  child: Text('REGISTER',
//                    style: TextStyle(
//                      color: Colors.white,
//                    ),),
//                  color: Colors.cyan,
                  
                ),


              ],
            ),
          ),
        ),
      ),

    );
  }
}