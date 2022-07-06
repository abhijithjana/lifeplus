
import 'package:flutter/material.dart';
import 'package:lifeplus/pages/login.dart';
import 'package:lifeplus/pages/signup.dart';
class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool singnin = true;
  void toogleview() {
    setState(() {
      singnin = !singnin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (singnin)
      return Signup(toogleview: toogleview);
    else
      return Loagin(toogleview: toogleview);
  }
}