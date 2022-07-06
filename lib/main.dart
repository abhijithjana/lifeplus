
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lifeplus/pages/auth.dart';
import 'package:lifeplus/pages/auths.dart';
import 'package:lifeplus/pages/home.dart';
import 'package:lifeplus/pages/loading.dart';
import 'package:lifeplus/pages/login.dart';
import 'package:lifeplus/pages/signup.dart';
import 'package:lifeplus/services/authetication_service.dart';
import 'package:lifeplus/services/user/users.dart';
import 'package:provider/provider.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>Loading(),
      '/myapp':(context)=>MyApp(),
      '/auth':(context)=>Auth(),

      '/home':(context)=>Home(),

    },
  ));



}


