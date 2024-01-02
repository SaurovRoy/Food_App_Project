import 'package:flutter/material.dart';
class Second_Screen extends StatefulWidget {
  // const Second_Screen({Key? key}) : super(key: key);

  @override
  State<Second_Screen> createState() => _Second_ScreenState();
}

class _Second_ScreenState extends State<Second_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Second Screen"),
      ),
    );
  }
}
