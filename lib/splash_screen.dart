import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:efood/Design/home.dart';
import 'package:efood/Design/secon_screen.dart';
import 'package:efood/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_sign_in/google_sign_in.dart';

import 'auth/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  var data,dataName;
 Future<void> googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      setState(() {
        this.data=reslut;
      });

      if (reslut == null) {

        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      setState(() {
        this.dataName=data.displayName;
      });
      print(data.email);
      print(data.displayName);
      // print("Result $reslut");
      // print(reslut.displayName);
      // print(reslut.email);
      // print(reslut.photoUrl);
    } catch (error) {
      print(error);
    }
  }



  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
              animation: _controller,
              child:  Container(
                width: 200.0,
                height: 200.0,
                child: const Center(
                  child:  Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/efood.PNG'),
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(

                  angle: _controller.value * 8.0 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .08,),
            const Align(
                alignment: Alignment.center,
                child :Text('Welcome to\neFood' , textAlign: TextAlign.center ,
                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25)
                  ,)),
            SizedBox(height: MediaQuery.of(context).size.height * .08,),
            ElevatedButton(
                child: const Text('Sign in with Google',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold
                ),), onPressed: () async{
              await googleLogin();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home_page()));

            }

            ),
          ],
        ),
      ),
    );
  }
}
