import 'package:biomark/screens/LoginPage.dart';
import 'package:biomark/screens/SignupView.dart';
import 'package:flutter/material.dart';

import '../Comm/comHelper.dart';
import '../Comm/getTextFromFields.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});


  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = new GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conRePassword = TextEditingController();

  signUp() async {
    final form = _formKey.currentState;

    String uemail = _conEmail.text;
    String upassword = _conPassword.text;
    String urepassword = _conRePassword.text;

    if(form!.validate()){


    }else{

    }

    // if (uemail.isEmpty) {
    //   alertDialog("Please Enter Your Email Address");
    //   return; // Stop further execution
    // } else if (upassword.isEmpty) {
    //   alertDialog("Please Enter Your Password");
    //   return; // Stop further execution
    // } else if (urepassword.isEmpty) {
    //   alertDialog("Please Re-Enter the Password");
    //   return; // Stop further execution
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup',
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

        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
          
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    SizedBox(
                      width: 100,
                      height: MediaQuery.of(context).size.height * 0.15,
                      // child: Container(
                      //   color: Colors.blue,
                      //   child: const Center(child: Text('Hello')),
                      // ),
                    ),
          
                    Container(
                      height: MediaQuery.of(context).size.height * 0.80,
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
                            'Create Your Account',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30.0,
                              // fontFamily: 'Inter',
                            ),
                          ),
          
                          SizedBox(
                            width: 100,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Container(
                              // color: Colors.blue,
                              // child: const Center(child: Text('Hello')),
                            ),
                          ),
          
                          //Email address text
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 20.0),
          
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
          
                          //Email address text input field
                          getTextFromFields(controller: _conEmail ,hintName: 'Enter Your Email Address', inputType: TextInputType.emailAddress),
          
                          //Password text
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 20.0),
          
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
          
                          //password text input field
                          getTextFromFields(controller: _conPassword ,hintName: 'Enter Your Password', isObscureText: true),
          
                          //re-enter password text input field
                          getTextFromFields(controller: _conRePassword ,hintName: 'Re-Enter Your Password', isObscureText: true),
          
                          //Password detail text
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 8.0),
          
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Your password must contain at least an Uppercase character,a lower case character and a symbol ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                    ),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
          
                          //Signup button
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            margin: const EdgeInsets.only(top: 25.0),
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
                              onPressed: signUp,
                              child: const Text(
                                'Signup',
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
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => LoginPage()));
                                  },
                                  child: const Text(
                                    'Login!',
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

      ),
    );
  }
}
