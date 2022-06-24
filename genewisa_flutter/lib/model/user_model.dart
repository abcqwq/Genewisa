class User {
  String username;
  String password;
  String firstName;
  String lastName;
  String img;

  User (
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.img,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['username'],
      json['password'],
      json['firstName'],
      json['lastName'],
      json['img'],
    );
  }
}