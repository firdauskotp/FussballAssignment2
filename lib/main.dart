import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:streamingservice/RLConsole.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:streamingservice/register.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("images/FACup.jpg"),
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
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                        child: MaterialButton(
                          minWidth: 1000,
                          child: Text('Have an account? LOGIN HERE',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                          color: Colors.grey,

                        )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical:12.0),
                      child: MaterialButton(
                        minWidth: 1000,
                        child: Text('Create an account? REGISTER HERE',
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        color: Colors.grey,
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyRegisterPage()
                            )
                          );
                        },
                      ),
                    ),
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

