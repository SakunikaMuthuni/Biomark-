import 'package:flutter/material.dart';
import 'package:biomark/screens/Settings.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            icon: Icon(Icons.notifications, color: Colors.white),onPressed: () {},
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
              'Welcome Jayathma!',
              style: TextStyle(
                color: const Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Your Profile Details',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildTextField("Full Name", "Jayathma Perera"),
            buildTextField("Date of Birth", "2001.03.20"),
            buildTextField("Time of Birth", "2001.03.20"),
            buildTextField("Location of Birth", "2001.03.20"),
            buildTextField("Blood Group", "2001.03.20"),
            buildTextField("Sex", "2001.03.20"),
            buildTextField("Height", "2001.03.20"),
            buildTextField("Ethnicity", "2001.03.20"),
            buildTextField("Eye Colour", "2001.03.20"),
            buildTextField("Mother's Maiden Name", "Alahakoon"),
            buildTextField("Childhood Best Friend's Name", "Amaya"),
            buildTextField("Childhood Pet's Name", "Tutu"),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
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
            enabled: false,
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
