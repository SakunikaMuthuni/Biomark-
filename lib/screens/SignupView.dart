import 'package:flutter/material.dart';
import 'package:biomark/screens/Settings.dart';
import 'package:biomark/screens/LoginView.dart';


class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 14);
  final TextStyle inputTextStyle = TextStyle(color: Colors.white);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 100,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Biomark',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
  
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Welcome to Biomark!',
              style: TextStyle(
                color: const Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter Your Profile Details',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildEditableTextField("Full Name", "Enter Your Full Name"),
            buildEditableTextField("Date of Birth", "Enter Your Date of Birth"),
            buildEditableTextField("Time of Birth", "Enter Your Time of Birth"),
            buildEditableTextField("Location of Birth", "Enter Your Location of Birth"),
            buildEditableTextField("Blood Group", "Enter Your Blood Group"),
            buildEditableTextField("Sex", "Enter Your Sex"),
            buildEditableTextField("Height", "Enter Your Height"),
            buildEditableTextField("Ethnicity", "Enter Your Ethnicity"),
            buildEditableTextField("Eye Colour", "Enter Your Eye Colour"),
            buildEditableTextField("Mother's Maiden Name", "Enter Your Mother's Maiden Name"),
            buildEditableTextField("Childhood Best Friend's Name", "Enter Your Best Friend's Name"),
            buildEditableTextField("Childhood Pet's Name", "Enter Your Pet's Name"),
            buildEditableTextField("Your Own Question", "Enter Your Question"),
            SizedBox(height: 20),
            Text(
              'Re - check your details thoroughly as you cannot change them after clicking the save button!',
              style: TextStyle(color: Colors.white60, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey[700],
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: placeholder,
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}