import 'package:flutter/material.dart';
import 'package:lifeplus/services/authetication_service.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AutheticationServices Auth = AutheticationServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child:RaisedButton(onPressed: ()async{
            await Auth.signout();

          },child: Text("sign out"),),
        ),
      ),
    );
  }
}
