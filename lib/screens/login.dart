import 'package:app_drawer/models/authmodel.dart';
import 'package:app_drawer/services/authrepo.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}
class LoginState extends State<Login>{

  final mainColor = const Color(0xFFFB777A);
  final secColor = const Color(0xFFFFFFFF);
  final textColor = const Color(0xFF000000);
  final btnColor = const Color(0xFFfb8385);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: secColor,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('images/logo.png', height: 250.0, width: 250.0,),
          _username(),
          Container(height: 10.0,),
          _password(),
          Container(height: 30.0,),
          _loginButton(),
        ],
      ),
    );
    return app;
  }
  Widget _username(){
    usernameController.text = 'gitswagger';
    var app = Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: usernameController,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          hintText: 'Username/Matrikel Number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
      ),
    )
    );
    return app;
  }

  Widget _password(){
    var app = Padding(
      padding: EdgeInsets.all(15.0),
      child:TextField(
        controller: passwordController,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        hintText: 'Username/Matrikel Number',
        // errorText: 'Please enter a valid username/matrikel number',
        // errorStyle: TextStyle(color: textColor)
      ),
    )
    );
    return app;
  }

  Widget _loginButton(){
    var app = RaisedButton(
      color: btnColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        "Login",
        style: TextStyle(
          color: textColor,
          )
      ),
     onPressed: () { 
        debugPrint(usernameController.text);
        checkUser(usernameController.text, passwordController.text).then((data){
          if(data == true){
              Navigator.of(context).pushNamed("/home");
          }
        });
      }
    );

  return app;
  }

   Future<bool> checkUser(String username, String password) async {
    AuthModel input = AuthModel(matrikel_number: username, password: password);
    bool result = await AuthServices().authUser(input);
    return result;
  }

}