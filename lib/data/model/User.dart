class User {

  int id;
  String email;
  String password;
  String role;
  String firstName;
  String lastName;

  User({this.id, this.email, this.firstName, this.lastName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}