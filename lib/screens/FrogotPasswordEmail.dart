import 'package:biomark/DatabaseHandler/DbHelper.dart';
import 'package:biomark/screens/ForgotPassword.dart';
import 'package:flutter/material.dart';

import '../Comm/comHelper.dart';
import '../Comm/getTextFromFields.dart';

class Frogotpasswordemail extends StatefulWidget {
  const Frogotpasswordemail({super.key});

  @override
  State<Frogotpasswordemail> createState() => _FrogotpasswordemailState();
}

class _FrogotpasswordemailState extends State<Frogotpasswordemail> {
  final _formKey = GlobalKey<FormState>();
  final _conEmail = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  Future<void> searchEmail() async {
    String uemail = _conEmail.text;

    if (_formKey.currentState!.validate()) {
      bool emailExists = await dbHelper.emailExists(uemail);

      if (emailExists) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Forgotpassword(uemail: uemail)),
        );
        alertDialog("Email is Found.");
      } else {
        alertDialog("Error: Email is not Found");
      }
    } else {
      alertDialog("Please enter a valid email.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Account Email',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 12.0,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      // Body container with background image
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,  // Attach the formKey to the form
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
                      height: MediaQuery.of(context).size.height * 0.20,
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
                          // Search text
                          const Text(
                            'Search Email',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),

                          SizedBox(
                            width: 100,
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),

                          // Email address text field
                          getTextFromFields(controller: _conEmail, hintName: 'Enter Your Email Address'),

                          // Search button
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              onPressed: () {
                                searchEmail();
                              },
                              child: const Text(
                                'Search',
                                style: TextStyle(color: Colors.white),
                              ),
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
