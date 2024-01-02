import 'package:efood/Cart/cart_example.dart';
import 'package:efood/Cart/cart_first.dart';
import 'package:efood/Design/profile/profile.dart';
import 'package:efood/Design/secon_screen.dart';
import 'package:efood/Design/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);
  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  int _currentIndex=0;
  final tabs=[
    First_Screen(),
    ThirdScreen(),
    cartExample(),
    // Center(child: Text('Thank You',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black54),),),
    First_profile(),
  ];
  @override


  Widget build(BuildContext context) {

    return Scaffold(
      body:tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, // Color of the highlighted icon
        unselectedItemColor: Colors.orange, // Color of the unselected icons
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.orange,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined,color: Colors.orange,),
              label: 'Category'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_outlined,color: Colors.orange,),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,color: Colors.orange,),
              label: 'Profile'
          ),

        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },

      ),
    );
  }
}
