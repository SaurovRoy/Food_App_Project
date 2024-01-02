import 'package:efood/Cart/cart_example.dart';
import 'package:efood/Cart/cart_first.dart';
import 'package:flutter/material.dart';

class First_Detail extends StatefulWidget {
  // const Price_Tap({Key? key}) : super(key: key);
  var  recievedata;
  First_Detail( a){
    recievedata=a;
  }
  @override
  _First_DetailState createState() => _First_DetailState();
}


class _First_DetailState extends State<First_Detail> {

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
          "Pizza",style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(widget.recievedata['Pizza_short_des'],fit: BoxFit.cover,height: 200,width: double.infinity,),
          SizedBox(
            height: 15,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(widget.recievedata['Pizza_name'],style: TextStyle(fontSize: 37,fontWeight: FontWeight.bold,),)),
          Container(child: Text(widget.recievedata['Pizza_big_des'],style: TextStyle(fontSize: 20),)),
          Expanded(
            child: SizedBox(
              height: size.height*.8,
              width: double.infinity,
              child: DefaultTabController(
                  length: 2,
                  child:Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: TabBar(
                        tabs: [
                          Tab(
                            child: Container(
                              width: 60,
                              height:30,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child:Text(widget.recievedata['Pizza_size1'],textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              height:30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(widget.recievedata['Pizza_size2'],textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                    body:   TabBarView(
                      children: [
                        Column(
                          children: [
                            Center(
                                child: Text(widget.recievedata['Pizza_size1']+"  =   "+widget.recievedata['Pizza_price1'].toString()+"TK",
                                  textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                            SizedBox(height: size.height*.13,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    cartExample()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text('Add to Cart For'+" "+widget.recievedata['Pizza_price1'].toString()+"TK",style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Center(
                                child: Text(widget.recievedata['Pizza_size2']+"  =   "+widget.recievedata['Pizza_price2'].toString()+"TK",
                                  textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                            SizedBox(height: size.height*.13,),
                            GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    cartExample()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),


                                      child: Text('Add to Cart For'+" "+widget.recievedata['Pizza_price2'].toString()+"TK",style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
