import 'package:efood/Cart/cart_first.dart';
import 'package:efood/Design/third_screen.dart';
import 'package:flutter/material.dart';

class Category_Detail extends StatefulWidget {
  // const Salad_detail({Key? key}) : super(key: key);
  var  recievedata1;
  Category_Detail( a){
    recievedata1=a;
  }


  @override
  _Category_DetailState createState() => _Category_DetailState();
}

class _Category_DetailState extends State<Category_Detail> {

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
          widget.recievedata1['item_name'],style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(widget.recievedata1['item_image'].toString(),fit: BoxFit.cover,height: 250,width: double.infinity,),
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(widget.recievedata1['item_name'].toString(),style: TextStyle(fontSize: 37,fontWeight: FontWeight.bold,),)),
              Container(child: Text(widget.recievedata1['item_des'].toString()+widget.recievedata1['speciality'].toString(),style: TextStyle(fontSize: 20),)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(widget.recievedata1['item_name']+" Price :   "+widget.recievedata1['item_price'].toString()+"TK", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                  SizedBox(height: size.height*.1,),
                 Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:GestureDetector(
                        onTap: (){
                          var sdata=widget.recievedata1;

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage( sdata)));

                          },


                        child:Text('Add to Cart For'+" "+widget.recievedata1['item_price'].toString()+"TK",style: TextStyle(color: Colors.white),),
                        )

                    ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
