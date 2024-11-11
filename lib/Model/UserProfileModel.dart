class UserProfileModel {
  String? user_email;
  String? user_fullname;
  String? user_dob;
  String? user_childhoodpetname;
  String? user_mothermaidenname;
  String? user_tob;
  String? user_lob;
  String? user_bloodgroup;
  String? user_gender;
  String? user_ethnicity;
  String? user_eyecolour;
  String? user_ownquestion;
  String? user_answerforownquestion;
  double? user_height;

  UserProfileModel(
      this.user_email,
      this.user_fullname,
      this.user_dob,
      this.user_childhoodpetname,
      this.user_mothermaidenname,
      this.user_tob,
      this.user_lob,
      this.user_bloodgroup,
      this.user_gender,
      this.user_height,
      this.user_ethnicity,
      this.user_eyecolour,
      this.user_ownquestion,
      this.user_answerforownquestion,
      );

  Map<String, dynamic> toMap() {
    return {
      'user_email': user_email,
      'user_fullname': user_fullname,
      'user_dob': user_dob,
      'user_childhoodpetname': user_childhoodpetname,
      'user_mothermaidenname': user_mothermaidenname,
      'user_tob': user_tob,
      'user_lob': user_lob,
      'user_bloodgroup': user_bloodgroup,
      'user_gender': user_gender,
      'user_height': user_height,
      'user_ethnicity': user_ethnicity,
      'user_eyecolour': user_eyecolour,
      'user_ownquestion': user_ownquestion,
      'user_answerforownquestion': user_answerforownquestion,
    };
  }

  UserProfileModel.fromMap(Map<String, dynamic> map) {
    user_email = map['user_email'];
    user_fullname = map['user_fullname'];
    user_dob = map['user_dob'];
    user_childhoodpetname = map['user_childhoodpetname'];
    user_mothermaidenname = map['user_mothermaidenname'];
    user_tob = map['user_tob'];
    user_lob = map['user_lob'];
    user_bloodgroup = map['user_bloodgroup'];
    user_gender = map['user_gender'];
    user_height = (map['user_height'] != null ? (map['user_height'] as num).toDouble() : null);
    user_ethnicity = map['user_ethnicity'];
    user_eyecolour = map['user_eyecolour'];
    user_ownquestion = map['user_ownquestion'];
    user_answerforownquestion = map['user_answerforownquestion'];
  }
}
