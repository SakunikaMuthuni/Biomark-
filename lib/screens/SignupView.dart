import 'package:biomark/Model/UserProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:biomark/screens/Settings.dart';
import 'package:biomark/screens/LoginView.dart';

import '../Comm/comHelper.dart';
import '../DatabaseHandler/DbHelper.dart';


class SignupView extends StatefulWidget {
  final String uemail;

  const SignupView({super.key, required this.uemail});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = new GlobalKey<FormState>();

  final TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 14);
  final TextStyle inputTextStyle = TextStyle(color: Colors.white);

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

  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();

    // loadUserData();
  }

  signUpView() async {
    String ufullname = _conFullName.text;
    String udob = _conDOB.text;
    String uchildhoodpetname = _conChildhoodPetName.text;
    String umothermaidenName = _conMotherMaidenName.text;
    String utob = _conTOB.text;
    String ulob = _conLOB.text;
    String ubloodgroup = _conBloodGroup.text;
    String ugender = _conGender.text;
    String uheight = _conHeight.text;
    String uethnicity = _conEthnicity.text;
    String ueyecolour = _conEyeColour.text;
    String uownquestion = _conOwnQuestion.text;
    String uanswerforownquestion = _conAnswerForOwnQuestion.text;
    double? uheightParsed = double.tryParse(uheight);

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      bool emailExists = await dbHelper.emailExists(widget.uemail);

      if(emailExists){
        UserProfileModel uProfileModel = UserProfileModel(
            widget.uemail,
            ufullname,
            udob,
            uchildhoodpetname,
            umothermaidenName,
            utob,
            ulob,
            ubloodgroup,
            ugender,
            uheightParsed ?? 0.0,
            uethnicity,
            ueyecolour,
            uownquestion,
            uanswerforownquestion);
        await dbHelper.saveProfileData(uProfileModel).then((userData){
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => LoginView(uemail: widget.uemail)),
                  (Route<dynamic> route) => false);
          alertDialog("Profile Data Successfully Saved");


        }).catchError((error){
          print(error);
          alertDialog("Error: Data Save Fail");
        });

      }else{
        alertDialog("Error: User is not Found.");
      }
    } else {
      alertDialog("Please fill all the fields");
    }
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Welcome to Biomark!',
                style: TextStyle(
                  color: Color.fromARGB(255, 254, 254, 254),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Enter Your Profile Details',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              buildEditableTextField("Full Name", "Enter Your Full Name", _conFullName),
              buildEditableTextField("Date of Birth (Y-M-D)", "Enter Your Date of Birth", _conDOB),
              buildEditableTextField("Time of Birth", "Enter Your Time of Birth", _conTOB),
              buildEditableTextField("Location of Birth", "Enter Your Location of Birth", _conLOB),
              buildEditableTextField("Blood Group", "Enter Your Blood Group", _conBloodGroup),
              buildEditableTextField("Sex", "Enter Your Sex", _conGender),
              buildEditableTextField("Height", "Enter Your Height", _conHeight),
              buildEditableTextField("Ethnicity", "Enter Your Ethnicity", _conEthnicity),
              buildEditableTextField("Eye Colour", "Enter Your Eye Colour", _conEyeColour),
              buildEditableTextField("Mother's Maiden Name", "Enter Your Mother's Maiden Name", _conMotherMaidenName),
              buildEditableTextField("Childhood Pet's Name", "Enter Your Pet's Name", _conChildhoodPetName),
              buildEditableTextField("Your Own Question", "Enter Your Own Question", _conOwnQuestion),
              buildEditableTextField("Answer for Your Own Question", "Enter The Answer for Your Own Question", _conAnswerForOwnQuestion),
              const SizedBox(height: 20),
              const Text(
                'Re - check your details thoroughly as you cannot change them after clicking the save button!',
                style: TextStyle(color: Colors.white60, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF3498DB),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Set the button border radius here
                  ),
                ),
                onPressed: signUpView,
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditableTextField(String labelText, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please $placeholder';
              }

              if(controller == _conDOB){
                DateTime? validDate = DateTime.tryParse(value);
                if (validDate == null) {
                  return 'Please enter a valid date YYYY-MM-DD';
                }
                if (validDate.isAfter(DateTime.now())) {
                  return 'Date of birth must be before today';
                }
              }

              if(controller == _conTOB){
                final timeofbirth = RegExp(r'^(?:[01]\d|2[0-3]):[0-5]\d$');
                if (!timeofbirth.hasMatch(value)) {
                  return 'Please enter a valid time (e.g., HH:mm)';
                }
              }

              if(controller == _conBloodGroup){
                const validBloodTypes = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
                if (!validBloodTypes.contains(value.toUpperCase())) {
                  return 'Please enter a valid blood type (e.g., A+, O-)';
                }
              }

              if(controller == _conHeight){
                final validheight = double.tryParse(value);
                if (validheight == null) {
                  return 'Please enter a valid height (e.g., 160.5) in cm';
                }
              }

              return null;
            },
            onSaved: (val) => controller.text = val ?? '',
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey[700],
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}