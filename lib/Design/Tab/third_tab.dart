import 'dart:convert';

import 'package:efood/Design/Tab/Details_Tab/third_detail.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Third_Tap extends StatefulWidget {
  const Third_Tap({Key? key}) : super(key: key);

  @override
  _Third_TapState createState() => _Third_TapState();
}

class _Third_TapState extends State<Third_Tap> {
  var data;
   Future getWebData() async {
    // var ur="http://127.0.0.1:8000/api/drink";
    var ur="http://10.0.2.2:8000/api/drink";
    // var ur="http://192.168.0.106:9000/api/drink";
    var respons=await http.get(Uri.parse(ur));
    var dec=jsonDecode(respons.body.toString());
    // if(respons.statusCode==200){
    //   data=dec;
    // }else{
    //
    // }
    setState(() {
      this.data=dec["data"];
      print('data :${dec}');
    });return respons;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body:Center(
        child: Column(
          children: [
            Expanded(
                child:FutureBuilder(
                  future: getWebData(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ( context, i) {
                          return ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Third_Detail(this.data[i])));
                            },
                            title: Text(this.data[i]["Drink_name"].toString()),
                            subtitle:Text(this.data[i]['Drink_description'].toString()),
                            leading:Image.network(this.data[i]['image'].toString(),fit:BoxFit.cover,height: 70,width: 60,),
                            trailing: Container(
                              width: 92,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.4,
                                ),
                                color: Colors.orange,
                              ),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Third_Detail(this.data[i])));
                                  },
                                  child: Text("Price : "+this.data[i]["Drink_price"].toString())),
                            ),
                          );
                        },

                      );

                    }
                    else {
                      return Text('Loading...');

                    }
                  },




                ),
            )
          ],
        ),
      )




    );

  }
}

