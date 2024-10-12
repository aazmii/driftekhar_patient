class Patient {
  String? name;
  Gender? gender;
  String? phone;
  DateTime? birthday;
  String? email;
  String? address;
  String? image;
  Patient({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.birthday,
  });
}

enum Gender { male, female, other }
