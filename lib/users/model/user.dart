class User {
  String user_name;
  String user_surname;
  String user_gender;
  String user_email;
  String user_password;

  User(this.user_name, this.user_surname, this.user_gender, this.user_email,
      this.user_password);

  factory User.fromJson(Map<String, dynamic> json) => User(
        json["user_name"],
        json["user_surname"],
        json["user_gender"],
        json["user_email"],
        json["user_password"],
      );

  Map<String, dynamic> toJson() => {
        'user_name': user_name.toString(),
        'user_surname': user_surname.toString(),
        'user_gender': user_gender.toString(),
        'user_email': user_email.toString(),
        'user_password': user_password.toString()
      };
}
