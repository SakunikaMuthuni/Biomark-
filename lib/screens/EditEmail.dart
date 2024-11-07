import 'package:flutter/material.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({super.key});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
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
                'Edit Email',
                style: TextStyle(
                color: const Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),
              ),
              ],
            ),
            Text(
              'Current Email',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
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
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'New Email',
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
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle send verification code action
              },
              child: Text(
                'Send Verification Code',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'A verification code will be sent to the new email address',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 60),
            Text(
              'Enter the Verification Code',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
              return SizedBox(
                width: 50,
                height: 80,
                child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 56, 56, 88),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white, fontSize: 18),
                maxLength: 1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 1 && index < 5) {
                  FocusScope.of(context).nextFocus();
                  }
                },
                ),
              );
              }),
            ),
              
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle verify email action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2563EB), // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Verify Email',
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