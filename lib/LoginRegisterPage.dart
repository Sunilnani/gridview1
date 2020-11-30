import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}
enum FormType{login, register}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FormType _formType =FormType.login;
  String _email = "";
  String _password ="";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: createInput() + createButtons(),
              ),
            )
          ),
        )
      ),
    );
  }
  List<Widget> createInput(){
    if(_formType == FormType.login){
      return [
        SizedBox(height: 50),
        logo(),
        SizedBox(height: 10),
        Text("Please Login",style:TextStyle(fontSize: 20)),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(labelText: 'Email',
          filled: true,
          fillColor: Colors.white),
              validator:(value){
            return value.isEmpty ? 'Email is Required': null;
    },
    onSaved: (value){
            return _email =value;
    },
        ),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(labelText: 'Password',
              filled: true,
              fillColor: Colors.white),
          obscureText: true,
          validator:(value){
            return value.isEmpty ? 'password is Required': null;
          },
          onSaved: (value){
            return _password =value;
          },
        ),
        SizedBox(height: 20)
      ];
    }else if (_formType == FormType.register){
      return [
        SizedBox(height: 50),
        logo(),
        SizedBox(height: 10),
        Text("Please Register",style:TextStyle(fontSize: 20)),
        SizedBox(height: 10,),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'Email',
              filled: true,
              fillColor: Colors.white),
          validator:(value){
            return value.isEmpty ? 'Email is Required': null;
          },
          onSaved: (value){
            return _email =value;
          },
        ),
        SizedBox(height: 10,),
        new TextFormField(
          decoration: new InputDecoration(labelText: 'Password',
              filled: true,
              fillColor: Colors.white),
          obscureText: true,
          validator:(value){
            return value.isEmpty ? 'password is Required': null;
          },
          onSaved: (value){
            return _password =value;
          },
        ),
        SizedBox(height: 20)
      ];

    }
  }
  List<Widget> createButtons(){
    if (_formType == FormType.login){
      return[
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: (){},
            color: Colors.orangeAccent,
            child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16),),
          ),
        ),
        SizedBox(height: 10),
        FlatButton(
            onPressed: moveToRegister,
            child: Text("No account? Register"))
      ];
    }else{
      return[
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: (){},
            color: Colors.orangeAccent,
            child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 16),),
          ),
        ),
        SizedBox(height: 10),
        FlatButton(
            onPressed: moveToLogin,
            child: Text("Have account? Login"))
      ];

    }
  }

  void moveToRegister() {
    _formkey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    _formkey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }
  Widget logo(){
    return Hero(tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          child: Image.asset("img/login.png"),
        ));
  }
  Future<bool> _onBackPressed(){
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext){
      return AlertDialog(
        title: Text("Confirm Exit"),
        content: Text(" are you sure u want to exit"),
        actions: [
          FlatButton( child:Text("yes"),onPressed: (){SystemNavigator.pop();},),
          FlatButton( child:Text("no"),onPressed: (){Navigator.of(context).pop();},)

        ],
      );
      }
    );
    return Future.value(true);
  }
}
