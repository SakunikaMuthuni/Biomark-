import 'package:biomark/Model/UserModel.dart';
import 'package:biomark/screens/ForgotPassword.dart';
import 'package:biomark/screens/FrogotPasswordEmail.dart';
import 'package:biomark/screens/LoginView.dart';
import 'package:biomark/screens/SignupPage.dart';
import 'package:biomark/Comm/getTextFromFields.dart';
import 'package:biomark/screens/SignupView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';
import '../Model/UserProfileModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper();


  }

  login() async {
    String uemail = _conEmail.text;
    String upassword = _conPassword.text;

    if (uemail.isEmpty) {
      alertDialog("Please enter the Email Address");
    }else if(upassword.isEmpty){
      alertDialog("Please enter the Password");
    }else{
      await dbHelper.getLoginUser(uemail, upassword).then((userData) async {
        if(userData != null){
          UserProfileModel userProfile = await dbHelper.getUserProfile(userData.user_email);
          setSP(userData, userProfile).whenComplete((){
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_) => LoginView()),
                    (Route<dynamic> route) => false);
          });

        }else{
          alertDialog("Error: User not Found");
        }

      }).catchError((error){
        print(error);
        alertDialog("Login Failed");
      });
    }
  }

  Future<void> setSP(UserModel user, UserProfileModel userProfile) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_email", user.user_email);

    sp.setString("user_fullname", userProfile.user_fullname ?? '');
    sp.setString("user_dob", userProfile.user_dob ?? '');
    sp.setString("user_childhoodpetname", userProfile.user_childhoodpetname ?? '');
    sp.setString("user_mothermaidenname", userProfile.user_mothermaidenname ?? '');
    sp.setString("user_tob", userProfile.user_tob ?? '');
    sp.setString("user_lob", userProfile.user_lob ?? '');
    sp.setString("user_bloodgroup", userProfile.user_bloodgroup ?? '');
    sp.setString("user_gender", userProfile.user_gender ?? '');
    sp.setString("user_height", (userProfile.user_height ?? '') as String);
    sp.setString("user_ethnicity", userProfile.user_ethnicity ?? '');
    sp.setString("user_eyecolour", userProfile.user_eyecolour ?? '');
    sp.setString("user_ownquestion", userProfile.user_ownquestion ?? '');
    sp.setString("user_answerforownquestion", userProfile.user_answerforownquestion ?? '');
  }


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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => Frogotpasswordemail()));
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
                            onPressed: login,
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
