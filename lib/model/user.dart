class User {
  String firstname;
  String lastname;
  String email;
  String phone;
  String photo;
  String largePhoto;
  int age;

  User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.photo,
    required this.largePhoto,
    required this.age,
  });

  User.fromJson(Map json)
      : firstname = json['name']['first'],
        lastname = json['name']['last'],
        email = json['email'],
        phone = json['phone'],
        photo = json['picture']['medium'],
        largePhoto = json['picture']['large'],
        age = json['dob']['age'];

  Map toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'photo': photo,
      'largePhoto': largePhoto,
      'age': age,
    };
  }
}
