import 'package:flutter/material.dart';

import '../../../Cart/cart_example.dart';

class Second_Detail extends StatefulWidget {
  // const Salad_detail({Key? key}) : super(key: key);
  var  recievedata1;
  Second_Detail( a){
    recievedata1=a;
  }
  @override
  _Second_DetailState createState() => _Second_DetailState();
}

class _Second_DetailState extends State<Second_Detail> {
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
          "Salads",style: TextStyle(color: Colors.white),
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
            Container(
                alignment: Alignment.topLeft,
                child: Text(widget.recievedata1['Salad_name'],style: TextStyle(fontSize: 37,fontWeight: FontWeight.bold,),)),
            Container(child: Text(widget.recievedata1['Salad_description'],style: TextStyle(fontSize: 20),)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text("Salad Price :   "+widget.recievedata1['Salad_price'].toString()+"TK", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
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
                    child: Text('Add to Cart For'+" "+widget.recievedata1['Salad_price'].toString()+"TK",style: TextStyle(color: Colors.white),),
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
