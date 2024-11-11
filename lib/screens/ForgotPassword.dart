import 'package:biomark/DatabaseHandler/DbHelper.dart';
import 'package:biomark/Model/UserModel.dart';
import 'package:biomark/screens/LoginPage.dart';
import 'package:biomark/screens/SignupView.dart';
import 'package:flutter/material.dart';

import '../Comm/comHelper.dart';
import '../Comm/getTextFromFields.dart';

class Forgotpassword extends StatefulWidget {
  final String uemail;

  const Forgotpassword({super.key, required this.uemail});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _formKey = new GlobalKey<FormState>();

  final _conFullName = TextEditingController();
  final _conDOB = TextEditingController();
  final _conMotherMaidenName = TextEditingController();
  final _conOwnQuestion = TextEditingController();
  final _conAnswerForOwnQuestion = TextEditingController();

  String? _userOwnQuestion;

  @override
  void initState() {
    super.initState();
    _fetchAnswerForOwnQuestion();
  }

  void _fetchAnswerForOwnQuestion() async {
    DbHelper dbHelper = DbHelper();
    String? answer = await dbHelper.getOwnQuestion(widget.uemail);
    setState(() {
      _userOwnQuestion = answer;
      _conAnswerForOwnQuestion.text = _userOwnQuestion ?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RecoverAccount',
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
                      height: MediaQuery.of(context).size.height * 0.85,
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

                          //Recover Account
                          const Text(
                            'Recover Account',
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

                          //Full Name text
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 20.0),

                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Full Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Full Name text input field
                          getTextFromFields(controller: _conFullName ,hintName: 'Enter Your Full Name', inputType: TextInputType.emailAddress),

                          //Date of Birth text
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 20.0),

                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Date of Birth",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Date of Birth text input field
                          getTextFromFields(controller: _conDOB ,hintName: 'Enter Your Date of Birth'),

                          //Mother's Maiden Name text
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 20.0),

                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Mother's Maiden Name",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Mother's Maiden Name text input field
                          getTextFromFields(controller: _conMotherMaidenName ,hintName: "Enter Your Mother's Maiden Name"),

                          //Your Own question
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            margin: const EdgeInsets.only(top: 20.0),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  _conAnswerForOwnQuestion.text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //answer for your own question  text input field
                          getTextFromFields(controller: _conAnswerForOwnQuestion ,hintName: 'Enter the answer for your own question'),

                          //Next button
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
                              onPressed: (){},
                              child: const Text(
                                'Next',
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
                                  "Remeber the Password?",
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
