import 'dart:convert';
import 'package:efood/Design/Tab/Details_Tab/first_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class First_Tab extends StatefulWidget {
  const First_Tab({Key? key}) : super(key: key);

  @override
  _First_TabState createState() => _First_TabState();
}

class _First_TabState extends State<First_Tab> {
  var data;

   Future getWebData() async{
    // var url="http://192.168.0.106:9000/api/pizza";
    var url="http://10.0.2.2:8000/api/pizza";
    // var url="http://192.168.0.106:9000/api/pizza";
    var response=await http.get(Uri.parse(url));
    var deco=jsonDecode(response.body.toString());
    setState(() {
      this.data=deco["data"];
    });
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Center(
        child:Column(
          children: [
            Expanded(
                child:FutureBuilder(
                  future: getWebData(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>First_Detail(this.data[i])));
                            },
                            title: this.data[i]["Pizza_name"]==null?Text("NotFound"):Text(this.data[i]["Pizza_name"]),
                            subtitle:Text(this.data[i]['Pizza_big_des'],style: TextStyle(),),
                            leading:Image.network(this.data[i]['Pizza_short_des'],fit:BoxFit.cover,height: 70,width: 60,),
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>First_Detail(this.data[i])));
                                  },
                                  child: Text("Price : "+this.data[i]["Pizza_price2"].toString())),
                            ),
                          );
                        },

                      );
                    }else{
                      return Text('Loading...');
                    }
                  }
                )
            ),
          ],
        )

      ),
    );
  }
}
