import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    // Start the animation after a delay
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isAnimating = true; // Trigger animation after delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login with Signup',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.0,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      //body container with background image
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover, // Adjusts how the image fits the container
          ),
        ),


        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 150.0),
                SizedBox(
                  width: 100,
                  height: MediaQuery.of(context).size.height * 0.40,
                  // child: Container(
                  //   color: Colors.blue,
                  //   child: const Center(child: Text('Hello')),
                  // ),
                ),

                // Black box that animates from bottom to top
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    height: isAnimating ? MediaQuery.of(context).size.height * 0.50 : 0.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                    ),

                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      //Login text
                      Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30.0,
                            fontFamily: 'Inter'),
                      ),

                      //Email address text field



                    ],
                  ),

                ),

              ],
            ),
          ),
        ),


      ),
    );
  }
}
