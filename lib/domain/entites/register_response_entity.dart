class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.statusMsg,
    this.user,
    this.token,
  });

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
    this.role,
  });

  String? name;
  String? email;
  String? role;
}
