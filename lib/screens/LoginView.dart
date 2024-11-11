import 'package:flutter/material.dart';
import 'package:biomark/screens/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DatabaseHandler/DbHelper.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 14);
  final TextStyle inputTextStyle = TextStyle(color: Colors.white);

  var dbHelper;
  final _conEmail = TextEditingController();
  final _conFullName = TextEditingController();
  final _conDOB = TextEditingController();
  final _conChildhoodPetName = TextEditingController();
  final _conMotherMaidenName = TextEditingController();
  final _conTOB = TextEditingController();
  final _conLOB = TextEditingController();
  final _conBloodGroup = TextEditingController();
  final _conGender = TextEditingController();
  final _conHeight = TextEditingController();
  final _conEthnicity = TextEditingController();
  final _conEyeColour = TextEditingController();
  final _conOwnQuestion = TextEditingController();
  final _conAnswerForOwnQuestion = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();

    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      _conEmail.text = sp.getString("user_email") ?? '';
      _conFullName.text = sp.getString("user_fullname") ?? '';
      _conDOB.text = sp.getString("user_dob") ?? '';
      _conChildhoodPetName.text = sp.getString("user_childhoodpetname") ?? '';
      _conMotherMaidenName.text = sp.getString("user_mothermaidenname") ?? '';
      _conTOB.text = sp.getString("user_tob") ?? '';
      _conLOB.text = sp.getString("user_lob") ?? '';
      _conBloodGroup.text = sp.getString("user_bloodgroup") ?? '';
      _conGender.text = sp.getString("user_gender") ?? '';
      _conHeight.text = sp.getString("user_height") ?? '';
      _conEthnicity.text = sp.getString("user_ethnicity") ?? '';
      _conEyeColour.text = sp.getString("user_eyecolour") ?? '';
      _conOwnQuestion.text = sp.getString("user_ownquestion") ?? '';
      _conAnswerForOwnQuestion.text = sp.getString("user_answerforownquestion") ?? '';
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 100,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Biomark',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        
        actions: [
            IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),onPressed: () {},
            ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings(uemail: _conEmail.text)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Welcome Jayathma!',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Your Profile Details',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
             buildTextField("Full Name", _conFullName),
            buildTextField("Date of Birth", _conDOB),
            buildTextField("Time of Birth", _conTOB),
            buildTextField("Location of Birth", _conLOB),
            buildTextField("Blood Group", _conBloodGroup),
            buildTextField("Sex", _conGender),
            buildTextField("Height", _conHeight),
            buildTextField("Ethnicity", _conEthnicity),
            buildTextField("Eye Colour", _conEyeColour),
            buildTextField("Mother's Maiden Name", _conMotherMaidenName),
            buildTextField("Childhood Pet's Name's Name", _conChildhoodPetName),
            buildTextField("Your Own Question", _conOwnQuestion),
            buildTextField("Answer for your Own Question", _conAnswerForOwnQuestion),

          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            enabled: false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey[700],
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: controller.text.isEmpty ? null : controller.text,
              hintStyle: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

}
