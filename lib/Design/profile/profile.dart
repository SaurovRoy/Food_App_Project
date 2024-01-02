import 'package:efood/Design/profile/second_profile.dart';
import 'package:efood/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class First_profile extends StatefulWidget {
  const First_profile({Key? key}) : super(key: key);

  @override
  _First_profileState createState() => _First_profileState();
}

class _First_profileState extends State<First_profile> {

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile',textAlign: TextAlign.center,style: TextStyle(color:Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
              ),
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Second_profile())
                );
              },
              child: Icon(Icons.settings,color: Colors.black,)
          ),
        ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
              child:   Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:NetworkImage('https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white54,
                          width: 5.0,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Saurav Roy',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    ElevatedButton(onPressed: () async {
                      await logout();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SplashScreen()));
                    },
                        child: Text('Log Out',textAlign:TextAlign.center,style:
                        TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
                    ),
                    Expanded(
                      child:Card(
                        child: ListView(
                          children: [
                            Card(
                              child:   ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.history,color: Colors.white,),
                                ),
                                title: Text('Oldest History'),
                              ) ,
                            ),
                            SizedBox(height: 3,),
                            Card(
                              child:   ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.delivery_dining,color: Colors.white),
                                ),
                                title: Text('Delivery adresses'),
                              ),
                            ),
                            SizedBox(height: 3,),
                            Card(
                              child:    ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.credit_card,color: Colors.white),
                                ),
                                title: Text('Credit and Payment'),
                              ),
                            ),
                            SizedBox(height: 3,),
                            Card(
                              child:    ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: Icon(Icons.track_changes_outlined,color: Colors.white),
                                ),
                                title: Text('Tracking my orders'),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),


        ],
      ),
    );
  }
}

