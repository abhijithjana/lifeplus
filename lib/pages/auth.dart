import 'package:flutter/material.dart';
import 'package:lifeplus/pages/authentication.dart';
import 'package:lifeplus/pages/home.dart';
import 'package:lifeplus/pages/signup.dart';
import 'package:lifeplus/services/user/users.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<Users?>(context);
    print(user);
    return  user==null ? Authentication() : Home();
  }
}
