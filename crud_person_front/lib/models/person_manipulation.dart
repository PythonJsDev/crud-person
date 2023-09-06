class PersonManipulation {
  final String role;
  final String email;
  final String firstName;
  final String lastName;
  final String address;
  final int zipCode;
  final String city;
  final String approvalRef;

  PersonManipulation({
    required this.role,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.approvalRef});



  Map<String, dynamic> toJson() {
    return {
      "role": role,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "address": address,
      "zip_code": zipCode,
      "city": city,
      "approval_ref": approvalRef,
    };
  }
}