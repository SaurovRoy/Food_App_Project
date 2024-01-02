import 'package:flutter/material.dart';

import '../../../Cart/cart_example.dart';

class Third_Detail extends StatefulWidget {
  // const Salad_detail({Key? key}) : super(key: key);
  var  recievedata1;
  Third_Detail( a){
    recievedata1=a;
  }
  @override
  _Third_DetailState createState() => _Third_DetailState();
}

class _Third_DetailState extends State<Third_Detail> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading:ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
        ) ,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          "Drinks",style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(widget.recievedata1['image'],fit: BoxFit.cover,height: 250,width: double.infinity,),
            SizedBox(
              height: 50,
            ),
            Text(widget.recievedata1['Drink_name'],style: TextStyle(fontSize: 37,fontWeight: FontWeight.bold,),),
            Container(child: Text(widget.recievedata1['Drink_description'],style: TextStyle(fontSize: 20),)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text("Drink Price :   "+widget.recievedata1['Drink_price'].toString()+"TK", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                SizedBox(height: size.height*.1,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        cartExample()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Add to Cart For'+" "+widget.recievedata1['Drink_price'].toString()+"TK",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
