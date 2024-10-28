class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? profilePicture;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'profile_picture': profilePicture,
    };
  }

  SignUpFormModel copyWith({
    String? profilePicture,
  }) =>
      SignUpFormModel(
        name: name,
        email: email,
        password: password,
        profilePicture: profilePicture ?? this.profilePicture,
      );
}
