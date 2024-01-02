import 'package:carousel_slider/carousel_slider.dart';
import 'package:efood/Design/Tab/second_tab.dart';
import 'package:efood/Design/Tab/third_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tab/first_tab.dart';


class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  _First_ScreenState createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black12,
          expandedHeight: 150,
          stretch: true,

          flexibleSpace: FlexibleSpaceBar(
            background:Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CarouselSlider(
                      items: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(25.00),
                            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkOf99XhpFoG3MQwXJhl9kxwGdjcMm0hJZjA&usqp=CAU',fit: BoxFit.cover,width: double.infinity,)
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.00),
                          child: Image.network('https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395__480.jpg',fit:BoxFit.cover,width: double.infinity,),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.00),
                          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVca9nk9XcrU9zRzSUJPzRcIRjU_7MnYbqyg&usqp=CAU',fit: BoxFit.cover,width: double.infinity,),
                        ),
                      ],
                      options: CarouselOptions(
                        initialPage: 0,
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
// enlargecenterpage er jnno page change hobar sathe sathe ektu gap niye nei
                        enlargeCenterPage: true,
// onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      )
                  ),

                ],
              ),
            ),
            // title: Text('Pizza',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold)),
          ),

        ),

        SliverList(delegate: SliverChildBuilderDelegate((context,index){
          return SingleChildScrollView(

            child: SizedBox(
              height: size.height*.9,
              width: double.infinity,
              child: DefaultTabController(
                  length: 3,
                  child:Scaffold(
                    resizeToAvoidBottomInset: true,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: TabBar(
                        tabs: [
                          // Tab(
                          //   child: Container(
                          //     width: 60,
                          //     height:30,
                          //     decoration: BoxDecoration(
                          //       color: Colors.orange,
                          //       border: Border.all(
                          //         width: 1,
                          //         color: Colors.black,
                          //       ),
                          //       borderRadius: BorderRadius.circular(11),
                          //     ),
                          //     child: Icon(Icons.home,color: Colors.white,size: 19,),
                          //   ),
                          // ),
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
                                child: Text('Pizza',textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                                ),
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
                                child: Text('Salads',textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),
                                ),
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
                                child: Text('Drinks',textAlign: TextAlign.center,
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
                        First_Tab(),
                        Second_tap(),
                        Third_Tap(),
                      ],
                    ),
                  )
              ),
            ),
          );
        },childCount: 1,
        )
        ),

      ],
    );
  }
}
