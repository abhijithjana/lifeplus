import 'package:flutter/material.dart';
import 'package:lifeplus/services/authetication_service.dart';
import 'package:lifeplus/textdecoration.dart';
class Loagin extends StatefulWidget {
  final Function toogleview;
  Loagin({required this.toogleview});



// registration// registration// registration// registration// registration// registration// registration// registration
  @override
  State<Loagin> createState() => _LoaginState();
}

class _LoaginState extends State<Loagin> {
  final AutheticationServices _auth = AutheticationServices();
final _formvalidator = GlobalKey<FormState>();
String _email = "";
String _password = "";
String ph="";
String name="";
String error = '';
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Register "),
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () {
                widget.toogleview();
              },
              label: Text("sign in"),
              icon: Icon(Icons.person),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formvalidator,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textdecoration.copyWith(hintText: 'name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter email';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    setState(() => {name = value});
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),


                TextFormField(
                  decoration: textdecoration.copyWith(hintText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter email';
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    setState(() => {_email = value});
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textdecoration.copyWith(hintText: 'phone number'),
                  validator: (value) {
                    if (value == null || value.length < 10) {
                      return 'Enter a valid phone number';
                    } else
                      return null;
                  },
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      ph = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textdecoration.copyWith(hintText: 'password'),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Enter a valid password';
                    } else
                      return null;
                  },
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    onPressed: () async {
                      if (_formvalidator.currentState!.validate()) {
                        print(_email);
                        print(_password);
                        dynamic result =
                        await _auth.signup(email: _email, password: _password,name: name,phone_no: ph);
                        print(result);
                        if (result == null) {
                          setState(() {
                            error = 'please enter a valid data';
                          });
                        }
                      }
                    },
                    child: Text("Register")),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        )),
  );
  ;
}
}
