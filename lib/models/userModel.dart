class User {
  final String gender;
  final Username name;
  final String email;
  final String phone;
  final String nat;

  User(
      {required this.email,
      required this.gender,
      required this.phone,
      required this.nat,
      required this.name});
}

class Username {
  String title;
  String first;
  String last;
  
  Username({
    required this.title,
    required this.first,
    required this.last,
  });
}
