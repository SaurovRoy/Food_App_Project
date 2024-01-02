import 'dart:convert';

import 'package:efood/Cart/cart_first.dart';
import 'package:efood/category_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  var data;

  Future getWebData() async{
    // var url="http://127.0.0.1:8000/api/categories";
    var url="http://10.0.2.2:8000/api/categories";
    // var url="http://192.168.0.106:9000/api/categories";
    var response=await http.get(Uri.parse(url));
    var deco=await jsonDecode(response.body.toString());


    setState(() {
      print(response);
      this.data=deco["data"];
    });
    return response;
  }
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 1.89;
    return Scaffold(

      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('All Categories',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
        future: getWebData(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }else{
            return GridView.builder(
              itemCount:data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 0.0,

                ),
                itemBuilder: (context,index){
                return Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      GestureDetector(
                        onTap: (){
                          var storedata=this.data[index];
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Category_Detail(storedata)));
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Category_Detail(storedata))).then((value) {
                          //   if(value!=null){
                          //     print(value);
                          //   }
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(storedata:storedata)));
                          // }
                          //
                          // );

                        },
                        child: ClipRect(
                          child: Image.network(this.data[index]['item_image'].toString(),width: double.infinity,
                            height: size.height*0.2,fit: BoxFit.cover,),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(

                            height: size.height*0.2,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(this.data[index]['item_name'].toString(),
                              style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20 ),)),
                      ),


                    ],
                  ),
                );
                }
                );
          }
        },
      ),


    );
  }
}
