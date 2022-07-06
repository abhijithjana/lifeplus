import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void nextpage() {
    Future.delayed(Duration(milliseconds: 1000),(){
      print("waiting 5");
      Navigator.pushReplacementNamed(context, '/myapp');
    });
  }


  @override
  void initState(){
    super.initState();
    nextpage();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
            body: Center(
              child: LoadingBouncingGrid.square(
                borderColor: Colors.cyan,
                borderSize: 6.0,
                size: 80.0,
                backgroundColor: Colors.cyanAccent,
                duration: Duration(milliseconds: 1000),
              ),
            ),
          ),
      );

  }
}
