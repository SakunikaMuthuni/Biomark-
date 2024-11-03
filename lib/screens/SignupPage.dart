import 'package:biomark/screens/LoginPage.dart';
import 'package:biomark/Comm/getTextFromFields.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conRePassword = TextEditingController();

  signUp(){
    print('OK');
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
                    height: MediaQuery.of(context).size.height * 0.75,
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
                          height: MediaQuery.of(context).size.height * 0.04,
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
                          margin: const EdgeInsets.only(top: 10.0),

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
                            onPressed: signUp(),
                            child: const Text(
                              'Signup',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        //Already have an account
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
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (_) => LoginPage()),
                                      (Route<dynamic> route) => false);
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
    );
  }
}
