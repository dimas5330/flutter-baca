class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? profilePicture;
  final String? createdAt;
  final String? updatedAt;
  final String? token;
  final int? tokenExpiresIn;
  final String? tokenType;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.tokenExpiresIn,
    this.tokenType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        profilePicture: json['profile_picture'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        token: json['token'],
        tokenExpiresIn: json['token_expires_in'],
        tokenType: json['token_type'],
      );

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        profilePicture: profilePicture,
        createdAt: createdAt,
        updatedAt: updatedAt,
        token: token,
        tokenExpiresIn: tokenExpiresIn,
        tokenType: tokenType,
      );
}
