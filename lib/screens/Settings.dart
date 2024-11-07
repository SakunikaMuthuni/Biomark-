import 'package:flutter/material.dart';
import 'package:biomark/screens/EditEmail.dart';
import 'package:biomark/screens/EditPassword.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                'Settings',
                style: TextStyle(
                color: const Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),
              ),
              ],
            ),
           
       
            Text(
              'Edit email/Password',
              style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
              hintText: 'jayathmavidu@gmail.com',
              hintStyle: TextStyle(color: Colors.white),
              enabled: true,
              filled: true,
              fillColor: Colors.grey[900],
              suffixIcon: IconButton(
                icon: const Icon(Icons.edit, color: Colors.grey),
                onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditEmail()),
                );
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              readOnly: true,
              decoration: InputDecoration(
              hintText: '********',
              hintStyle: TextStyle(color: Colors.white),
              enabled: true,
              filled: true,
              fillColor: Colors.grey[900],
              suffixIcon: IconButton(
                icon: const Icon(Icons.edit, color: Colors.grey),
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditPassword()),
                );
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              ),
              style: TextStyle(color: Colors.white),
            ),
                
            SizedBox(height: 32),
            Text(
              'Account Privacy',
              style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you want to discontinue sharing your details to Biomark, '
              'You can simply unsubscribe This and all your information will delete from our databases.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
              onPressed: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                  title: Text('Unsubscribe Confirmation'),
                  content: Text('Are you sure you want to unsubscribe? This action cannot be undone.'),
                  actions: [
                    TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                    ),
                    ElevatedButton(
                    onPressed: () {
                      // Add your unsubscribe logic here
                      
                        Navigator.pushReplacementNamed(context, '/SignupPage');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 246, 83, 72),
                    ),
                    child: Text('Unsubscribe', style: TextStyle(color: Colors.white)),
                    ),
                    ],
                  );
                },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Unsubscribe',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}