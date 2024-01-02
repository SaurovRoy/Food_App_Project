import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second_profile extends StatefulWidget {
  const Second_profile({Key? key}) : super(key: key);

  @override
  _Second_profileState createState() => _Second_profileState();
}

class _Second_profileState extends State<Second_profile> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white
          ),
          onPressed: (){

          Navigator.pop(context);
        },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Edit Profile',textAlign: TextAlign.center,style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),

      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height* 100,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 3,),
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white54,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'My Phone',
                                    labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.blue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                ),
                              ) ,
                              SizedBox(height: 10,),
                              TextField(

                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                keyboardType: TextInputType.name,
                              ) ,
                              SizedBox(height: 10,),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                keyboardType: TextInputType.name,
                              ) ,
                              SizedBox(height: 10,),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: (){},
                                child: Text('Update',style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                              ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),


      ),

    );
  }
}
