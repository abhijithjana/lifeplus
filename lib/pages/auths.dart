import 'package:flutter/material.dart';
import 'package:lifeplus/pages/auth.dart';
import 'package:lifeplus/services/authetication_service.dart';
import 'package:lifeplus/services/user/users.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AutheticationServices().user,
      child: MaterialApp(
        home:Auth(),
      ),
    );
  }
}
