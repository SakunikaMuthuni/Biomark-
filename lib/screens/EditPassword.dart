import 'package:flutter/material.dart';

class EditPassword extends StatefulWidget {
  const EditPassword ({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
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
          IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                Navigator.of(context).pop();
                },
              ),
              Text(
                'Edit Password',
                style: TextStyle(
                color: const Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),
              ),
              ],
            ),
            
             SizedBox(height: 30),
            Text(
              'Current Email',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the Current Email Address',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF1F1F30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true, // Password input
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            Text(
              'New Password',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the New Email Address',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF1F1F30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true, // Password input
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            Text(
              'Re - Enter New Password',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter the New Email Address',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF1F1F30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true, // Password input
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle set password action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2563EB), // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                
                child: Text(
                  'Set Password',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}