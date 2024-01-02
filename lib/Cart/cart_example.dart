import 'package:flutter/material.dart';
class cartExample extends StatelessWidget {
  const cartExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Card(
          child: Container(
              height:300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border:Border.all(
                color: Colors.orange,
                width: 2,
              )
            ),
            child: Text("Explore More \n To Order",style: TextStyle(color: Colors.orange,fontSize: 40,
            fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
