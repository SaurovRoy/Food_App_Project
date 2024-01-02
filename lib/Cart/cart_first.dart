import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {

  // const CartPage({Key? key}) : super(key: key);
//   final String storedata;
// var data;
//   CartPage({required this.storedata}){
//     this.data=storedata;
//   }
  var data;
  CartPage(storedata){
    this.data=storedata;
  }

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('My Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(

              children: [
                Expanded(flex:3,child:
                Text('My cart',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold
                ,fontSize: 23),)), Expanded(child:
                Text('Clear All',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold
                ,fontSize: 19),)),
              ],
            ),
            Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Image.network(widget.data['item_image']),
                    title: Text(widget.data['item_name'].toString()),
                    subtitle: Text(widget.data['item_des'].toString()),
                    trailing: ElevatedButton(onPressed: (){},
                    child: Text('Buy'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
