class UserEditFormModel {
  final String? name;
  final String? email;

  UserEditFormModel({
    this.name,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
