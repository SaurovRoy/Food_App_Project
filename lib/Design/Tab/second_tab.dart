import 'dart:convert';

import 'package:efood/Design/Tab/Details_Tab/second_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Second_tap extends StatefulWidget {
  const Second_tap({Key? key}) : super(key: key);

  @override
  _Second_tapState createState() => _Second_tapState();
}

class _Second_tapState extends State<Second_tap> {
  var data,data1,data2;
  Future getWebData() async{
    // var ur="http://192.168.0.106:9000/api/salad";
    var ur="http://10.0.2.2:8000/api/salad";
    // var ur="http://192.168.0.106:9000/api/salad";
    var respons=await http.read(Uri.parse(ur));
    var dec=jsonDecode(respons);
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
                    if(!snapshot.hasData){
                      return Text('Loading');
                    }else{
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, i) {
                          return ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Second_Detail(this.data[i])));
                            },
                            title: this.data[i]["Salad_name"]==null?Text("NotFound"):Text(this.data[i]["Salad_name"]),
                            subtitle:Text(this.data[i]['Salad_description'],style: TextStyle(),),
                            leading:Image.network(this.data[i]['image'],fit:BoxFit.cover,height: 70,width: 60,),
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Second_Detail(this.data[i])));
                                  },
                                  child: Text("Price : "+this.data[i]["Salad_price"].toString())),
                            ),
                          );
                        },

                      );
                    }
                  }
                )
            )
          ],
        ),
      )

    );
  }
}

