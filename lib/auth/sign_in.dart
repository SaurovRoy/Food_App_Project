import 'package:efood/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/backimage.jpg'),
          )
        ),
          child:  Center(
            child:  TextButton(
              onPressed: () async{
                await logout();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
              },
              child: const Text(
                'LogOut',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )

          ),
      ),
    );
  }
}
