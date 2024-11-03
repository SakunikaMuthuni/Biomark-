import 'package:biomark/screens/SignupPage.dart';
import 'package:biomark/Comm/getTextFromFields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to Account',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.0,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      //body container with background image
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover, // Adjusts how the image fits the container
          ),
        ),


        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(height: 150.0),
                  SizedBox(
                    width: 100,
                    height: MediaQuery.of(context).size.height * 0.20,
                    // child: Container(
                    //   color: Colors.blue,
                    //   child: const Center(child: Text('Hello')),
                    // ),
                  ),

                  // Black box that animates from bottom to top
                  Container(
                      height: MediaQuery.of(context).size.height * 0.70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5), // Shadow color
                            offset: const Offset(0, 4), // X and Y offset
                            blurRadius: 10.0, // Blur radius
                            spreadRadius: 2.0, // Spread radius
                          ),
                        ],
                      ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        //Login text
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30.0,
                              // fontFamily: 'Inter',
                          ),
                        ),

                        SizedBox(
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Container(
                            // color: Colors.blue,
                            // child: const Center(child: Text('Hello')),
                          ),
                        ),

                        //Email address text field
                        getTextFromFields(controller: _conEmail ,hintName: 'Enter Your Email Address'),

                        //password text field
                        getTextFromFields(controller: _conPassword ,hintName: 'Enter Your Password', isObscureText: true),

                        //forgot password
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          margin: const EdgeInsets.only(top: 20.0),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle forgot password logic here
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Color(0xFF3498DB),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF3498DB),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Login button
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          margin: const EdgeInsets.only(top: 40.0),
                          width: double.infinity,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),

                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF3498DB),
                                padding: const EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0), // Set the button border radius here
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                          ),
                        ),

                        //create a new account
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          margin: const EdgeInsets.only(top: 20.0),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () { 
                                  Navigator.push(context, 
                                      MaterialPageRoute(builder: (_) => SignupPage()));
                                },
                                child: const Text(
                                  'Create One!',
                                  style: TextStyle(
                                    color: Color(0xFF3498DB),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF3498DB),
                                  ), // Text color
                                ),

                              ),

                            ],
                          ),
                        ),

                      ],
                    ),

                  ),

                ],
              ),
            ),
          ),
        ),


      ),
    );
  }
}
