import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:streamingservice/RLConsole.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:streamingservice/ui/widgets/bezierContainer.dart';
//import 'package:streamingservice/ui/widgets/route.dart';
//import 'package:streamingservice/core/models/customicon.dart';
//void main(List<String> arguments) {
//
//  print('Hello world: ${RLConsole.calculate()}!');
//}

//void main() => runApp(new MyApp());

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
//      title: "Register",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xFF151026),
          )),
      home: new MyHomePage(),
    );
  }
}

//class ImageInputAdapter {
//  /// Initialize from either a URL or a file, but not both.
//  ImageInputAdapter({
//    this.file,
//    this.url
//  }) : assert(file != null || url != null), assert(file != null && url == null), assert(file == null && url != null);
//
//  /// An image file
//  final File file;
//  /// A direct link to the remote image
//  final String url;
//
//  /// Render the image from a file or from a remote source.
//  Widget widgetize() {
//    if (file != null) {
//      return Image.file(file);
//    } else {
//      return FadeInImage(
//        image: NetworkImage(url),
//        placeholder: AssetImage("assets/images/placeholder.png"),
//        fit: BoxFit.contain,
//      );
//    }
//  }
//}
class MyHomePage extends StatefulWidget{
//  MyHomePage({Key key, this.title}) : super(key: key);
  final String title = "Register";



  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>{

  String username;
  String email;
  String firstname;
  String lastname;
  String password;
  String confirmpassword;
  String club;
  String errorMessage = "* A payment method is required";
  String paymentMethod;
  int selectedRadioTile;

  String rad_one;
  String rad_two;
  String rad_three;

  int n = 1;
  String cardNo;

  final firestoreInstance = Firestore.instance;

  @override
  void initState(){
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int value){
    setState(() {
      selectedRadioTile = value;
//      if (value == 0){
//        rad_one = valuePush;
//      } else if (value == 1){
//        rad_two = valuePush;
//      } else if (value == 2){
//        rad_three = valuePush;
//      }
    });
  }

  setSelectedRadioTile22(String value){
    setState(() {
      paymentMethod = value;
    });
  }

  bool _isHid = true;
  void _toggleVisibility(){
    setState(() {
      _isHid = !_isHid;
    });
  }

  final textController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  Widget _buildUsername(){
//    return null;
//  }
//
//  Widget _buildEmail(){
//    return null;
//  }
//
//  Widget _buildFirstname(){
//    return null;
//  }
//
//  Widget _buildLastname(){
//    return null;
//  }
//
//  Widget _buildPassword(){
//    return null;
//  }
//
//  Widget _buildClub(){
//    return null;
//  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
//          decoration:  BoxDecoration(
//            image:  DecorationImage(
//              image:  ExactAssetImage("images/register_wallpaper.jpg"),
//              fit: BoxFit.cover,
//            ),
//          ),

          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("images/register_wallpaper.jpg"),
                  fit: BoxFit.cover
                )
              ),

            child: SingleChildScrollView(

              child: Form(
                key: _formKey,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

      //              _buildUsername(),
      //              _buildPassword(),
      //              _buildFirstname(),
      //              _buildLastname(),
      //              _buildEmail(),
      //              _buildClub(),
                    SizedBox(
                      height:80.0
                    ),
                    CircleAvatar(
      //                backgroundColor: Colors.lightGreenAccent,
                      child: Image.asset("images/placeholder.jpg"),
                      radius:50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:16.0, horizontal: 16.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
      //                  labelText: 'Email',
      //                  style: TextStyle(color: Color(0xFF151026)),
      //                  controller: textController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Username",
                          fillColor: Colors.white,
                          filled: true,
      //                    errorText: "* Please enter a valid user name",
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Please input a valid Username';
                          }
                        },
                        onSaved: (String value){
                          username = value;
      //                    _username = value;
                        },
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
      //                  labelText: 'Email',
      //                    style: TextStyle(color: Color(0xFF151026)),
//                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password (AT LEAST 5 CHARACTERS)",
                          hintText: "Password (AT LEAST 5 CHARACTERS)",
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
      //                    errorText: "* Enter a password",
                          suffixIcon: IconButton(
                            onPressed: _toggleVisibility,
                            icon: _isHid ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Please input a valid Password';
                          } else if (value.length<5){
                            return '* Password must be at least 5 characters long';
                          }
                        },
                        onSaved: (String value){
                          password = value;
                        //                    _username = value;
                        },
                        obscureText: _isHid,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
      //                  labelText: 'Email',
      //                    style: TextStyle(color: Color(0xFF151026)),
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Confirm Password",
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
      //                    errorText: "* Passwords must match",
                          suffixIcon: IconButton(
                            onPressed: _toggleVisibility,
                            icon: _isHid ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            confirmpassword = value;
                          });
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Please input a valid Password Confirmation';
                          } else if (value != password){
                            return '* Passwords do not match';
                          }
                        },
                        onSaved: (String value){
                          confirmpassword = value;
                          //                    _username = value;
                        },
                        obscureText: _isHid,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
                          textCapitalization: TextCapitalization.sentences,
      //                  labelText: 'Email',
      //                    style: TextStyle(color: Color(0xFF151026)),
                          decoration: InputDecoration(
                            labelText: "First Name",
                            hintText: "First Name",
                            fillColor: Colors.white,
                            labelStyle:
                            TextStyle(color: Colors.black, letterSpacing: 1.3),
                            filled: true,
      //                      errorText: "* Please enter your first name",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                              border: OutlineInputBorder(),
                          ),
                        onChanged: (value) {
                          setState(() {
                            firstname = value;
                          });
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return '* First Name is required';
                          }
                        },
                        onSaved: (String value){
                          firstname = value;
                          //                    _username = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
      //                  labelText: 'Email',
      //                    style: TextStyle(color: Color(0xFF151026)),
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          hintText: "Last Name",
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
      //                    errorText: "* Please enter your last name",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            lastname = value;
                          });
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Last name is required';
                          }
                        },
                        onSaved: (String value){
                          lastname = value;
                          //                    _username = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
      //                  labelText: 'Email',
      //                    style: TextStyle(color: Color(0xFF151026)),
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          hintText: "E-mail",
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
      //                    errorText: "* Please enter a valid E-mail address",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Please input a valid E-mail';
                          }

                          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                            return "* E-mail format incorrect";
                          }
                        },
                        onSaved: (String value){
                          email = value;
                          //                    _username = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
      //                  labelText: 'Email',
      //                    style: TextStyle(color: Color(0xFF151026)),
                        decoration: InputDecoration(
                          labelText: "Your Favourite Club",
                          hintText: "Favourite club",
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            club = value;
                          });
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Please input a valid Football Club';
                          }
                        },
                        onSaved: (String value){
                          club = value;
                          //                    _username = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: RadioListTile(
                        value: 0,
                        groupValue: selectedRadioTile,
                        activeColor: Colors.white,
                        title: Text("Debit Card",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text("Your debit card number",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
//                            paymentMethod = value;
                            setSelectedRadioTile(value);
                          });
                        },
                        selected: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        activeColor: Colors.white,
                        title: Text("Online banking",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text("Your online banking card",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
//                            paymentMethod = value;
                            setSelectedRadioTile(value);
                          });
                        },
                        selected: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        activeColor: Colors.white,
                        title: Text("PayPal",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text("Your PayPal ID",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
//                            paymentMethod = value;
                            setSelectedRadioTile(value);
                          });
                        },
                        selected: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:6.0, horizontal:16.0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        //                  labelText: 'Email',
                        //                    style: TextStyle(color: Color(0xFF151026)),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Card Number (16 Numbers)",
                          hintText: "Card Number (16 Numbers)",
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle:
                          TextStyle(color: Colors.black, letterSpacing: 1.3),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cardNo = value;
                          });
                        },
                        validator: (String value){
                          if (value.isEmpty){
                            return '* Please input a valid card number';
                          } else if (value.length != 16){
                            return '* Card number should be 16 numbers';
                          }
                        },
                        onSaved: (String value){
                          cardNo = value;
                          //                    _username = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                      child: MaterialButton(
                        minWidth: 1000,
                        child: Text('REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        color: Colors.cyan,
                        onPressed: () async{

                          if (!_formKey.currentState.validate()){
                            return;
//                          } else if(_formKey.currentState.validate() || !_formKey.currentState.validate()){
//                            if (selectedRadioTile<0){
//                              return errorMessage;
//                            }
                          } else {
                            _formKey.currentState.save();

                            print(username);
                            print(password);
                            print(firstname);
                            print(lastname);
                            print(email);
                            print(club);
                            print(cardNo);


//                            firestoreInstance.collection("Visca_Users").add(
//                              {
//                                "Username": username,
//                                "Password": password,
//                                "First Name": firstname,
//                                "Last Name": lastname,
//                                "E-mail": email,
//                                "Club": club
//                              }
//                            ).then((_){
//                              print("SUCCESS");
//                            });

//                            if (n = null){
//                              n=1;
//                            }
                            
//                            final snapShot = await Firestore.instance.collection("Visca_Users").document("User_ID_N0$n").get();
//
//                            if (snapShot == null || !snapShot.exists){
//                              n=n+1;
//                            } else if (snapShot != null || snapShot.exists){
//
//                              n=1;
//                            }
                            Firestore.instance.collection("Visca_Users").document("User_ID_No$n").setData(
                              {
                                "Club": club,
                                "E-mail": email,
                                "Last Name": lastname,
                                "First Name": firstname,
                                "Password": password,
                                "Username": username,
                                "Card No": cardNo,
                                "Payment Method": paymentMethod,
                              }
                            );

//                            final CollectionReference _usersCollectionReference = Firestore.instance.collection("Visca_Users");
//                            final FirebaseAuth
//                            try{
//                              await _usersCollectionReference.document(user.id)
//                            }
                            n=n+1;
                          }
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
          ),
//      ),
    );
  }
}

