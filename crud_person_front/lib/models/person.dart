class Person {
  final int id;
  final String role;
  final String email;
  final String firstName;
  final String lastName;
  final String address;
  final int zipCode;
  final String city;
  final String approvalRef;

  Person(
      {required this.id,
      required this.role,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.zipCode,
      required this.city,
      required this.approvalRef});

  factory Person.fromJson(Map<String, dynamic> item) {
    return Person(
      id: item['id'],
      role: item['role'],
      email: item['email'],
      firstName: item['first_name'],
      lastName: item['last_name'],
      address: item['address'],
      zipCode: item['zip_code'],
      city: item['city'],
      approvalRef: item['approval_ref'],
    );
  }

}

final Map<String, String> rolesItems = {
  "Titulaire": "I",
  "Piégeur": 'T',
  "Contrôleur": 'C',
};
